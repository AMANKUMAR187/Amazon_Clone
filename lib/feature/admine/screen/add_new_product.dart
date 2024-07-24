//import 'dart:html';
import 'dart:io';
import 'package:amazon_clone/common/widget/customButton.dart';
import 'package:amazon_clone/common/widget/customTextField.dart';
import 'package:amazon_clone/feature/admine/services/admin_service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
//import 'package:file_picker_example/src/file_picker_demo.dart';
import 'package:flutter/widgets.dart';

import '../../../constant/global_variable.dart';
import '../../../constant/utility.dart';
import '../../../model/product.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productname = TextEditingController();
  final TextEditingController productdesc = TextEditingController();
  final TextEditingController productprice = TextEditingController();
  final TextEditingController productquantity = TextEditingController();
  String category ='Mobile';
  List<File> images = [];
  final _addProductFormKey = GlobalKey<FormState>();
  final adminServices = AdmineService();

  void dispose() {
    super.dispose();
    productname.dispose();
    productquantity.dispose();
    productprice.dispose();
    productdesc.dispose();
  }

  List<String> products  = [
    'Mobile',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion',
  ];

  

  void sellProduct() {
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      adminServices.sellproduct(
        context: context,
        name: productname.text,
        description: productdesc.text,
        price: double.parse(productprice.text),
        quantity: double.parse(productquantity.text),
        category: category,
        images: images,
      );
    }
  }

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }



  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Text(
            'Add Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
        key: _addProductFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                 const SizedBox(height: 20),
               images.isNotEmpty?
                   CarouselSlider(
                       items: images.map((i) {
                         return Builder(
                           builder: (BuildContext context)=>
                         Image.file(
                           i,
                           fit: BoxFit.fitWidth,
                           height: 200,
                         ),
                         );
                       },
                       ).toList(),
                       options: CarouselOptions(
                         viewportFraction: 1,
                         height: 200
                       ),) :
               GestureDetector(
                 onTap: selectImages,
                 child: DottedBorder(
                     borderType: BorderType.RRect,
                     radius: Radius.circular(10),
                     dashPattern: [10,4],
                     child: Container(
                   width: double.infinity,
                   height: 150,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),

                     ),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [

                       const Icon(Icons.folder_open_outlined,size: 40,),
                       SizedBox(height: 15,),
                       Text('select product images',
                       style: TextStyle(
                         fontSize: 17,
                         color: Colors.grey.shade400
                       ),),

                     ],
                   ),
                 )),
               ),
                SizedBox(height: 25,),
                CustomTextField(controller: productname, hintText: 'Product Name'),
                SizedBox(height: 10,),
                CustomTextField(controller: productdesc, hintText: 'Product description',maxLines: 4,),
                SizedBox(height: 10,),
                CustomTextField(controller: productprice, hintText: "Price"),
                SizedBox(height: 10,),
                CustomTextField(controller: productquantity, hintText: 'Quantity'),
                SizedBox(height: 10,),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: category,
                    icon: Icon(Icons.keyboard_arrow_down_outlined),
                    items: products.map((String item){
                      return DropdownMenuItem(
                           value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newval) {
                      setState(() {
                        category = newval!;
                      });
                    }
                    ),
                ),
                SizedBox(height: 10,),
                CustomButton(
                    text: 'Sell',
                    onTap: (){
                      sellProduct();
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
