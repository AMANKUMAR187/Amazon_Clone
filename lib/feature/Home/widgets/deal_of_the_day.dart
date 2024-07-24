import 'package:flutter/material.dart';


class DealOfThedarScreen extends StatefulWidget {
  const DealOfThedarScreen({super.key});

  @override
  State<DealOfThedarScreen> createState() => _DealOfThedarScreenState();
}

class _DealOfThedarScreenState extends State<DealOfThedarScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left : 10,top: 15),
            child: Text(
              'Deal of the Day',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),

          ),
          SizedBox(height: 6,),
          Image.network('https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhcHRvcHxlbnwwfHwwfHx8MA%3D%3D',

          fit: BoxFit.fitHeight,
          ),
          Container(
            padding: EdgeInsets.only(left:15,top:5,right:40),
            alignment: Alignment.topLeft,
            child: Text('\$999',
            style: TextStyle(
              fontSize: 18
            ),),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left:15,top:2,right:40),
            child: Text(
              'amanb',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
           ),
           SingleChildScrollView(
             scrollDirection: Axis.horizontal,

             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,

               children: [
                 Image.network('https://images.unsplash.com/photo-1502882705085-fd1fd2ecefd0?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fG1hY2tib29rfGVufDB8fDB8fHww',
                   fit: BoxFit.fitWidth,
                   height: 100,
                   width: 100,),
                 Image.network('https://images.unsplash.com/photo-1502882705085-fd1fd2ecefd0?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fG1hY2tib29rfGVufDB8fDB8fHww',
                   fit: BoxFit.fitWidth,
                   height: 100,
                   width: 100,),
                 Image.network('https://images.unsplash.com/photo-1502882705085-fd1fd2ecefd0?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fG1hY2tib29rfGVufDB8fDB8fHww',
                   fit: BoxFit.fitWidth,
                   height: 100,
                   width: 100,),
                 Image.network('https://images.unsplash.com/photo-1502882705085-fd1fd2ecefd0?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fG1hY2tib29rfGVufDB8fDB8fHww',
                   fit: BoxFit.fitWidth,
                   height: 100,
                   width: 100,),
                 Image.network('https://images.unsplash.com/photo-1502882705085-fd1fd2ecefd0?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fG1hY2tib29rfGVufDB8fDB8fHww',
                   fit: BoxFit.fitWidth,
                   height: 100,
                   width: 100,),
               ],

             ),
           ),
          Container(
           padding: EdgeInsets.symmetric(vertical: 15).copyWith(left:15),
            alignment: Alignment.topLeft,
            child: Text('see all deals',style: TextStyle(
               color: Colors.cyan,
            ),),
          ),

        ],
      ),
    );
  }
}
