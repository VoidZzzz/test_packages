import 'package:flutter/material.dart';
import 'package:number_date_picker/number_date_picker.dart';
import 'package:test_packages_app/widgets/text_view.dart';

class NumDatePicker extends StatefulWidget {
  const NumDatePicker({Key? key}) : super(key: key);

  @override
  State<NumDatePicker> createState() => _NumDatePickerState();
}

class _NumDatePickerState extends State<NumDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextView(
          text: "NumDatePicker",
          fontSize: 18,
        ),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            showDateNumPicker(context: (context),
                startYear: 1990,
                endYear: 2023,
                initialDate: DateTime.now(),
                onDaySelected: (selectedTime) {
              print(selectedTime);
                },);
          },
          child: Container(color: Colors.green,
            child: TextView(text: "TAP if you dare"),
          ),
        ),
      ),
    );
  }
}
