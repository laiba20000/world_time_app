import 'package:flutter/material.dart';
import 'package:world/pages/choose_location.dart';
import 'package:world/pages/home.dart';
import 'package:world/pages/loading.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation()

    },
  ));
}

