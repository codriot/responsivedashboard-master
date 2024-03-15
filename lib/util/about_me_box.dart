import 'package:flutter/material.dart';
import 'package:responsivedashboard/constants.dart';

class AboutMeBox extends StatelessWidget {
  const AboutMeBox({super.key});

  @override
  Widget build(BuildContext context) {
    //todo: add my details
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: defaultBackgroundColor,
        ),
        child: Column(
          children: [
            Text(
              'Contact Me',
              style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 20,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  iconButton(const Icon(Icons.email), 'E-mail'),
                  iconButton(const Icon(Icons.phone), 'Phone'),
                  iconButton(const Icon(Icons.location_on), 'Location'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column iconButton(Icon buttonicon, String buttontext) {
    return Column(
      children: [
        FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.blueGrey[100],
            child: buttonicon),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(buttontext),
        ),
      ],
    );
  }
}
