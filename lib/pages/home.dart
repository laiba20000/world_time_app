import 'package:flutter/material.dart';
import 'dart:core';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};

  @override
  Widget build(BuildContext context) {
   data =data.isNotEmpty?data: ModalRoute.of(context)?.settings.arguments as Map;
    print("Data is $data");
    String bg=data['isDayTime']?'daylight.jpg':'Night.jpg';
     var bgColor=  data['isDayTime']? Colors.blue[900] : Colors.indigo[900];


    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('Assets/$bg'
              ),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120,0,0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {
                  dynamic result=await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data={
                      'time':result['time'],
                      'location':result['location'],
                      'isDayTime':result['isDayTime'],
                      'flag':result['flag']
                    };
                  });

                }, icon:
                Icon(Icons.location_on,color: Colors.white,
                size: 30,), label: Text('Edit Location', style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),),

                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data['location'],
                      style: TextStyle(
                      letterSpacing: 2.0,
                        fontSize: 28.0,
                        color: Colors.white
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Text(data['time'],
                style: TextStyle(
                  fontSize: 62.0,
                  color: Colors.white

                ),)
              ],
            ),
          ),
        ),


      ),
    );
  }
}
