import 'package:flutter/material.dart';
import 'package:trace_user/fayoum_university.dart';
import 'package:trace_user/trace_user.dart';

class Home_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Walking App",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>
                    Fayoum_univercity()));
              },
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Text("Fayoum University", textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>
                    Trace_User()));
              },
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Text("start tracing from your location ",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 15),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
