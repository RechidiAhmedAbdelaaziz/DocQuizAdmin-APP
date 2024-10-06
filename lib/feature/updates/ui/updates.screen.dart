import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/feature/updates/data/model/updates.model.dart';
import 'package:admin_app/feature/updates/helper/update.route.dart';
import 'package:admin_app/feature/updates/logic/updtes.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UpdatesCubit>();
    final updates = context.watch<UpdatesCubit>().state.updates;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Updates'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => context
                  .to<UpdatesModel>(UpdatesRoute.create(cubit)),
            ),
          ],
        ),
        body: Column(
          children: [
            if (updates.isEmpty)
              const Center(
                child: Text('No updates found'),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: updates.length,
                  itemBuilder: (context, index) {
                    final update = updates[index];
                    return InkWell(
                      onTap: () => context.to<UpdatesModel>(
                        UpdatesRoute.update(update, cubit),
                      ),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 16.w),
                        padding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 16.w),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              update.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              update.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 16),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                update.formattedDate,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ));
  }
}
