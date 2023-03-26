import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learnrestapi/utils/rowText.dart';

import '../Models/CommentModel.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  List<CommentModel> list = [];

  Future<List<CommentModel>> getCommentApi() async {
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      list.clear();
      for (Map i in data) {
      CommentModel commentModel = CommentModel(postId: i['postId'], id: i['id'], name: i['name'], email: i['email'], body: i['body']);
      list.add(commentModel);
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
      backgroundColor: Colors.grey[300],
      body: FutureBuilder(
          future: getCommentApi(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.deepPurple,
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: list.length, itemBuilder: (context, index) {
                return Padding(
                 padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade800,
                        offset: Offset(4, 4),
                        blurRadius: 15,
                      ),
                      BoxShadow(
                        color: Colors.grey.shade200,
                        offset: Offset(-4, -4),
                        blurRadius: 15,
                      ),
                    ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RowText(name: 'ID:', data: list[index].id.toString()),
                    
                        FittedBox(child: RowText(name: 'Post Id:', data: list[index].postId.toString())),
                        FittedBox(child: RowText(name: 'Name:', data: list[index].name.toString())),
                        FittedBox(child: RowText(name: 'Email:', data: list[index].email.toString())),
                        FittedBox(child: RowText(name: 'Body:', data: list[index].body.toString())),
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
