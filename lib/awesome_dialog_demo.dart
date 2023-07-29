import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class AwesomeDialogDemo extends StatefulWidget {
  const AwesomeDialogDemo({super.key});

  @override
  State<AwesomeDialogDemo> createState() => _AwesomeDialogDemoState();
}

class _AwesomeDialogDemoState extends State<AwesomeDialogDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () {
            AwesomeDialog(
              context: context,
              title: 'Hello ! This is Awesome Dialog Demo',
              desc: 'This is Demo of Awesome Dialog',
              dialogType: DialogType.info,
              dismissOnTouchOutside: true,
              dismissOnBackKeyPress: false,
              animType: AnimType.leftSlide,
              buttonsBorderRadius: BorderRadius.circular(
                20,
              ),
              showCloseIcon: true,
              closeIcon: const Icon(
                Icons.cancel_outlined,
              ),
              headerAnimationLoop: false,
            ).show();
            setState(() {});
          },
        ),
      ),
    );
  }
}
