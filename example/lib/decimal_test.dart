import 'package:awesome_number_picker/awesome_number_picker.dart';
import 'package:flutter/material.dart';

class DecimalTest extends StatefulWidget {
  const DecimalTest({Key? key}) : super(key: key);

  @override
  State<DecimalTest> createState() => _DecimalTestState();
}

class _DecimalTestState extends State<DecimalTest> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(value.toString()),
          SizedBox(
            height: 200,
            child: DecimalNumberPicker(
                initialValue: 3.1,
                minValue: 0,
                maxValue: 10,
                decimalPrecision: 2,
                onChanged: (i) {
                  setState(() {
                    value = i;
                  });
                }),
          ),
        ],
      ),
    );
  }
}
