import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Models/albumModel.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({Key? key}) : super(key: key);

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  
  List<AlbumModel> list = [];
  Future<List<AlbumModel>> getAlbumApi() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(Map i in data){
        AlbumModel albumModel = AlbumModel(id: i['id'], title: i['title'], userId: i['userId']);
        list.add(albumModel);
      }
      return list;
    }
    else{
      return list;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getAlbumApi(),
          builder: (context, AsyncSnapshot<List<AlbumModel>> snapshot){
            if(!snapshot.hasData){
              return CircularProgressIndicator();
            }else{
              return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      // i think its the same thing you can you AsyncSnapshot or direct list both will work
                      title: Text(snapshot.data![index].title.toString()),
                      subtitle: Text(snapshot.data![index].userId.toString()),
                      leading: Text(list[index].id.toString()),
                    );
                  });
            }
          }),
    );
  }
}
