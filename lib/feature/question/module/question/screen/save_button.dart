part of 'question.screen.dart';

class _SaveButton extends StatelessWidget {
  const _SaveButton(
    this._question,
  ) : _isExist = _question != null;

  final QuestionModel? _question;
  final bool _isExist;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionCubit, QuestionState>(
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          creatingQuestion: () => true,
          updatingQuestion: () => true,
          orElse: () => false,
        );
        return InkWell(
            onTap: () {
              if (_isExist) {
                context
                    .read<QuestionCubit>()
                    .updateQuestion(_question!);
              } else {
                context.read<QuestionCubit>().createQuestion();
              }
              
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              margin: EdgeInsets.symmetric(
                  vertical: 5.h, horizontal: 40.w),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Center(
                child: isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                        _isExist ? 'Update' : 'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ));
      },
    );
  }
}
