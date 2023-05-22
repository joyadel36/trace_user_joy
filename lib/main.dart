import 'package:flutter/material.dart';
import 'package:trace_user/home.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Home_Page(),
    );
  }

}
