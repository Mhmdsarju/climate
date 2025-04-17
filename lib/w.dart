import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherPage extends StatefulWidget {
  final String city;

  WeatherPage({required this.city});

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String description = '';
  double temperature = 0.0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  fetchWeather() async {
    final apiKey = 'S84NDIM3N2NAJ2M3N44NIF94N4N5B5B5YHHBDHEBEGEHE223B4HENEJEJE';
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=${widget.city}&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);

    setState(() {
      description = data['weather'][0]['description'];
      temperature = data['main']['temp'];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg2.jpg'), // another background
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.city,
                      style: TextStyle(fontSize: 32, color: Colors.white)),
                  Text('${temperature.toStringAsFixed(1)}°C',
                      style: TextStyle(fontSize: 48, color: Colors.white)),
                  Text(description.toUpperCase(),
                      style: TextStyle(fontSize: 24, color: Colors.white)),
                ],
              ),
            ),
    );
  }
}
