# Awesome Number Picker

## Usage

To use plugin, just import package `import 'package:awesome_number_picker/awesome_number_picker.dart';`

## Features

- Pure dart code.
- Simple and easy to use.
- Customizable design.

## Demo

![Demo: ](demo.gif)

## Usage

```

import 'package:awesome_number_picker/awesome_number_picker.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var val = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Awesome Number Picker")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Selected Value"),
                Text(val.toString()),
              ],
            ),
          ),
          SizedBox(
            height: 150,
            child: IntegerNumberPicker(
              initialValue: 5,
              minValue: 0,
              maxValue: 10,
              onChanged: (i) => setState(() {
                val = i;
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
                val = i;
              }),
            ),
          ),
          SizedBox(
            height: 150,
            child: IntegerNumberPicker(
              initialValue: 50,
              minValue: 0,
              maxValue: 100,
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
                val = i;
              }),
            ),
          ),
        ],
      ),
    );
  }
}

```

## Additional information

TODO: We will make a picker for decimals. It will be DecimalNumberPicker
