import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart%20';

class ResiterScreen extends StatelessWidget {
   ResiterScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void registerUser(String email, password) async{
   try{
     Response response = await put(Uri.parse('https://reqres.in/api/register'),
       body: {
       'email':email,
         'password':password
       }

     );

     print(response.statusCode);
     if(response.statusCode == 200){
       var data = jsonDecode(response.body);
       print(data['token']);
       print('Account Created');
     }else{
       print('Some thing went wrong');
     }
   }catch(e){
     print(e.toString());
   }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity,),
          Text('R E G I S T E R - S C R E E N', style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 30,),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.green[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: InputBorder.none,

                ),

              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.green[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: InputBorder.none,

                ),

              ),
            ),
          ),
          SizedBox(height: 20,),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),

            child: InkWell(
              onTap:()=>registerUser(emailController.text.toString(), passwordController.text.toString()),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green[400],
                  borderRadius: BorderRadius.circular(8),

                ),
                child: Center(child: Text('Register Now', style: TextStyle(color: Colors.white),)),
              ),
            ),
          )
        ],

      ),
    );
  }
}
