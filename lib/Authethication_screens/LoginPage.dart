// signup_page.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oops_project/Authethication_screens/SignupPage.dart';

import '../screens/Home_page.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

  final _auth= FirebaseAuth.instance;
  final TextEditingController _emailcontrolletr= TextEditingController();
  final TextEditingController _passwordcontrolletr= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Black background
      body: Center(
        child: SingleChildScrollView(
          padding:  EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person_add_alt_1_outlined,
                size: 100,
                color: Colors.white,
              ),
               SizedBox(height: 16),
              Text(
                'Login To Account',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
               SizedBox(height: 10),
               Text(
                'Login to explore amazing AI features!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),

             SizedBox(height: 16),
              _buildTextField(
                controller: _emailcontrolletr,
                label: 'Email',
                icon: Icons.email_outlined,
                isPassword: false,
              ),
               SizedBox(height: 16),
              _buildTextField(
                controller: _passwordcontrolletr,
                label: 'Password',
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              SizedBox(height: 32),
              SizedBox(
                width: 250, // Set width for the button
                child: ElevatedButton(
                  onPressed: ()async {
                    String email = _emailcontrolletr.text.trim();
                    String password = _passwordcontrolletr.text.trim();
                     try{
                        final loginuser=await _auth.signInWithEmailAndPassword(email: email, password: password);
                        if(loginuser!=null){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                        }
                        else{

                        }
                     }
                     catch(e){
                       print(e);
                     }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
               SizedBox(height: 20),
              TextButton(
                onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage())) ;
                },
                child:  Text(
                  'Dont Have a Account? Signup',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable TextField widget (same as Login Page)
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required bool isPassword,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.white),
        filled: true,
        fillColor: Colors.white24,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        labelStyle: const TextStyle(color: Colors.white),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
