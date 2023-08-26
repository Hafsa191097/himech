
import 'package:flutter/material.dart';
import '../adminDashboard.dart';
import '../userDashboard.dart';
import 'FirebaseAuth.dart';
import 'SignUp.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscure = true;
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    obscureText: _isObscure,
                    keyboardType: TextInputType.visiblePassword,
                    cursorColor: Colors.white,
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
                        icon: Icon(_isObscure
                            ? Icons.visibility_off_outlined 
                            : Icons.visibility_rounded ,color: Colors.white60,),
                        
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
                 
                 const SizedBox(height: 35.0),
                  ElevatedButton(
                     onPressed: ()async{
                      if(_key.currentState!.validate()){

                      try {
                        bool isFound = await FirebaseAuthentication().checkAdminEmailExists(_emailController.text.trim());
                        if(isFound){
                          await FirebaseAuthentication().signinUserWithEmailAndPassword(_emailController.text.trim(), _passwordController.text.trim()).then((value){
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) =>const admindashboard()), 
                          );
                        });
                        }else{
                            await FirebaseAuthentication().signinUserWithEmailAndPassword(_emailController.text.trim(), _passwordController.text.trim()).then((value){
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) =>const userDashboard()), 
                          );
                        });
                        }
                          
                        } catch (e) {
                          var snackBar =
                            SnackBar(content: Text(e.toString()));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      
                        };
                    },
                  

                    style: ElevatedButton.styleFrom(
                     backgroundColor : Colors.white, 
                     shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), 
                    ),
                    minimumSize:const Size(double.infinity, 48.0),
                    ),
                    child:const Text('LogIn',style:TextStyle(color: Colors.teal),),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) =>const SignUp()), 
                      );
                    },
                    child: const Text.rich(
                      TextSpan(
                        text: 'Already Signed In? ',
                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Colors.white60, decoration: TextDecoration.none,),
                          
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'SignUp',
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
