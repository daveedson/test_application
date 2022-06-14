// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
   static String routeName = "/home";
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
      
          },
          child: Icon(Icons.add,color: Colors.white,),
          backgroundColor:  Color(0xFFF9923B)),
          body: Center(child: Lottie.asset("images/baby.json")),
        );
  
  }
}