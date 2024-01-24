import 'package:flutter/material.dart';
import 'package:renasya_prefb/ctrl.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final ctrl1 = TextEditingController();

  final ctrl2 = TextEditingController();

  var itsLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[900],
        title: RichText(
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
                    color: Colors.orange[800], fontSize: 35, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
              ),
              // ignore: prefer_const_constructors
              TextSpan(
                  text: 'ize',
                  style: TextStyle(
                      color: Colors.brown[50], fontSize: 27, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold))
            ],
          ),
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
      // appBar: AppBar(
      //   title: const Text('Submit'),
      // ),
      body: Container(
        color: Colors.brown[50],
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                style: TextStyle(color: Colors.brown[900], fontWeight: FontWeight.bold),
                controller: ctrl1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                style: TextStyle(color: Colors.brown[900], fontWeight: FontWeight.bold),
                controller: ctrl2,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    ctrl1.clear();
                    ctrl2.clear();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.brown[900]),
                  child: Text(
                    'Clear',
                    style: TextStyle(color: Colors.brown[50]),
                  )),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  final x = ctrl1.text;
                  final y = int.parse(ctrl2.text);
                  final data = {'nama': x, 'umur': y};

                  setState(() {
                    itsLoading = true;
                  });
                  await create(data);
                  setState(() {
                    itsLoading = false;
                  });

                  ctrl1.clear();
                  ctrl2.clear();
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown[900],
                ),
                child: Text(
                  itsLoading ? 'Loading...' : 'Submit',
                  style: TextStyle(
                    color: Colors.brown[50],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
