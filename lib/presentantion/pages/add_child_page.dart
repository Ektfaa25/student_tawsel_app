import 'package:flutter/material.dart';
import 'package:student_tawsel/generated/l10n.dart';
import 'package:student_tawsel/presentantion/widgets/add_button_widget.dart';
import 'package:student_tawsel/presentantion/widgets/app_bar_back_ground_widget.dart';
import 'package:student_tawsel/presentantion/widgets/avatar_widget.dart';

class AddChildPage extends StatefulWidget {
  const AddChildPage({super.key});

  @override
  State<AddChildPage> createState() => _AddChildPageState();
}

class _AddChildPageState extends State<AddChildPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String? selectedGender = 'Male';
  String? selectedLevel = 'First';
  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          S.of(context).child,
        ),
        centerTitle: true,
        flexibleSpace: const AppBarBackGroundWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(23),
        child: Column(
          children: [
            const Center(child: AvatarWidget()),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _createformfield(
                  controller: nameController,
                  label: 'Name',
                  value: 'Mohammed',
                ),
                _createformfield(
                  controller: idController,
                  label: 'ID',
                  value: '254377572',
                ),
                _createdropdownfield(
                  label: 'Gender',
                  context: context,
                  formvalue: selectedGender,
                  items: ['Male', 'Female'],
                  onChanged: (value) => setState(() => selectedGender = value),
                ),
                _createdropdownfield(
                  label: 'Level',
                  context: context,
                  formvalue: selectedLevel,
                  items: ['First', 'Second', 'Third'],
                  onChanged: (value) => setState(() => selectedLevel = value),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Date of Birthday',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    _createdropdownfield(
                      formvalue: selectedMonth,
                      hint: 'MM',
                      context: context,
                      items: List.generate(12, (index) => '${index + 1}'),
                      onChanged: (value) =>
                          setState(() => selectedMonth = value),
                    ),
                    _createdropdownfield(
                      formvalue: selectedDay,
                      hint: 'DD',
                      context: context,
                      items: List.generate(31, (index) => '${index + 1}'),
                      onChanged: (value) => setState(() => selectedDay = value),
                    ),
                    _createdropdownfield(
                      formvalue: selectedYear,
                      hint: 'YYYY',
                      context: context,
                      items: List.generate(
                          50, (index) => '${DateTime.now().year - index}'),
                      onChanged: (value) =>
                          setState(() => selectedYear = value),
                    ),
                  ],
                ),
                _createformfield(
                  controller: phoneController,
                  label: 'Phone',
                  value: '+966',
                ),
              ],
            )),

            //add button
            AddButtonWidget(
                nameController: nameController,
                idController: idController,
                selectedLevel: selectedLevel),
          ],
        ),
      ),
    );
  }
}

Widget _createformfield({
  required TextEditingController controller,
  required String label,
  required String value,
}) {
  controller.text = value;
  return Card(
    elevation: 4,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(4),
      ),
    ),
    margin: const EdgeInsets.all(8),
    color: Colors.white,
    child: TextFormField(
      style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          fontFamily: "Tajawal",
          color: Color(0xff2D2D2D)),
      controller: controller,
      decoration: InputDecoration(
          labelStyle: const TextStyle(
              fontSize: 12, fontFamily: "Tajawal", color: Color(0xff9B9B9B)),
          labelText: label,
          suffixIcon: label == "Phone"
              ? null
              : const Icon(Icons.check, color: Colors.green),
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ))),
    ),
  );
}

Widget _createdropdownfield({
  String? formvalue,
  required List<String> items,
  required ValueChanged<String?> onChanged,
  String? hint,
  String label = '',
  required BuildContext context,
}) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(2),
      child: Card(
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        color: Colors.white,
        child: DropdownButtonFormField(
          decoration: InputDecoration(
              labelStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: const Color(0xff2D2D2D),
                  ),
              labelText: label,
              border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ))),
          value: formvalue,
          hint: hint != null
              ? Text(
                  hint,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: const Color(0xff2D2D2D),
                      ),
                )
              : null,
          items: items.map((String item) {
            return DropdownMenuItem(
                value: item,
                child: Text(item,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff2D2D2D),
                        )));
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    ),
  );
}
