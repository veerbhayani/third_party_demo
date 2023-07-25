import 'package:flutter/material.dart';
import 'package:third_party_demo/shared_preference/counter_shared.dart';

class ShareDemo extends StatefulWidget {
  const ShareDemo({super.key});

  @override
  State<ShareDemo> createState() => _ShareDemoState();
}

class _ShareDemoState extends State<ShareDemo> {
  int count = CounterShared.getCounter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "$count",
          style: const TextStyle(
            fontSize: 35,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CounterShared.setCounter = ++count;
          setState(() {});
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
