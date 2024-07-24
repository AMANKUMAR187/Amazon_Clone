import 'dart:convert';

import 'package:amazon_clone/constant/error_handel.dart';
import 'package:amazon_clone/constant/utility.dart';
import 'package:amazon_clone/model/product.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../constant/global_variable.dart';

class HomeService{
  Future<List<Product>> fetchbycategory ({
    required BuildContext context,
    required String category
  }) async {
    final userprovider  =  Provider.of<UserProvider>(context,listen: false);
    List<Product>list =[];

    try{
      http.Response res  =  await http.get(Uri.parse('$uri/api/product?category=$category'),
       headers:  {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userprovider.user.token
        },
      );
      print(22);
      httpErrorHandle(response: res, context: context, onSuccess: (){
        for(int i=0;i<jsonDecode(res.body).length;i++){
        list.add(Product.fromJson(jsonEncode(jsonDecode(res.body)[i],),),);
        }
      });

    }
    catch(err){
        showSnackBar(context, err.toString());
        print(err.toString());
        print(12);
    }
    return list;
  }

}