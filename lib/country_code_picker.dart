import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class CountryCodePickerDemo extends StatefulWidget {
  const CountryCodePickerDemo({super.key});

  @override
  State<CountryCodePickerDemo> createState() => _CountryCodePickerDemoState();
}

class _CountryCodePickerDemoState extends State<CountryCodePickerDemo> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CountryCodePicker(
          onChanged: print,
          showCountryOnly: false,
          showDropDownButton: true,
        ),
      ),
    );
  }
}
