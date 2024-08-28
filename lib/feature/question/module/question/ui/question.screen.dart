import 'package:admin_app/feature/question/data/models/question.model.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key, QuestionModel? question})
      : _question = question;

  final QuestionModel? _question;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
