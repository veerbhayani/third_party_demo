import 'package:shared_preferences/shared_preferences.dart';

class CounterShared {
  static SharedPreferences? pref;

  static Future<SharedPreferences> get init async =>
      pref = await SharedPreferences.getInstance();

  static set setCounter(int data) => pref!.setInt(SharedKey.counter, data);
  static int get getCounter => pref!.getInt(SharedKey.counter) ?? 0;
}

class SharedKey {
  static String counter = 'counter';
}
