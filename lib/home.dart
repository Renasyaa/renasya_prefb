// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[900],
        title:
            // const Text('Coff(R)ize'),
            RichText(
          text: TextSpan(
              text: 'Coff',
              style: TextStyle(
                color: Colors.brown[50],
                fontSize: 25,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '(R)',
                  style: TextStyle(
                      color: Colors.orange[800],
                      fontSize: 35,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
                // ignore: prefer_const_constructors
                TextSpan(
                    text: 'ize',
                    style: TextStyle(
                        color: Colors.brown[50],
                        fontSize: 27,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold))
              ]),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              Uri url = Uri.parse('https://github.com/Renasyaa/renasya_prefb');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            icon: const Icon(SimpleIcons.github),
          )
        ],
      ),
      body: Scaffold(
        body: Container(),
      ),
    );
  }
}
