import 'package:amazon_clone/constant/global_variable.dart';
import 'package:amazon_clone/feature/auth/server/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/common/widget/customButton.dart';
import 'package:amazon_clone/common/widget/customTextField.dart';


enum Auth{
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routename ='/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signupformkey  = GlobalKey<FormState>();
  final _signinformkey  = GlobalKey<FormState>();
  final Authservice authservice  = Authservice();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password  =TextEditingController();
  final TextEditingController _name = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
    _email.dispose();
    _password.dispose();
    _name.dispose();
  }
  void signupuser(){
    authservice.signup(context: context, email: _email.text, password: _password.text, name: _name.text);
  }
  void signinuser(){
    authservice.signin(context: context, email: _email.text, password: _password.text );
  }


  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          backgroundColor: GlobalVariables.greyBackgroundCOlor,
          body: SafeArea(

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('WELCOME',style: TextStyle(fontSize: 27),),
                  ListTile(
                    tileColor: _auth==Auth.signup? GlobalVariables.backgroundColor:GlobalVariables.greyBackgroundCOlor,

                    title: Text(
                      'Create Account',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    leading: Radio(
                      activeColor: GlobalVariables.secondaryColor,
                      value: Auth.signup,
                      groupValue: _auth,
                      onChanged: (Auth? val){
                        setState(() {
                          _auth = val!;
                        });
                      },
                    ),
                  ),
                  if(_auth == Auth.signup)
                    Form(
                      key: _signupformkey,
                      child: Column(
                        children: [
                          CustomTextField(controller: _email, hintText: 'email'),
                          SizedBox(height: 10,),
                          CustomTextField(controller: _name, hintText: 'name'),
                          SizedBox(height: 10,),
                          CustomTextField(controller: _password, hintText: 'password'),
                          SizedBox(height: 10,),
                          CustomButton(text: 'Sign-Up',
                              onTap: (){
                            // if(_signupformkey.currentState!.validate()){
                              signupuser();
                            //}
                            },
                          )
                        ],
                      ),
                    ),
                  ListTile(
                    tileColor: _auth==Auth.signin? GlobalVariables.backgroundColor:GlobalVariables.greyBackgroundCOlor,
                    title: Text(
                      'Sign-IN.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    leading: Radio(
                      activeColor: GlobalVariables.secondaryColor,
                      value: Auth.signin,
                      groupValue: _auth,
                      onChanged: (Auth? val){
                        setState(() {
                          _auth = val!;
                        });
                      },
                    ),
                  ),
                  if(_auth == Auth.signin)
                    Form(
                      key: _signinformkey,
                      child: Column(
                        children: [
                          CustomTextField(controller: _email, hintText: 'email'),
                          SizedBox(height: 10,),
                          CustomTextField(controller: _password, hintText: 'password'),
                          SizedBox(height: 10,),
                          CustomButton(text: 'Sign-in', onTap: (){
                            if(_signinformkey.currentState!.validate()){
                              signinuser();
                            }
                          } )
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),


        );
  }
}
