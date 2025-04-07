part of '../question_screen.dart';

class _SourceField extends StatelessWidget {
  const _SourceField();

  @override
  Widget build(BuildContext context) {
    final dtosController =
        context.read<QuestionCubit>().dto.sourcesController;
    return MultiModelSelector(
      controller: dtosController,
      title: 'Sources',
      isRequired: true,
      itemsBuilder: (_, dtos) {
        return Column(
          spacing: 8.w,
          // runSpacing: 8.h,
          children: [
            for (final dto in dtos)
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 8.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: AppColors.grey),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        dto.sourceController.value?.name ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.medium,
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: dto.yearController,
                      builder: (_, year, __) {
                        return DropdownMenu(
                          initialSelection: year,
                          onSelected: (value) {
                            dto.yearController.value = value;
                          },
                          dropdownMenuEntries: [
                            for (var i = 2000;
                                i <= DateTime.now().year;
                                i++)
                              DropdownMenuEntry(
                                label: i.toString(),
                                value: i.toString(),
                              ),
                          ],
                        );
                      },
                    ),
                    IconButton(
                      onPressed: () =>
                          dtosController.removeValue(dto),
                      icon: Icon(Icons.delete, color: AppColors.red),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
      selector: () => _SourceForm(),
    );
  }
}

class _SourceForm extends StatelessWidget {
  const _SourceForm();

  @override
  Widget build(BuildContext context) {
    return SourceSelector(
      onSelect: (source) {
        context.back(
          SourceDTO(
            SourceYear(source: source, year: DateTime.now().year),
          ),
        );
      },
    );
  }
}
