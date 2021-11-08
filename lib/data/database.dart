import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/joke.dart';

class Database {
  Box jokes;

  _initBoxes() async {
    jokes = await Hive.openBox("jokes");
  }

  _registerAdapters() async {
    Hive.registerAdapter(JokeAdapter());
  }

  init() async {
    await Hive.initFlutter();
    await _registerAdapters();
    await _initBoxes();
  }
}

var db = Database();
