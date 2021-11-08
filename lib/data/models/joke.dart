class Joke {
  Joke({
    this.fallback,
    this.text,
  });

  String fallback;
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
