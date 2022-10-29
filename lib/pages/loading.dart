import 'package:flutter/material.dart';
import 'package:world/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time='loading';
   void setWorldTime() async{
     WorldTime instance = WorldTime('Berlin', '', 'jermany.jpg', 'Europe/Berlin',false);
     await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
       'location': instance.location,
       'flag':instance.flag,
       'time':instance.time,
       'isDayTime':instance.isDayTime
     });
     print(instance.time);



   }

  @override
  int count=0;
  void initState() {
    // TODO: implement initState
    super.initState();

  setWorldTime();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue[900],
      body:Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),



      ),


    );
  }
}
