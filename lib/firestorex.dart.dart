// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:renasya_prefb/create.dart';
import 'package:renasya_prefb/ctrl.dart';
import 'package:renasya_prefb/detail.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class FirestoreX extends StatefulWidget {
  const FirestoreX({super.key});

  @override
  State<FirestoreX> createState() => _FirestoreXState();
}

var id = 'one';

class _FirestoreXState extends State<FirestoreX> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              onPressed: () {
                setState(() {});
              },
              // ignore: sort_child_properties_last
              child: const Icon(Icons.refresh_sharp),
              backgroundColor: Colors.brown[900]),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Create(),
                ),
              );
            },
            // ignore: sort_child_properties_last
            child: const Icon(Icons.add),
            backgroundColor: Colors.brown[900],
          )
        ],
      ),
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
      //   title: const Text('Reize'),
      //   titleTextStyle:
      //       TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 35, color: Colors.brown[50]),
      //   backgroundColor: Colors.brown[900],
      //   // titleTextStyle: TextStyle actions: [],
      // ),
      body: Column(
        children: [
          FutureBuilder(
            future: getColl(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final length = snapshot.data!.docs.length;
                return Column(
                  children: [
                    ...List.generate(length, (index) {
                      final id = snapshot.data!.docs[index].id;
                      return Card(
                        child: ListTile(
                          tileColor: Colors.brown[900],
                          textColor: Colors.brown[50],
                          title: Text(snapshot.data!.docs[index]['nama']),
                          subtitle: Text(id),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Detail(id: id)),
                            );
                          },
                        ),
                      );
                    })
                  ],
                );
                // return Column(children: [
                //   ...List.generate(
                //       length, (index) {
                //             final id = snapshot.data!.docs[index].id;
                //           })
                //   // ...List.generate(
                //   //   length,
                //   //   (index) => GestureDetector(
                //   //     onTap: () {
                //   //       setState(() {
                //   //         id = snapshot.data!.docs[index].id;
                //   //         getDoc();
                //   //       });
                //   //     },
                //   //     child: Container(
                //   //       margin: const EdgeInsets.all(10),
                //   //       color: Colors.brown,
                //   //       child: Row(
                //   //         children: [
                //   //           Text("${snapshot.data!.docs[index].id.toString()} = "),
                //   //           const SizedBox(
                //   //             width: 5,
                //   //           ),
                //   //           Text(
                //   //             snapshot.data!.docs[index]['nama'].toString(),
                //   //           ),
                //   //         ],
                //   //       ),
                //   //     ),

                //   // ),)
                // ]);
              }
              return const Center(child: Text(''));
            },
          ),
          // OutlinedButton(
          //   onPressed: () {
          //     setState(
          //       () {
          //         getColl();
          //       },
          //     );
          //   },
          //   child: const Text('Load More'),
          // )
          // FutureBuilder(
          //   future: getDoc(),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return const Text('Loading...');
          //     }
          //     if (snapshot.hasData) {
          //       return Text(snapshot.data!.data().toString());
          //     }
          //     return const Text('');
          //   },
          // )
        ],
      ),
    );
  }
}
