import 'package:flutter/material.dart';

class Home extends StatefulWidget{

  @override
  Homie  createState(){
    return Homie();
  }

}

class Homie  extends State<Home>{
late Map data;
late String theme;
  @override
  Widget build(BuildContext context){
   data= ModalRoute.of(context)?.settings.arguments as Map;
   print(data);
   theme=data['isday']?"assets/day.png":"assets/night.png";
   Color? cl1=data['isday']?Colors.blue[400]:Colors.indigo[700];
   Color? cl2=data['isday']?Colors.black87:Colors.white;
   print(theme);
    return Scaffold(
      backgroundColor:cl1 ,

      body: SafeArea(
        child:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(theme),fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20,120,20,0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: (){
                    Navigator.pushNamed(context, '/changelocation');
                  },
                 icon:Icon(
                   Icons.edit_location,
                   color: Colors.black,
                ),
                  label:Text(
                      "Edit Location",
                      style: TextStyle(color: Colors.black))
              ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(
                      data['location'],
                      style: TextStyle(fontSize:80,color: cl2 ),
                  )
                ],
              ),
                SizedBox(height: 8.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['time'],
                      style: TextStyle(fontSize:50,color: cl2 ),
                    )
                  ],
                )
            ],
                  ),
          ),
        )
    )
    );
  }
}
