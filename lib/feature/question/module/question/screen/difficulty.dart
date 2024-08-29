part of 'question.screen.dart';

class _Difficulty extends StatelessWidget {
  const _Difficulty({super.key});

  @override
  Widget build(BuildContext context) {
    final currentDifficulty =
        context.watch<QuestionCubit>().details.difficulty;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ...["easy", "medium", "hard"].map(
          (difficulty) {
            return _buildDifficultyButton(
              title: difficulty,
              isSelected: currentDifficulty == difficulty,
              color: difficulty == "easy"
                  ? Colors.green
                  : difficulty == "medium"
                      ? Colors.orange
                      : Colors.red,
              onSelected: () {
                context
                    .read<QuestionCubit>()
                    .setDifficulty(difficulty);
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildDifficultyButton({
    required String title,
    required bool isSelected,
    required Color color,
    required VoidCallback onSelected,
  }) {
    return InkWell(
      onTap: onSelected,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: color),
        ),
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            fontSize: 16.sp,
            color: isSelected ? Colors.white : color,
            fontWeight:
                isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
