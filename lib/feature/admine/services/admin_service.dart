import 'dart:convert';
import 'dart:io';
import 'package:amazon_clone/constant/error_handel.dart';
import 'package:amazon_clone/constant/global_variable.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:http/http.dart' as http ;
import 'package:amazon_clone/constant/utility.dart';
import 'package:amazon_clone/model/product.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AdmineService{
void sellproduct({
   required BuildContext context,
  required String name,
  required String description,
  required double price,
  required double  quantity,
  required String category,
  required List<File> images,
})async{
   try{
        final userprovider = Provider.of<UserProvider>(context,listen:false);

         final cloudinary  = CloudinaryPublic('dtpoaekap', 'ua6l1v4b');
         List<String> imageurl = [];
         for(int i=0;i<images.length;i++){
           CloudinaryResponse res =  await cloudinary.uploadFile(CloudinaryFile.fromFile(images[i].path,folder: name));
          imageurl.add(res.secureUrl);
         }

         Product product = Product(name: name, description: description, quantity: quantity, images: imageurl, category: category, price: price);
          http.Response res = await http.post(Uri.parse('$uri/admine/addproducts'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'x-auth-token': userprovider.user.token
            },
            body: product.toJson(),
          );

          httpErrorHandle(response: res,
              context: context,
              onSuccess: (){
               showSnackBar(context, 'Product Added Successfully');
               Navigator.pop(context);
              });

   }catch(err){
     showSnackBar(context, err.toString());
   }

}

Future<List<Product>> getallproducts(BuildContext context) async {
  final provider = Provider.of<UserProvider>(context,listen: false);
  List<Product> list = [];
  try {
    http.Response res = await http.get(Uri.parse('$uri/admine/getallproducts'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': provider.user.token
      },
    );
httpErrorHandle(response: res, context: context,
    onSuccess: (){
    for(int i=0;i<jsonDecode(res.body).length;i++){
      list.add(Product.fromJson(jsonEncode(jsonDecode(res.body)[i],)));
    }
    });

  }
  catch (err) {
    showSnackBar(context, err.toString());
  }
  return list;

}
void delete_product({required BuildContext context,required product,required VoidCallback onsuccess})async {
  final provider  = Provider.of<UserProvider>(context,listen: false);
  http.Response res = await http.post(Uri.parse('$uri/admine/deleteproduct'),
  headers:  <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'x-auth-token': provider.user.token
  },
    body: jsonEncode({
    'id' : product.id
    }
    ),

  );
  httpErrorHandle(response: res, context: context, onSuccess: (){
    showSnackBar(context, 'deleted successfully');
    onsuccess();
  });

}

}