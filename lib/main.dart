import 'package:amazon_clone/common/widget/bottombar.dart';
import 'package:amazon_clone/constant/global_variable.dart';
import 'package:amazon_clone/feature/Home/screen/home.dart';
import 'package:amazon_clone/feature/admine/screen/admineScreen.dart';
import 'package:amazon_clone/feature/auth/auth_screen/authscreen.dart';
import 'package:amazon_clone/feature/auth/server/auth_service.dart';
import 'package:amazon_clone/model/user.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:amazon_clone/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
       providers: [ChangeNotifierProvider(create : (context)=> UserProvider(),
       ),
  ],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
     final Authservice authservice = Authservice();

     @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("init state");
    authservice.getuserdata(context);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amazon Clone',
      theme: ThemeData(
          colorScheme: const ColorScheme.light(
            primary: GlobalVariables.secondaryColor,
          ),
           scaffoldBackgroundColor: GlobalVariables.backgroundColor,
           appBarTheme: AppBarTheme(
             elevation: 0,
             iconTheme: IconThemeData(
               color: Colors.black,
             )
           )
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home:  Provider.of<UserProvider>(context).user.token.isNotEmpty?
      Provider.of<UserProvider>(context).user.type=='user'?
      const BottomBar() : AdmineScreen() :const AuthScreen() ,
    );
  }
}
