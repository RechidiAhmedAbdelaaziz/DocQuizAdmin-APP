part of 'home.screen.dart';

class _Statistics extends StatelessWidget {
  const _Statistics();

  @override
  Widget build(BuildContext context) {
    final statistics = context.watch<HomeCubit>().statistics;
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              _Item(
                title: 'Les sources',
                value: statistics.totalSources,
                color: Colors.blue,
                onTap: () => context.to(SourceRoute()),
              ),
              _Item(
                title: 'Les domaines',
                value: statistics.totalDomain,
                color: Colors.pink,
                onTap: () => context.to(DomainRoute()),
              ),
            ],
          ),
          height(15),
          Row(
            children: [
              _Item(
                title: 'Les examens',
                value: statistics.totalExam,
                color: Colors.green,
                onTap: () => context.to(ExamRoute()),
              ),
              _Item(
                title: 'Les questions',
                value: statistics.totalQuestion,
                color: Colors.orange,
                onTap: () => context.to(QuestionListRoute()),
              ),
            ],
          ),
          height(15),
          Row(
            children: [
              _Item(
                title: 'Utilisateurs',
                value: statistics.totalUser,
                color: Colors.purple,
                onTap: () {
                  context.to(UserRoute());
                },
              ),
              _Item(
                title: 'Utilisateurs abonnés',
                value: statistics.totalSubscribedUser,
                color: Colors.red,
                onTap: () {},
              ),
            ],
          ),
          height(15),
          Row(
            children: [
              _Item(
                title: 'Les offres',
                value: null,
                color: Colors.yellow,
                onTap: () =>
                    context.to(SubscriptionOfferRoute.offers()),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(
      {required this.title,
      required this.value,
      required this.onTap,
      required this.color});

  final String title;
  final num? value;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          // width: double.infinity,
          height: 200.h,
          margin:
              EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.spMin,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                value != null ? value.toString() : '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.spMin,
                  fontWeight: FontWeight.bold,
                ),
              ),
              height(12),
            ],
          ),
        ),
      ),
    );
  }
}
