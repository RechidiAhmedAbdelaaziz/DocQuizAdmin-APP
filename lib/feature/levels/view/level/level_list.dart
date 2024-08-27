part of 'level.screen.dart';

class _LevelList extends StatelessWidget {
  const _LevelList();

  @override
  Widget build(BuildContext context) {
    final levels = context.watch<LevelCubit>().levels;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: levels
          .map((level) => _buildItem(
                level.name!,
                () => context.to(MajorRoute(level.name!)),
              ))
          .toList(),
    );
  }

  Widget _buildItem(String name, void Function() showMajors) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.school, size: 30),
          const Spacer(),
          Text(
            name,
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: showMajors,
            icon: const Icon(Icons.arrow_forward_ios, size: 20),
          ),
        ],
      ),
    );
  }
}
