part of 'create_exam.screen.dart';

class _Form extends StatelessWidget {
  _Form(
    this._formKey,
    this._cityController,
    this._majorController,
    this._yearController,
    this._houreController,
    this._minuteController,
  );

  final TextEditingController _cityController;
  final TextEditingController _majorController;
  final TextEditingController _yearController;
  final TextEditingController _houreController;
  final TextEditingController _minuteController;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildTitle('City'),
          context.showSingleItemDropDown(
            data: _cities,
            controller: _cityController,
            validator: (city) => city.isValidString,
          ),
          height(12),
          _buildTitle('Year'),
          context.showSingleItemDropDown(
            data: _years(),
            controller: _yearController,
            validator: (year) => year.isValidString,
          ),
          height(12),
          _buildTitle('Major'),
          _buildMajorField(),
          height(12),
          _buildTitle('Time'),
          Row(
            children: [
              Expanded(
                child: context.showSingleItemDropDown(
                  data:
                      List.generate(24, (index) => index.toString()),
                  controller: _houreController,
                  hintText: 'Hour',
                  validator: (hour) => hour.isValidString,
                ),
              ),
              width(12),
              Expanded(
                child: context.showSingleItemDropDown(
                  data:
                      List.generate(60, (index) => index.toString()),
                  controller: _minuteController,
                  hintText: 'Minute',
                  validator: (minute) => minute.isValidString,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding _buildMajorField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
      child: TextFormField(
        controller: _majorController,
        validator: (value) => value.isValidString,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
          alignLabelWithHint: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 0,
              color: Colors.black26,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Row(
      children: [
        width(25),
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // algeria wilayas
  final _cities = [
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
    'Bordj Bou Arréridj',
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

  // years from 2000 to now year
  List<String> _years() {
    final now = DateTime.now();
    final years = <String>[];
    for (var i = 2000; i <= now.year; i++) {
      years.add(i.toString());
    }
    return years;
  }
}
