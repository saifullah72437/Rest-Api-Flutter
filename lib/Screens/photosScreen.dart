import 'dart:convert';

import 'package:flutter/material.dart';
import '../Models/photosModel.dart';
import 'package:http/http.dart'as http;
class PhotosScreen extends StatefulWidget {
  const PhotosScreen({Key? key}) : super(key: key);

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}
List<PhotosModel> list = [];
class _PhotosScreenState extends State<PhotosScreen> {
  Future<List<PhotosModel>> getPhotosApi() async{
  final responce = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  var data = jsonDecode(responce.body.toString());
  if(responce.statusCode == 200){

  for(Map i in data){
    PhotosModel photosModel = PhotosModel(id: i['id'], albumId: i['albumId'], title: i['title'], url: i['url'], thumbnailUrl: i['tumbnailUrl']);
    list.add(photosModel);
  }
  return list;
  }else{
    return list;
  }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getPhotosApi(),
          builder: (context, AsyncSnapshot<List<PhotosModel>> snapshot){
        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator(color: Colors.red,));
        }
        else{
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index){
            return ListTile(
              title: Text(snapshot.data![index].title.toString()),
              subtitle: Text(snapshot.data![index].id.toString()),
              trailing: CircleAvatar( child: Image(image: NetworkImage(snapshot.data![index].url.toString()), height: 20, width: 20, fit: BoxFit.cover) ,),
            );
          });
        }
      }),
    );
  }
}
