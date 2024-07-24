import 'package:amazon_clone/constant/global_variable.dart';
import 'package:amazon_clone/feature/Home/screen/home.dart';
import 'package:amazon_clone/feature/account/screen/AccountScreen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BottomBar extends StatefulWidget {
  static const String  routename = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page  =0;
  double bottomnavwidth = 42;
  double bottombarnavwidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Text("cart page "),
  ];

  void updatepage(int page){
  setState(() {
    _page = page;
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:  _page,
         selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatepage,
        items: [
          BottomNavigationBarItem(icon: Container(
            width: bottomnavwidth,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(
                color: _page==0? GlobalVariables.selectedNavBarColor: GlobalVariables.backgroundColor,
                width: bottombarnavwidth,
              ))
            ),
              child: const Icon(
              Icons.home_outlined,

            )

          ),
            label: '',
          ),
          BottomNavigationBarItem(icon: Container(
            width: bottomnavwidth,
            decoration: BoxDecoration(
                border: Border(top: BorderSide(
                  color: _page==1? GlobalVariables.selectedNavBarColor: GlobalVariables.backgroundColor,
                  width: bottombarnavwidth,
                ))
            ),
            child: const Icon(
              Icons.person_outline_outlined,
            ),
          ),
            label: '',
          ),
          BottomNavigationBarItem(icon: Container(
            width: bottomnavwidth,
            decoration: BoxDecoration(
                border: Border(top: BorderSide(
                  color: _page==2? GlobalVariables.selectedNavBarColor: GlobalVariables.backgroundColor,
                  width: bottombarnavwidth,
                ),),
            ),


                child: badges.Badge(
                  badgeContent: Text('2'),
                  badgeStyle: badges.BadgeStyle(
                    badgeColor: Colors.white
                  ),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                  ),
                ),


          ),
            label: '',
          ),
        ],
      ),
    );
  }
}
