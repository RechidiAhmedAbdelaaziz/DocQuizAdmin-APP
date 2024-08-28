import 'package:admin_app/feature/question/module/questionlist/logic/question_list.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'scaffold.dart';
part 'filter_button.dart';

class QuestionsListScreen extends StatelessWidget {
  const QuestionsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _Scaffold(
      filterButton: IconButton(
        icon: const Icon(Icons.filter_list),
        onPressed: () {},
      ),
      questionList: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Question $index'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      listener: (context, state) {},
    );
  }
}
