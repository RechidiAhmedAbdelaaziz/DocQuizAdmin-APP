part of 'home.screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({required Widget statistics})
      : _statistics = statistics;

  final Widget _statistics;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.tips_and_updates_outlined),
            onPressed: () => context.to(UpdatesRoute()),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () =>
                context.read<HomeCubit>().fetchStatistics(),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: context.read<HomeCubit>().fetchStatistics,
        child: _statistics,
      ),
    );
  }
}
