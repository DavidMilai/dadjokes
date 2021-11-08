import 'package:hive/hive.dart';

part '../adapters/joke.g.dart';

@HiveType(typeId: 0)
class Joke {
  Joke({
    this.fallback,
    this.text,
  });
  @HiveField(0)
  String fallback;
  @HiveField(1)
  String text;

  factory Joke.fromMap(Map<String, dynamic> json) => Joke(
        fallback: json["fallback"],
        text: json["text"],
      );

  Map<String, dynamic> toMap() => {
        "fallback": fallback,
        "text": text,
      };
}
