import 'dart:developer';

import 'package:flutter/material.dart';

import 'FirebaseAuth.dart';
import 'LogIn.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  bool _isObscure = true;
  bool _isObscure1 = true;
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF008080),
      body: Container(
        width:double.infinity,
        height: double.infinity,
        decoration:const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          
          key: _key,
          child: Padding(
            
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white60),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white60),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white60),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        var snackBar = const SnackBar(
                            content: Text('Email Cannot Be Empty!'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
          
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: _passwordController,
                    obscureText: _isObscure1,
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white60),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white60),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white60),
                      ),
                      suffixIcon: IconButton(
                        
                        icon: Icon(_isObscure1
                            ? Icons.visibility_off_outlined 
                            : Icons.visibility_rounded,color: Colors.white60,),
                        onPressed: () {
                          setState(() {
                            _isObscure1 = !_isObscure1;
                          });
                          
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        var snackBar = const SnackBar(
                            content: Text('Password Cannot Be Empty!'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else if (value.length < 8) {
                        var snackBar = const SnackBar(
                            content: Text(
                                'Length Of Password Should be Greater than 8!'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      return null;
                    },
                  ),
                 
                  const SizedBox(height: 16),

                       TextFormField(
                    
                    controller: _confirmpasswordController,
                    obscureText: _isObscure,
                    style: TextStyle(color:Colors.white),
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(color: Colors.white60),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white60),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white60),
                      ),
                      suffixIcon: IconButton(
                        
                        icon: Icon(_isObscure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_rounded,color: Colors.white60,),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                          
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        var snackBar = const SnackBar(
                            content: Text('Confirm Password Cannot Be Empty!'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else if (_passwordController.text != _confirmpasswordController.text) {
                        var snackBar = const SnackBar(
                            content: Text(
                                'password & confirm password should be similar!'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 35.0),
                  ElevatedButton(
                    onPressed: ()async{
                      if(_key.currentState!.validate()){
                        await FirebaseAuthentication().createUserWithEmailAndPassword(_emailController.text,_passwordController.text).then((value){
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) =>const Login()), 
                          );
                        });
                        log('Form Submitted!');
                      }else{
                        log('Not Submitted!');
                      }
                      
                    },
                    style: ElevatedButton.styleFrom(
                     backgroundColor : Colors.white, 
                     shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), 
                    ),
                    minimumSize:const Size(double.infinity, 48.0),
                    ),
                    child:const Text('Sign Up',style:TextStyle(color: Colors.teal),),
                  ),

                  const SizedBox(height: 20.0),
              Container(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) =>const Login()), 
                      );
                    },
                    child: const Text.rich(
                      TextSpan(
                        text: 'Already Signed Up? ',
                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Colors.white60, decoration: TextDecoration.none,),
                          
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'SignIn',
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Colors.white, decoration: TextDecoration.none,),
                          )
                          
                        ],
                      ),
                    ),
                  ),
                ],
                ),
                 ),
              ],
            ),
          ),

        ),
      ),
    );
  }
}
