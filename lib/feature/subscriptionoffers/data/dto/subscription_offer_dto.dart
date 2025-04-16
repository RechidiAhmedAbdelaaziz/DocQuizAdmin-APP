import 'package:admin_app/core/extension/list.extension.dart';
import 'package:admin_app/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:admin_app/core/shared/classes/editioncontollers/list_generic_editingcontroller.dart';
import 'package:admin_app/core/shared/dto/form_dto.dart';
import 'package:admin_app/feature/domain/data/model/domain.model.dart';
import 'package:admin_app/feature/level/data/models/level.model.dart';
import 'package:admin_app/feature/subscriptionoffers/data/models/subscription_offer_model.dart';
import 'package:flutter/widgets.dart';

abstract class SubscriptionOfferDto extends FormDTO {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController priceController;
  final EditingController<DomainModel> domainController;
  final ListEditingController<LevelModel> levelsController;
  final EditingController<DateTime> endDateController;

  SubscriptionOfferDto({
    required this.titleController,
    required this.descriptionController,
    required this.priceController,
    required this.domainController,
    required this.levelsController,
    required this.endDateController,
  });

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    domainController.dispose();
    levelsController.dispose();
  }
}

class CreateSubscriptionOfferDto extends SubscriptionOfferDto {
  CreateSubscriptionOfferDto()
      : super(
          titleController: TextEditingController(),
          descriptionController: TextEditingController(),
          priceController: TextEditingController(),
          domainController: EditingController<DomainModel>(),
          levelsController: ListEditingController<LevelModel>(),
          endDateController:
              EditingController<DateTime>(DateTime.now()),
        );

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      'title': titleController.text,
      'description': descriptionController.text,
      'price': int.parse(priceController.text),
      'domainId': domainController.value?.id,
      'levels': levelsController.value.map((e) => e.id).toList(),
      'endDate': endDateController.value!.toIso8601String(),
    };
  }
}

class UpdateSubscriptionOfferDto extends SubscriptionOfferDto {
  final SubscriptionOfferModel _model;
  UpdateSubscriptionOfferDto(this._model)
      : super(
          titleController: TextEditingController(text: _model.title),
          descriptionController:
              TextEditingController(text: _model.description),
          priceController:
              TextEditingController(text: _model.price.toString()),
          domainController:
              EditingController<DomainModel>(_model.domain),
          levelsController: ListEditingController<LevelModel>(
            _model.levels,
          ),
          endDateController: EditingController<DateTime>(
            _model.endDate ?? DateTime.now(),
          ),
        );

  String get id => _model.id!;

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      if (_model.title != titleController.text)
        'title': titleController.text,
      if (_model.description != descriptionController.text)
        'description': descriptionController.text,
      if (_model.price != int.parse(priceController.text))
        'price': int.parse(priceController.text),
      if (_model.domain != domainController.value)
        'domain': domainController.value?.id,
      if (!_model.levels.equals(levelsController.value))
        'levels': levelsController.value.map((e) => e.id).toList(),
      if (_model.endDate != endDateController.value)
        'endDate': endDateController.value!.toIso8601String(),
    };
  }
}
