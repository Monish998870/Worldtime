import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart';
class WorldTime{
late String flag,url,time,location;
late bool isday;

WorldTime(String u,String l,String f){
 this.flag=f;
 this.url=u;
 this.location=l;
}


  Future<void> getData() async{
    Response response=await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
    Map g=jsonDecode(response.body);
    String datetime=g['datetime'];
    String offset =g['utc_offset'].substring(1,3);
    DateTime now= DateTime.parse(datetime);
    now=now.add(Duration(hours:int.parse(offset)));
    isday=now.hour>=6 && now.hour<18?true:false;
   time=DateFormat.jm().format(now);

  }
}