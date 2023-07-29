import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class IntlPhoneFieldDemo extends StatefulWidget {
  const IntlPhoneFieldDemo({super.key});

  @override
  State<IntlPhoneFieldDemo> createState() => _IntlPhoneFieldDemoState();
}

class _IntlPhoneFieldDemoState extends State<IntlPhoneFieldDemo> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  FocusNode focusNode = FocusNode();

  String? mobileNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Field Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              IntlPhoneField(
                focusNode: focusNode,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                languageCode: "en",
                onChanged: (phone) {
                  mobileNumber = phone as String;
                },
                onCountryChanged: (country) {},
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: () {
                  _formKey.currentState?.validate();
                  setState(() {});
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
