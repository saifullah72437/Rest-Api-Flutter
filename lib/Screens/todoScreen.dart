import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Models/todoModel.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  // List<TodoModel> list= [];
  Future<List<TodoModel>> getTodoApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    if (response.statusCode == 200) {
      // TodoModel todoModel = TodoModel.fromJson(data);
      /*
    * To fix this, you should update the method to parse the array of objects, for example by using
    * List<TodoModel> todoList = (data as List).map((item) => TodoModel.fromJson(item)).toList();
    *  instead of TodoModel todoModel = TodoModel.fromJson(data);, and then return the list instead of a single object.
    * */
      var data = jsonDecode(response.body.toString());
      List<TodoModel> todoList =
          (data as List).map((item) => TodoModel.fromJson(item)).toList();

      return todoList;
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getTodoApi(),
          builder: (context, AsyncSnapshot<List<TodoModel>> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      trailing: Text(snapshot.data![index].id.toString()),
                      subtitle: Text(snapshot.data![index].completed.toString()),
                      title: Text(snapshot.data![index].title.toString()),
                    );
                  });
            }
          }),
    );
  }
}
