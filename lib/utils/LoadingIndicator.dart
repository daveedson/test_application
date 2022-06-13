// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
                child: Platform.isIOS
                    ? CupertinoActivityIndicator(
                        radius: 20.0,
                      )
                    : CircularProgressIndicator(
                        color: Color(0xFFF9923B),
                      ));;
  }
}