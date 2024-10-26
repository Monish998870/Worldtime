import 'package:flutter/material.dart';
import 'package:worldtime/pages/changelocation.dart';
import 'package:worldtime/pages/home.dart';
import 'package:worldtime/pages/loading.dart';

void main() {
  runApp(MaterialApp(
      initialRoute: '/loading',
    routes:{'/home':(context)=>Home(),
            '/changelocation':(context)=>ChangeLocation(),
             '/loading':(context)=>Loading()}
  ));
}


