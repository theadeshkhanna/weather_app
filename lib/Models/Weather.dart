class Weather {
  final double temp;

  Weather({this.temp});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: json['main']['temp']
    );
  }
}