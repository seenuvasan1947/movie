// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_function_type_syntax_for_parameters, depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movie/auth/auth.dart';
import 'package:movie/components/provider.dart';

import 'package:provider/provider.dart';
import 'package:movie/screens/movie_add_page.dart';
import 'package:movie/screens/movie_list.dart';
import 'package:movie/screens/my_movie.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  initState() {
    context.read<Getcurrentuser>().getuser();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Getcurrentuser>(
        builder: ((context, Getcurrentuser, child) => MaterialApp(
              home: Scaffold(
                appBar: AppBar(
                  title: const Text("Welcome"),
                  centerTitle: true,
                ),
                drawer: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      DrawerHeader(
                        // ignore: prefer_const_constructors
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                        //child: Text('Drawer Header'),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text('Welcome'),
                            SizedBox(
                              height: 20,
                            ),
                            Text('${Getcurrentuser.userName}'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        title: const Text('Add Movie'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const movieaddscreen()));
                        },
                      ),
                      ListTile(
                        title: const Text('My Movie'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const mybooklist()));
                        },
                      ),
                      ListTile(
                        title: const Text('Movie List'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const booklist()));
                        },
                      ),
                      ListTile(
                        title: const Text('Logout'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                        
                      const SizedBox(
                        height: 20,
                      ),

                    ],
                  ),
                ),
                body: Center(
                  child: Column(
                    children: [
                      Container(
                        // margin: EdgeInsets.only(top: 150),
                        margin: EdgeInsets.all(20),
                        height: MediaQuery.of(context).size.height / 1.2,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 250, 252, 250),
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 110.0),
                            Text('Welcome ...',
                                style:
                                    Theme.of(context).textTheme.displayMedium),
                            SizedBox(height: 40.0),
                            Text(
                                'unleash your skill, write movie and its  discription here',
                                style:
                                    Theme.of(context).textTheme.headlineMedium),
                            SizedBox(height: 40.0),
                            Image.asset("assets/movie.jpeg"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
