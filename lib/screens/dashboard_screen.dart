import 'package:flutter/material.dart';
import 'package:userlogin/screens/login_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
       
         backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Dashboard",style: TextStyle(color: Colors.white),),
        automaticallyImplyLeading: false, // no back button
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              ClipOval(child: Image.asset("assets/images/notsecure.jpeg",
            width: 200,
            height: 200,
            fit: BoxFit.cover,),
            ),
            const Text(
              "Welcome to Dashboard!", 
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold , color: Colors.white),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
