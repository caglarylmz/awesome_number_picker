import 'dart:math';

import 'package:awesome_number_picker/awesome_number_picker.dart';
import 'package:flutter/material.dart';

class DecimalNumberPicker extends StatefulWidget {
  /// Selected value for Start position - #initialValue cant be bigger than #maxValue and cant be smaller than #minValue
  final double initialValue;

  /// Min value user can pick - #minValue cant be bigger than #initialValue amd #maxValue
  final int minValue;

  /// Max value user can pick
  final int maxValue;

  ///
  final int decimalPrecision;

  /// if user interaction picker this methods return selected value
  final ValueChanged<double> onChanged;

  /// height and width of single item for vertical.
  final double? integerPartSize;
  final double? decimalPartSize;

  /// Decoration to apply to picked number where the selected value is placed
  final BoxDecoration? pickedItemDecoration;

  /// Decoration to apply non-picked numbers
  final BoxDecoration? otherItemsDecoration;

  /// Style of picked number. If null, it uses Theme's headline5 with primaryColor
  final TextStyle? pickedItemTextStyle;

  /// Style of non-picked numbers. If null, it uses Theme's bodyText2
  final TextStyle? otherItemsTextStyle;

  const DecimalNumberPicker({
    Key? key,
    required this.initialValue,
    required this.minValue,
    required this.maxValue,
    required this.decimalPrecision,
    required this.onChanged,
    this.integerPartSize,
    this.decimalPartSize,
    this.pickedItemDecoration,
    this.otherItemsDecoration,
    this.pickedItemTextStyle,
    this.otherItemsTextStyle,
  })  : assert(initialValue < maxValue),
        assert(initialValue >= minValue),
        assert(minValue < maxValue),
        super(key: key);

  @override
  State<DecimalNumberPicker> createState() => _DecimalNumberPickerState();
}

class _DecimalNumberPickerState extends State<DecimalNumberPicker> {
  late int returnIntegerPart;
  late int returnDecimalPart;
  late int integerPartInit;
  late int decimalPartInit;
  late int returnValueIntegerPart;
  late int returnValueDecimalPart;

  @override
  void initState() {
    super.initState();
    String initialString = (widget.initialValue - widget.minValue)
        .toStringAsFixed(widget.decimalPrecision);
    String integerPartInitStr = initialString.split(".")[0];
    String decimalPartInitStr = initialString.split(".")[1];
    integerPartInit = int.parse(integerPartInitStr);
    decimalPartInit = int.parse(decimalPartInitStr);

    print(integerPartInit);
    print(decimalPartInit);
    returnIntegerPart = integerPartInit;
    returnDecimalPart = decimalPartInit;
  }

  returnValue() {
    String temp = "$returnIntegerPart.$returnDecimalPart";

    widget.onChanged(double.parse(temp));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: widget.integerPartSize ?? 40,
            child: IntegerNumberPicker(
                initialValue: integerPartInit,
                minValue: widget.minValue,
                maxValue: widget.maxValue,
                size: widget.integerPartSize,
                pickedItemDecoration: widget.pickedItemDecoration,
                otherItemsDecoration: widget.otherItemsDecoration,
                pickedItemTextStyle: widget.pickedItemTextStyle,
                otherItemsTextStyle: widget.otherItemsTextStyle,
                onChanged: (i) {
                  returnIntegerPart = i;
                  setState(() {
                    returnValue();
                  });
                }),
          ),
          SizedBox.shrink(),
          SizedBox(
            width: widget.decimalPartSize ?? 50,
            child: IntegerNumberPicker(
                initialValue: decimalPartInit,
                minValue: widget.minValue,
                maxValue: pow(10, widget.decimalPrecision).toInt(),
                size: widget.decimalPartSize ?? 50,
                pickedItemDecoration: widget.pickedItemDecoration,
                otherItemsDecoration: widget.otherItemsDecoration,
                pickedItemTextStyle: widget.pickedItemTextStyle,
                otherItemsTextStyle: widget.otherItemsTextStyle,
                onChanged: (i) {
                  returnDecimalPart = i;
                  setState(() {
                    returnValue();
                  });
                }),
          ),
        ],
      ),
    );
  }
}
