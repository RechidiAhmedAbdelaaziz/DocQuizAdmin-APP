// ignore_for_file: must_be_immutable

part of 'question.screen.dart';

class _SelectSource extends StatefulWidget {
  _SelectSource(this._source, {super.key});

  ExamModel? _source;

  @override
  State<_SelectSource> createState() => _SelectSourceState();
}

class _SelectSourceState extends State<_SelectSource> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExamCubit()..fetchExams(),
      child: Builder(builder: (context) {
        final exams = context.watch<ExamCubit>().exams;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ' Source',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            height(8),
            Row(
              children: [
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 7),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    widget._source?.title ?? 'Select Source',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )),
                _buildEditButton(context, exams),
                if (widget._source != null)
                  _buildRestoreButton(context),
              ],
            ),
          ],
        );
      }),
    );
  }

  IconButton _buildRestoreButton(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            widget._source = null;
          });
          context.read<QuestionCubit>().setSource('');
        },
        icon: const Icon(Icons.cancel));
  }

  IconButton _buildEditButton(
      BuildContext context, List<ExamModel> exams) {
    return IconButton(
        onPressed: () {
          context.showBottomSheet(
            child: PaginationBuilder(
                onFetch: context.read<ExamCubit>().fetchExams,
                builder: (loadingWidget) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      height(12),
                      Text(
                        'Select Source',
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      height(12),
                      ...exams.map(
                        (e) => InkWell(
                            onTap: () {
                              setState(() {
                                widget._source = e;
                              });
                              context
                                  .read<QuestionCubit>()
                                  .setSource(e.id!);
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 7),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius:
                                    BorderRadius.circular(12),
                              ),
                              margin:
                                  const EdgeInsets.only(bottom: 12),
                              child: Text(
                                e.title!,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            )),
                      ),
                      loadingWidget,
                    ],
                  );
                }),
          );
        },
        icon: const Icon(Icons.edit));
  }
}
