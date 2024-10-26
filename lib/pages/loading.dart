import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldtime/changes/worldtime.dart';
class Loading extends StatefulWidget{

  @override
  Load  createState(){
    return Load();
  }

}

class Load extends State<Loading>{


  void data() async{
WorldTime obj=WorldTime("Europe/London","London","germany.png");
await obj.getData();
Navigator.pushReplacementNamed(
    context,
    '/home',
    arguments:{'flag':obj.flag,'location':obj.location,'time':obj.time,'isday':obj.isday} );
   }

   @override
   void initState(){

    super.initState();
    data();
   }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child:  SpinKitWave(
          color: Colors.blue,
          size: 50.0,
        ),
      )
    );
  }
}