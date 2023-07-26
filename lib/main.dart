import 'package:flutter/material.dart';
import 'package:third_party_demo/fluttertoast_demo.dart';
import 'package:third_party_demo/shared_preference/counter_shared.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CounterShared.init;
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlutterToastDemo(),
    );
  }
}
