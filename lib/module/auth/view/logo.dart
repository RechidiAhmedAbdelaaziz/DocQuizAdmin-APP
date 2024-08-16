part of 'login.screen.dart';

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430.w,
      height: 347.h,
      decoration: BoxDecoration(
        color: AppColors.duckEggBlue,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
