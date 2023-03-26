import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Models/randomUserModel.dart';

class RandomUserScreen extends StatefulWidget {
  const RandomUserScreen({Key? key}) : super(key: key);

  @override
  State<RandomUserScreen> createState() => _RandomUserScreenState();
}

class _RandomUserScreenState extends State<RandomUserScreen> {
  List<dynamic> list =[];
  Future<void> getRandomUserApi() async{
    final response = await http.get(Uri.parse('https://randomuser.me/api/'));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      var d = RandomUserModel.fromJson(data);
        list.add(d);

      print(list);
    }else{
      throw Exception('error');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  getRandomUserApi();
  }
  @override
  Widget build(BuildContext context) {


    return const Scaffold(

  
      body: Center(child: Text('Hello')),
    );
  }
}
