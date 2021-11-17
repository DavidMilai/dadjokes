import 'package:dadjokes/api/api.dart';
import 'package:dadjokes/data/database.dart';
import 'package:dadjokes/data/models/joke.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JokeService extends ChangeNotifier {
  List<Joke> get allJokes => db.jokes.values.toList();

  bool _isLoadingJokes = false;

  bool get isLoadingJokes => _isLoadingJokes;

  set isLoadingJokes(bool value) {
    _isLoadingJokes = value;
    notifyListeners();
  }

  cacheData() {
    // allJokes = db.jokes.values.toList();
  }

  clearCacheData() {
    // allJokes = [];
  }

  Future getJokes() {
    isLoadingJokes = true;
    return api.getJoke().then((response) {
      if (response.data['attachments'] != null)
        _saveJoke(response.data['attachments']);
      isLoadingJokes = false;
      return response;
    }).catchError((error) {
      isLoadingJokes = false;
      return throw error;
    });
  }

  removeJoke() {
    db.jokes.deleteAt(1);
  }

  _saveJoke(data) async {
    if (db.jokes.length == 20) await db.jokes.clear();
    db.jokes.add(Joke.fromMap(data[0]));
  }
}

var jokeService = JokeService();
