import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renasya_prefb/ui_screen/storage/ctrl.dart';
import 'package:renasya_prefb/ui_screen/storage/data.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class StorageView extends StatefulWidget {
  const StorageView({super.key});

  @override
  State<StorageView> createState() => _StorageViewState();
}

class _StorageViewState extends State<StorageView> {
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
              Uri url = Uri.parse('https://console.firebase.google.com/project/renasya-prefb');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            icon: const Icon(
              SimpleIcons.firebase,
            ),
            iconSize: 25,
          ),
          IconButton(
            onPressed: () async {
              Uri url = Uri.parse('https://github.com/Renasyaa/renasya_prefb');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            icon: const Icon(SimpleIcons.github),
            iconSize: 25,
          ),
        ],
      ),
      // title: const Text('Storage'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: FutureBuilder(
            future: FirebaseStorage.instance.ref('shop').listAll(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final imagePicker = await ImagePicker().pickImage(source: ImageSource.gallery);

                        pickedFile = imagePicker;

                        setState(() {});
                      },
                      child: const Text('Pick Image'),
                    ),
                    Text(
                      '${pickedFile?.path}',
                      textAlign: TextAlign.center,
                    ),
                    pickedFile == null
                        ? const SizedBox.shrink()
                        : SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.network(
                              pickedFile!.path,
                            ),
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    FutureBuilder(
                      future: url.isEmpty ? null : upload(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }
                        return ElevatedButton(
                          onPressed: () async {
                            url = await upload();
                            setState(() {});
                          },
                          child: const Text('upload'),
                        );
                      },
                    ),
                    Text(url),
                    url.isEmpty
                        ? const SizedBox.shrink()
                        : SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.network(url),
                          ),
                  ],
                );
              }
              return const Text('storage');
            },
          ),
        ),
      ),
    );
  }
}
