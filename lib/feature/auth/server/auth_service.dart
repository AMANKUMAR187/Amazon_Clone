import 'dart:convert';
import 'package:amazon_clone/common/widget/bottombar.dart';
import 'package:amazon_clone/constant/error_handel.dart';
import 'package:amazon_clone/constant/global_variable.dart';
import 'package:amazon_clone/constant/utility.dart';
import 'package:amazon_clone/feature/Home/screen/home.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:amazon_clone/route.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth_screen/authscreen.dart';

class Authservice{

  void signup({
    required BuildContext context,
    required  String email,
    required  String password,
    required  String name,

  }) async{
    try{
      User user = User(id: "", name: name, email: email, password: password, address: "", type: "", token: "");
      http.Response res =  await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: (){
          showSnackBar(context, "Account created successfully !");
      });

    }catch(err){
     showSnackBar(context, err.toString());
    }
  }

  void signin({
    required BuildContext context,
    required  String email,
    required  String password,

  }) async{
    try{
      http.Response res =  await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
           'email' : email,
          'password' : password,
        }),

        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: ()async{
              SharedPreferences prefs = await SharedPreferences.getInstance();
              Provider.of<UserProvider>(context,listen: false).setUser(res.body);
              await prefs.setString("x-auth-token", jsonDecode(res.body)['token']);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomBar()));
            },
      );
      }
  catch(err){
      showSnackBar(context, err.toString());
    }
  }
  void getuserdata(
      BuildContext context,
      )async {
     try{

       SharedPreferences prefs = await SharedPreferences.getInstance();
       String? token  = prefs.getString('x-auth-token');
       if(token == null){
         prefs.setString('x-auth-token', '');
       print('null');
       }
       print(token);

       var tokenres = await http.post(
         Uri.parse('$uri/tokenisvalid'),
         headers: <String, String>{
           'Content-Type': 'application/json; charset=UTF-8',
           'x-auth-token': token!
         },
       );
       print(tokenres.body);

       var response = jsonDecode(tokenres.body);
       print(response);
     if(response == true){
       // get user data
       http.Response resonses  = await http.get(Uri.parse('$uri/'),
         headers: <String, String>{
           'Content-Type': 'application/json; charset=UTF-8',
           'x-auth-token': token
         },
       );

        var userprovider = Provider.of<UserProvider>(context,listen:  false);
        userprovider.setUser(resonses.body);
         print(3);

     }
     print(4);

     }
     catch(err){
       showSnackBar(context, err.toString());
     }

  }




}

