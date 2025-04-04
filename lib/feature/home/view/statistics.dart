part of 'home.screen.dart';

class _Statistics extends StatelessWidget {
  const _Statistics();

  @override
  Widget build(BuildContext context) {
    final statistics = context.watch<HomeCubit>().statistics;
    return SingleChildScrollView(
      child: Column(
        children: [
          _Item(
            title: 'Les sources',
            value: statistics.totalSources,
            onTap: () => context.to(SourceRoute()),
          ),
          _Item(
            title: 'Les domaines',
            value: statistics.totalDomain,
            onTap: () => context.to(DomainRoute()),
          ),
          _Item(
            title: 'Les examens',
            value: statistics.totalExam,
            onTap: () => context.to(ExamRoute()),
          ),
          _Item(
            title: 'Les questions',
            value: statistics.totalQuestion,
            onTap: () => context.to(QuestionListRoute()),
          ),
          _Item(
            title: 'Utilisateurs',
            value: statistics.totalUser,
            onTap: () {
              context.to(UserRoute());
            },
          ),
          _Item(
            title: 'Utilisateurs abonnés',
            value: statistics.totalSubscribedUser,
            onTap: () {},
          ),
          _Item(
            title: 'Les offres',
            onTap: () => context.to(SubscriptionOfferRoute.offers()),
          ),
          _Item(
            title: 'Les demandes d\'abonnement',
            onTap: () => context.to(SubscriptionRequestRoute()),
          ),
          _Item(
            title: 'Les abonnements',
            onTap: () => context.to(SubscriptionRoute()),
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.title,
    this.value,
    required this.onTap,
  });

  final String title;
  final num? value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: AppColors.primary,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: AppColors.primaryDark,
                  fontSize: 22.spMin,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              value != null ? value.toString() : '',
              style: TextStyle(
                color: AppColors.primaryDark,
                fontSize: 30.spMin,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.primaryDark,
            ),
          ],
        ),
      ),
    );
  }
}
