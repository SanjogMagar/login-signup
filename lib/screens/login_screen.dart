import 'package:flutter/material.dart';
import 'package:userlogin/screens/dashboard_screen.dart';
import 'package:userlogin/screens/forgot_paswword_screen.dart';
import 'package:userlogin/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 final formkey = GlobalKey<FormState>();
 final _emailController = TextEditingController();
 final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
       appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text("Login Page ", style: TextStyle(color: Colors.white), ),
        
       ),
       body: SingleChildScrollView(
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
           children: [
            ClipOval(child: Image.asset("assets/images/notsecure.jpeg",
            width: 200,
            height: 200,
            fit: BoxFit.cover,),
            ),
             Padding(
               padding: const EdgeInsets.all(20),
               child: Center(
                 child: Form(
                  key: formkey ,
                  child: Column(
                    children: [
                      TextFormField(
                         style: const TextStyle(
                            color: Colors.white
                          ),   
                        controller: _emailController,
                        decoration: InputDecoration(
                         prefixIcon: Icon(Icons.email),
                          labelText: "Email ",
                          hintText: "Enter your email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                        ),
                        validator: (value) =>
                          value!.isEmpty ? "Enter your Email" : null
                        
                      ),
                      
                      SizedBox(height: 20,),
                      TextFormField(
                         style: const TextStyle(
                            color: Colors.white
                          ),   
                        controller: _passwordController,
                        decoration: InputDecoration(
                           prefixIcon: Icon(Icons.lock),
                          labelText: "Password",
                          hintText: "Enter your password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                        ),
                        validator: (value) =>
                          value!.isEmpty ? "Enter your Password" : null
                        
                      ),
                      SizedBox(height: 20,),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordPage()));
                      }, child: Text("Forgot Password" , style: TextStyle(color: Colors.white),),),
                      SizedBox(height: 20,),
                      ElevatedButton(onPressed: (){
                          if (formkey.currentState!.validate()) {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardScreen()));
                          }
                      }, child: Text("Sign-In" , style: TextStyle(color: const Color.fromARGB(255, 11, 44, 38), fontSize: 20, fontWeight: FontWeight.bold),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        
                      )
                      ),
             
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Don't have an account ?" , style: TextStyle(color: Colors.white),),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                            }, child: Text("Sign Up", style: TextStyle(color: Colors.white),),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  
                 
                 ),
               ),
             ),
           ],
         ),
       ),
    );
  }
}