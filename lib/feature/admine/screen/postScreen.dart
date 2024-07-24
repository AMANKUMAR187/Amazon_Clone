import 'package:amazon_clone/feature/admine/screen/add_new_product.dart';
import 'package:amazon_clone/feature/admine/services/admin_service.dart';
import 'package:flutter/material.dart';

import '../../../model/product.dart';
import '../../account/widget/single_product.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  AdmineService admineService = AdmineService();
  List<Product>? product=[];
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
   fetchallproduct();
  }

  void deleteproduct(Product p,int idx){
    admineService.delete_product(context: context, product: p,
        onsuccess: (){
          product?.removeAt(idx);
          setState(() {

          });
        });

  }

   fetchallproduct() async{
     product = await admineService.getallproducts(context);
     setState(() {

     });
   }

  @override
  Widget build(BuildContext context) {
    return product == null
        ?   Container(
      child: Center(child: CircularProgressIndicator(),),
    )
        : Scaffold(
      body: GridView.builder(
        itemCount: product!.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2 ),
        itemBuilder: (context, index) {
          final productData = product![index];
          return Column(
            children: [
              SizedBox(
                height: 140,
                 child:
                 SingleProduct(
                  image: productData.images[0],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      productData.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  IconButton(
                    onPressed: (){
                      deleteproduct( product![index],index );
                    },
                    icon: const Icon(
                      Icons.delete_outline,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProductScreen()));},
        tooltip: 'Add a Product',
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
    );
  }
}