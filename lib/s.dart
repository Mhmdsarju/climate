import 'package:app5/w.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/city-nochnoi_gorod-neboskrebi-vid_sverkhu-79059.jpeg'), // add your background image in assets
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: cityController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Enter City',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (cityController.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => WeatherPage(city: cityController.text),
                    ),
                  );
                }
              },
              child: Text('Get Weather'),
            ),
          ],
        ),
      ),
    );
  }
}
