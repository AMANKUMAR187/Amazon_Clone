import 'package:amazon_clone/feature/Home/service/homeservice.dart';
import 'package:flutter/material.dart';

import '../../../constant/global_variable.dart';
import '../../../model/product.dart';

class CategoryScreen extends StatefulWidget {
  final String category;
  const CategoryScreen({super.key,required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Product>? productList;
  final HomeService homeService = HomeService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   fetchlist();
  }
  void fetchlist()  async {
    productList =  await homeService.fetchbycategory(context: context, category: widget.category);
     setState(() {

     });
  }


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Text(
            widget.category,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: productList == null
          ? Container( child: const CircularProgressIndicator())
          : Column(
        children: [
          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            alignment: Alignment.topLeft,
            child: Text(
              'Keep shopping for ${widget.category}',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 170,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 15),
              itemCount: productList!.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1.4,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final product = productList![index];
                return GestureDetector(
                  onTap: () {

                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 130,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black12,
                              width: 0.5,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.network(
                              product.images[0],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(
                          left: 0,
                          top: 5,
                          right: 15,
                        ),
                        child: Text(
                          product.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

}