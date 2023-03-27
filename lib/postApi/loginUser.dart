import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart%20';
class LoginUser extends StatelessWidget {

   LoginUser({Key? key}) : super(key: key);

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
void loginUser(String email, password) async{
 try{
   Response response = await post(Uri.parse('https://reqres.in/api/login'),
       body: {
         'email': email,
         'password': password
       }
   );
   if(response.statusCode == 200){
     var data = jsonDecode(response.body);
     print(data['token']);
     // print(data['id']);
     print('Login Successfull');
   }else{
     print('Login Failed');
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
          Text('L O G I N - S C R E E N', style: TextStyle(fontWeight: FontWeight.bold),),
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
              onTap: ()=> loginUser(emailController.text.toString(), passwordController.text.toString()),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green[400],
                  borderRadius: BorderRadius.circular(8),

                ),
                child: Center(child: Text('Login', style: TextStyle(color: Colors.white),)),
              ),
            ),
          )
        ],

      ),
    );
  }
}
