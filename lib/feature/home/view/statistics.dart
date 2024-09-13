part of 'home.screen.dart';

class _Statistics extends StatelessWidget {
  const _Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    final statistics = context.watch<HomeCubit>().statistics;
    final isLoading = context.select((HomeCubit cubit) => cubit.state
        .maybeWhen(orElse: () => false, loading: () => true));
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Column(
            children: [
              height(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatCard(
                    title: 'Total Modules',
                    value: statistics.totalMajor.toString(),
                    icon: Icons.star,
                    onTap: () => context.to(DomainRoute()),
                  ),
                  _buildStatCard(
                    title: 'Total Exams',
                    value: statistics.totalExam.toString(),
                    icon: Icons.book,
                    onTap: () => context.to(ExamRoute()),
                  ),
                ],
              ),
              height(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatCard(
                    title: 'Total Questions',
                    value: statistics.totalQuestion.toString(),
                    icon: Icons.question_answer,
                    onTap: () => context.to(QuestionListRoute()),
                  ),
                  _buildStatCard(
                    title: 'Total Users',
                    value: statistics.totalUser.toString(),
                    icon: Icons.person,
                  ),
                ],
              )
            ],
          );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    void Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 180.w,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey[200],
              child: Icon(
                icon,
                size: 30,
                color: Colors.blueAccent,
              ),
            ),
            height(16),
            Text(
              title,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
