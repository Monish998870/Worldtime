import 'package:flutter/material.dart';
import 'package:worldtime/changes/worldtime.dart';

class ChangeLocation extends StatefulWidget{

  @override
  Chan  createState(){
    return Chan();
  }

}

class Chan extends State<ChangeLocation>{
  List<WorldTime> locations = [
    WorldTime( 'Europe/London',  'London',  'uk.png'),
    WorldTime( 'Europe/Berlin',  'Athens',  'greece.png'),
    WorldTime('Africa/Cairo', 'Cairo',  'egypt.png'),
    WorldTime('Africa/Nairobi',  'Nairobi',  'kenya.png'),
    WorldTime('America/Chicago',  'Chicago',  'usa.png'),
    WorldTime('America/New_York',  'New York', 'usa.png'),
    WorldTime('Asia/Seoul',  'Seoul', 'south_korea.png'),
    WorldTime( 'Asia/Jakarta',  'Jakarta',  'indonesia.png'),
    WorldTime('Asia/Kolkata',  'Kolkata',  'india.png'),
    WorldTime('Asia/Tokyo',  'Tokyo', 'japan.png'),
    WorldTime('Asia/Dubai',  'Dubai', 'uae.png'),
    WorldTime( 'Australia/Sydney',  'Sydney',  'australia.png')
  ];

  void getData(int index) async{
    await locations[index].getData();
    Navigator.pushReplacementNamed(
        context,
        '/home',
        arguments:{
          'flag':locations[index].flag,
          'location':locations[index].location,''
              'time':locations[index].time,
          'isday':locations[index].isday}
    );

    }

  @override
  Widget build(BuildContext context){
    late bool isday;
    return Scaffold( appBar: AppBar(
      title: Text(
        "Locations",
        style: TextStyle(
            fontSize: 60
        ),
      ),
      centerTitle: true,
    ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index) {
            return Padding(
              padding:  EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    getData(index);
                  },
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/${locations[index].flag}"),
                    radius: 30.0,
                    ),
                  title: Text(locations[index].location,
                    style: TextStyle(fontSize: 30),),
                  ),
                ),
            );


          }
      )
      );

  }
}