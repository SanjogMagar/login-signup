import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
  backgroundColor: Colors.black,
  iconTheme: const IconThemeData(color: Colors.white), // ← Back icon color
  title: const Text(
    "Forgot Password",
    style: TextStyle(color: Colors.white),
  ),
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
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Reset Password",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                      const SizedBox(height: 10),
            
                      const Text(
                        "Enter your email and we'll send you a reset link.",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      
                      ),
                      const SizedBox(height: 30),
            
                      // Email Field
                      TextFormField(
                         style: const TextStyle(
                                color: Colors.white
                              ),   
                        controller: _emailController,
                        decoration: InputDecoration(
                           prefixIcon: Icon(Icons.email),
                          labelText: "Email",
                          hintText: "Enter your email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter your email";
                          }
                          if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                              .hasMatch(value)) {
                            return "Enter a valid email";
                          }
                          return null;
                        },
                      ),
            
                      const SizedBox(height: 30),
            
                      // Send Reset Link Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              //message
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Password reset link sent!", style: TextStyle(color: Colors.white),),
                                ),
                              );
                            }
                          },
                          child: const Text("Send Reset Link" , style: TextStyle(
                            color: Colors.green
                          )),
                        ),
                      ),
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
