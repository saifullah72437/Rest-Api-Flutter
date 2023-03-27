import 'dart:convert';
import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learnrestapi/Models/RandomUserModel.dart';

import '../Models/RandomUserModel.dart';

class RandomUserScreen extends StatefulWidget {
  const RandomUserScreen({Key? key}) : super(key: key);

  @override
  State<RandomUserScreen> createState() => _RandomUserScreenState();
}

class _RandomUserScreenState extends State<RandomUserScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {


    return const Scaffold(

  
      body: Center(child: Text('Hello')),
    );
  }
}
