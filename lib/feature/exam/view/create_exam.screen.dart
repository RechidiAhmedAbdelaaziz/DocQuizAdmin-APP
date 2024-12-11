import 'package:admin_app/core/extension/bottomsheet.extension.dart';
import 'package:admin_app/core/extension/dropdown.extension.dart';
import 'package:admin_app/core/extension/navigator.extension.dart';
import 'package:admin_app/core/shared/widget/space.widget.dart';
import 'package:admin_app/feature/domain/data/model/domain.model.dart';
import 'package:admin_app/feature/domain/ui/domain_selector.dart';
import 'package:admin_app/feature/exam/data/models/create_exam.param.dart';
import 'package:admin_app/feature/exam/data/models/exam.model.dart';
import 'package:admin_app/feature/major/data/models/major.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateExamScreen extends StatefulWidget {
  CreateExamScreen({super.key, ExamModel? exam})
      : params = CreateExamParam(exam: exam),
        isEdit = exam != null;

  final CreateExamParam params;
  final bool isEdit;

  @override
  State<CreateExamScreen> createState() => _CreateExamScreenState();
}

class _CreateExamScreenState extends State<CreateExamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.isEdit ? 'Modifier examen' : 'Créer examen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            __buildLabel('Type:'),
            context.showSingleItemDropDown(
              controller: widget.params.type,
              data: [
                'Externat',
                'Résidanat',
                'Résidanat blanc',
                'Ratrappage',
              ],
              onChanged: (value) {
                setState(() {
                  if (value == 'Résidanat' ||
                      value == 'Résidanat blanc') {
                    widget.params.group.text = '';
                    widget.params.major = null;
                  } else {
                    widget.params.domain = null;
                  }
                });
              },
            ),
            height(22),
            Row(
              children: [
                __buildLabel(
                  widget.params.isResidanat ? 'Domaine:' : 'Module:',
                ),
                if ((widget.params.isResidanat &&
                        widget.params.domain != null) ||
                    widget.params.major != null)
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 22.w, vertical: 12.h),
                    child: Text(
                      widget.params.isResidanat
                          ? widget.params.domain!.name!
                          : widget.params.major!.name!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 22.spMin,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                IconButton(
                  onPressed: () async {
                    if (widget.params.isResidanat) {
                      final domain =
                          await context.showBottomSheet<DomainModel>(
                        child: const DomainSelector<DomainModel>(),
                      );
                      if (domain != null) {
                        setState(
                            () => widget.params.setDomain(domain));
                      }
                      return;
                    }

                    final module =
                        await context.showBottomSheet<MajorModel>(
                      child: const DomainSelector<MajorModel>(),
                    );
                    if (module != null) {
                      setState(() => widget.params.setMajor(module));
                    }
                  },
                  icon: const Icon(Icons.edit),
                ),
              ],
            ),

            __buildLabel('Ville:'),
            context.showSingleItemDropDown(
              controller: widget.params.city,
              data: WILLAYAS,
            ),
            if (!widget.params.isResidanat) ...{
              __buildLabel('Groupe:'),
              context.showSingleItemDropDown(
                controller: widget.params.group,
                data: [
                  '',
                  for (var i = 1; i <= 35; i++) 'P$i',
                ],
              )
            },
            __buildLabel('Année:'),
            context.showSingleItemDropDown(
              controller: widget.params.year,
              data: [
                '0',
                for (var i = 2000; i <= DateTime.now().year + 2; i++)
                  i.toString(),
              ],
            ),
            __buildLabel('Temps:'),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text('Heures'),
                      context.showSingleItemDropDown(
                        controller: widget.params.hours,
                        data: [
                          for (var i = 0; i < 10; i++) i.toString()
                        ],
                      ),
                    ],
                  ),
                ),
                width(8),
                Expanded(
                  child: Column(
                    children: [
                      const Text('Minutes'),
                      context.showSingleItemDropDown(
                        controller: widget.params.minutes,
                        data: [
                          for (var i = 0; i < 60; i++) i.toString()
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // save button
            InkWell(
              onTap: () => context.back(widget.params),
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: 22.w, vertical: 12.h),
                padding: EdgeInsets.symmetric(vertical: 12.h),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  widget.isEdit ? 'Modifier' : 'Créer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.spMin,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget __buildLabel(String label) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18.spMin,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// tout willayas de l'algérie sous forme de liste (Adrar, chlef, laghouat, ...)
const WILLAYAS = [
  'Adrar',
  'Chlef',
  'Laghouat',
  'Oum El Bouaghi',
  'Batna',
  'Béjaïa',
  'Biskra',
  'Béchar',
  'Blida',
  'Bouira',
  'Tamanrasset',
  'Tébessa',
  'Tlemcen',
  'Tiaret',
  'Tizi Ouzou',
  'Alger',
  'Djelfa',
  'Jijel',
  'Sétif',
  'Saïda',
  'Skikda',
  'Sidi Bel Abbès',
  'Annaba',
  'Guelma',
  'Constantine',
  'Médéa',
  'Mostaganem',
  'M\'Sila',
  'Mascara',
  'Ouargla',
  'Oran',
  'El Bayadh',
  'Illizi',
  'Bordj Bou Arreridj',
  'Boumerdès',
  'El Tarf',
  'Tindouf',
  'Tissemsilt',
  'El Oued',
  'Khenchela',
  'Souk Ahras',
  'Tipaza',
  'Mila',
  'Aïn Defla',
  'Naâma',
  'Aïn Témouchent',
  'Ghardaïa',
  'Relizane',
];
