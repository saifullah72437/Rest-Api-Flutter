import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learnrestapi/utils/rowText.dart';

import '../Models/PostModel.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  List<PostModel> list = [];

  Future<List<PostModel>> getPostApi() async {
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      list.clear();
      for (Map i in data) {
        list.add(PostModel.fromJson(i));
      }
      return list;
    }
    else {
      return list;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      body: FutureBuilder(future: getPostApi(), builder: (context, snapshot){
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(
              color: Colors.grey[300],
            ),
          );
        }
        else{
          return ListView.builder(itemCount: list.length,itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.deepPurple[300],
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.shade800,
                      offset: Offset(4, 4),
                      blurRadius: 15,

                    ),
                    BoxShadow(
                      color: Colors.deepPurple.shade300,
                      offset: Offset(-4, -4),
                      blurRadius: 15,

                    ),
                  ]

                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RowText(name: 'id', data: '${list[index].id}'),
                    RowText(name: 'User Id', data: '${list[index].userId}'),
                    FittedBox(child: RowText(name: 'Title', data: '${list[index].title}')),
                    FittedBox(child: RowText(name: 'Body', data: '${list[index].body}')),

                  ],
                ),
              ),
            );
          });
        }
      }),
    );
  }
}
