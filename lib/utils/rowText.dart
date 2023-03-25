import 'package:flutter/material.dart';

class RowText extends StatelessWidget {
  String name, data;
   RowText({Key? key, required this.name, required this.data}) : super(key: key, );

  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        Text('$name: ',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
        Text('$data'),
      ],
    );
  }
}
