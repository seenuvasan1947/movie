// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:movie/components/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie/components/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
class mybooklist extends StatefulWidget {
  const mybooklist({super.key});

  @override
  State<mybooklist> createState() => _mybooklistState();
}

class _mybooklistState extends State<mybooklist> {
  final db = FirebaseFirestore.instance;
  final prefs = SharedPreferences.getInstance();



  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: const Text('My movies List'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
             

              stream: db
                  .collection('movies')
                  .where("poster_name", isEqualTo: '${Getcurrentuser.user}')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: snapshot.data!.docs.map((doc) {
                      return Card(
                        child: ListTile(
                          title: Text(doc['movie_name']),
                          subtitle: Text(doc['director_name']),
                          trailing: IconButton(
                              onPressed: () async {
                                await FirebaseFirestore.instance
                                    .collection("movies")
                                    .doc(doc['movie_name'])
                                    .delete();
                              },
                              icon: const Icon(Icons.remove)),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return SingleChildScrollView(
                                    child: AlertDialog(
                                      actions: [
                                        IconButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            icon: const Icon(Icons.close))
                                      ],
                                      title: const Text('Movie detail'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Movie name",
                                            style: TextStyle(fontSize: 24),
                                          ),
                                          const SizedBox(
                                            height: 27,
                                          ),
                                          Text(doc['movie_name']),
                                          const SizedBox(
                                            height: 35,
                                          ),
                                          const Text(
                                            "Director name",
                                            style: TextStyle(fontSize: 24),
                                          ),
                                          const SizedBox(
                                            height: 27,
                                          ),
                                          Text(doc['director_name']),
                                          const SizedBox(
                                            height: 35,
                                          ),
                                          const Text(
                                            "Short discription",
                                            style: TextStyle(fontSize: 24),
                                          ),
                                          const SizedBox(
                                            height: 27,
                                          ),
                                          Text(doc['short_discription']),
                                          const SizedBox(
                                            height: 35,
                                          ),
                                          const Text(
                                            "Long discription",
                                            style: TextStyle(fontSize: 24),
                                          ),
                                          const SizedBox(
                                            height: 27,
                                          ),
                                          Text(doc['long_discription']),
                                          const SizedBox(
                                            height: 35,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                        ),
                      );
                    }).toList(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
