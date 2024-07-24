import 'package:amazon_clone/constant/global_variable.dart';
import 'package:flutter/material.dart';

class Ordes extends StatefulWidget {
  const Ordes({super.key});

  @override
  State<Ordes> createState() => _OrdesState();
}

class _OrdesState extends State<Ordes> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Container(
              padding: EdgeInsets.only(left: 15),
              child: const Text('your order',
              style: TextStyle(
                fontSize: 18,
                 fontWeight: FontWeight.w600,

              ),),
            ),
            Container(
              padding: EdgeInsets.only(left: 15,right: 15),
              child:  Text('see all',
                style: TextStyle(
                  color: GlobalVariables.selectedNavBarColor,

                ),),
            )
          ],
        ),
        Container(
          height: 170,
          padding: EdgeInsets.only(
            left: 10,
              top: 20 ,
              right: 0,
          ),

        // list view generated hare only.


        )
      ],
    );
  }
}
