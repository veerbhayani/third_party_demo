import 'package:flutter/material.dart';
import 'package:third_party_demo/common_toast.dart';

class FlutterToastDemo extends StatefulWidget {
  const FlutterToastDemo({super.key});

  @override
  State<FlutterToastDemo> createState() => _FlutterToastDemoState();
}

class _FlutterToastDemoState extends State<FlutterToastDemo> {
  CommonWidget co = CommonWidget();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  actions: [
                    MaterialButton(
                      onPressed: () {
                        co.flutterToast('Hii ! Hello ');
                        setState(() {});
                      },
                      child: const Text(
                        'ok',
                      ),
                    ),
                  ],
                ),
              );
            },
            child: const Text("Flutter Toast No Context"),
          ),
        ],
      ),
    );
  }
}
