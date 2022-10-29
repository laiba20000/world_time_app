import 'package:flutter/material.dart';

import '../services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  @override
  List<WorldTime> location=[
    WorldTime('Seoul', '', 'Seoul.jpg', 'Asia/Seoul', true),
    WorldTime('Jakarta', '', 'Jakarta.jpg', 'Asia/Jakarta', true),
    WorldTime('Paris', '', 'Paris1.jpg', 'Europe/Paris', true),
    WorldTime('London', '', 'London.jpg', 'Europe/London', true),
    WorldTime('New York', '', 'NewYork.jpg', 'America/New_York', true),
    WorldTime('Berlin', '', 'jermany.jpg', 'Europe/Berlin', true),
    WorldTime('Chicago', '', 'Chicago.jpg', 'America/Chicago', true),
  ];
  void updateTime(index) async{
    WorldTime instance=location[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.isDayTime
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
    appBar: AppBar(
      backgroundColor: Colors.blue[900],
      title: Text('Choose a Location'),
      centerTitle: true,
      elevation: 0,
    ),
      body: ListView.builder(
          itemCount: location.length,
          itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 1.0),
          child: Card(
            child: ListTile(
            onTap: (){
              updateTime(index);
            },
            title: Text(location[index].location),
             leading: CircleAvatar(
               backgroundImage: AssetImage('Assets/${location[index].flag}'),
             ),

            ),
          ),
        );
      })


    );

  }
}
