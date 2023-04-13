// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:movie/components/constant.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie/components/provider.dart';

class movieaddscreen extends StatefulWidget {
  const movieaddscreen({super.key});

  @override
  State<movieaddscreen> createState() => _movieaddscreenState();
}

class _movieaddscreenState extends State<movieaddscreen> {
  late String book_name;
  late String author_name;
  late String short_discription;
  late String long_discription;
  final db = FirebaseFirestore.instance;
  Future<String?> adddata() async {
    FirebaseFirestore.instance.collection("movies").doc(book_name).set({
      'poster_name': Getcurrentuser.user,
      'movie_name': book_name,
      'director_name': author_name,
      'short_discription': short_discription,
      'long_discription': long_discription,
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: AlertDialog(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.close))
          ],
          title: const Text('Add Movie'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                  enableIMEPersonalizedLearning: true,
                  autocorrect: true,
                  obscureText: false,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    book_name = value;
                    //Do something with the user input.
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter movie name.')),
              const SizedBox(
                height: 30.0,
              ),
              TextField(
                  obscureText: false,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    author_name = value;
                    //Do something with the user input.
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter director name.')),
              const SizedBox(
                height: 30.0,
              ),
              TextField(
                  obscureText: false,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    short_discription = value;
                    //Do something with the user input.
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter short dicription of the movie.')),
              const SizedBox(
                height: 30.0,
              ),
              TextField(
                  minLines: 7,
                  maxLines: 20,
                  obscureText: false,
                  keyboardType: TextInputType.multiline,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    long_discription = value;
                    //Do something with the user input.
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter long discription of the movie.')),
              const SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    adddata();
                  },
                  child: Text('save')),
            ],
          ),
        ),
      ),
    );
  }
}
