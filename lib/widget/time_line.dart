import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeLineMonth extends StatefulWidget {
  const TimeLineMonth({super.key});

  @override
  State<TimeLineMonth> createState() => _TimeLineMonthState();
}

class _TimeLineMonthState extends State<TimeLineMonth> {
  String currentMonth="";
  List<String> months=[];
  @override
  void initState(){
    super.initState();
    DateTime now=DateTime.now();
    for(int i=-12;i<=0;i++){
      months.add(
        DateFormat('MMM y').format(DateTime(now.year,now.month+i,1))
      );
    }
    currentMonth=DateFormat('MMM y').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
          itemCount: months.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
        return  GestureDetector(
          onTap:(){
            setState(() {
              currentMonth=months[index];
            });
          },
          child: Container(
            width: 80,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: currentMonth== months[index] ? Colors.blue.shade900 : Colors.purple.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Center(child: Text(months[index],
            style: TextStyle(
              color: currentMonth== months[index] ? Colors.white : Colors.purple
            ),)),
          ),
        );
      }),
    );
  }
}
