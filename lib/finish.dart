import 'dart:io';
import 'package:flutter/material.dart';
import 'package:trace_user/home.dart';
import 'package:trace_user/my_function&widget.dart';
class Finish extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "You Walk ${distance.round()} metres",
                    style: const TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      exit(0);
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text("Exit", textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 20),),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      distance = 0;
                      print(distance);
                      Navigator.pop(context);

                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child:const Text("Restart", textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 20),),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child:
               Text(
                "thanks to use my app",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

}