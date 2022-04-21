import 'package:awesome_number_picker/awesome_number_picker.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int integerValue = 0;
  double decimalValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Awesome Number Picker")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Integer Value"),
              Text(integerValue.toString()),
            ],
          ),
          SizedBox(
            height: 150,
            child: IntegerNumberPicker(
              initialValue: 5,
              minValue: 0,
              maxValue: 10,
              onChanged: (i) => setState(() {
                integerValue = i;
              }),
            ),
          ),
          SizedBox(
            height: 150,
            child: IntegerNumberPicker(
              initialValue: 75,
              minValue: 50,
              maxValue: 100,
              axis: Axis.horizontal,
              onChanged: (i) => setState(() {
                integerValue = i;
              }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Decimal Value"),
              Text(decimalValue.toStringAsFixed(3)),
            ],
          ),
          SizedBox(
            height: 150,
            child: DecimalNumberPicker(
              initialValue: 25.75,
              minValue: 0,
              maxValue: 100,
              decimalPrecision: 3,
              otherItemsDecoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    blurRadius: 20.0, // soften the shadow
                    spreadRadius: 0.0, //extend the shadow
                  )
                ],
              ),
              pickedItemDecoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(.5),
                    blurRadius: 20.0, // soften the shadow
                    spreadRadius: 0.0, //extend the shadow
                  )
                ],
              ),
              onChanged: (i) => setState(() {
                decimalValue = i;
              }),
            ),
          ),
        ],
      ),
    );
  }
}
