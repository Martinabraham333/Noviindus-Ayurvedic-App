import 'dart:ui';

import 'package:ayurvedic_centre_patients/core/widgets/custom_button.dart';
import 'package:ayurvedic_centre_patients/core/widgets/custom_text.dart';
import 'package:ayurvedic_centre_patients/core/widgets/custom_textfield.dart';
import 'package:ayurvedic_centre_patients/presentation/providers/auth_provider.dart';
import 'package:ayurvedic_centre_patients/presentation/screens/patient_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    

    return Scaffold(
      body: authProvider.isLoading
          ? Center(child: const CircularProgressIndicator(color: Colors.green,))
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ImageFiltered(
                        imageFilter: ImageFilter.blur(
                          sigmaX: 3,
                          sigmaY: 3,
                        ), // blur strength
                        child: Image.asset(
                          'assets/images/login_image.jpg',
                          fit: BoxFit.fitWidth,
                          width: double.infinity,
                        ),
                      ),

                      Image.asset(
                        'assets/images/logo.png',
                        width: 200,
                        height: 100,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Login Or Register To book\nYour Appointments',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 40),

                        CustomTextField(
                          controller: _usernameController,
                          hintText: 'Enter Your User Name',
                          title: 'User Name',
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Enter Password',
                          title: 'Password',
                        ),
                        SizedBox(height: 60),

                        CustomButton(
                          title: 'Login',
                          ontap: () {
                            _login(authProvider);
                          },
                        ),

                        SizedBox(height: 60),

                        Text.rich(
                          TextSpan(
                            text:
                                'By creating or logging into an account you are agreeing with our ',
                            children: [
                              TextSpan(
                                text: 'Terms and Conditions ',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(text: 'and '),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  void _login(AuthProvider authProvider) async {
    await authProvider.login(
      _usernameController.text,
      _passwordController.text,
    );

    if (authProvider.userDeatils != null) {
       Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => PatientListScreen()),
        );
        


      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login successful!"),
          backgroundColor: Colors.green,
        ),
      );
     
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login failed! Check your credentials."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
