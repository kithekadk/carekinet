import 'dart:convert';

import 'package:carekinet/screens/login.dart';
import 'package:carekinet/screens/patientLandingPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterPatient extends StatefulWidget {
  const RegisterPatient({super.key});

  @override
  State<RegisterPatient> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPatient> {
  final TextEditingController namesController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpwdController = TextEditingController();

  Future<http.Response> _performRegistration(
      String fullname, String email, String password, String confirmpwd) async {
    const apiUrl = 'http://10.0.2.2:4500/employee/register';
    try {
      final response = await http.post(Uri.parse(apiUrl),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({'email': email, 'password': password}));

      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        await Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const PatientLandingPage()));
      } else {
        final responseData = json.decode(response.body);
        final errorMsg = responseData['message'] ?? 'Login failed';
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(errorMsg),
          backgroundColor: Colors.red[400],
        ));
      }
      return response;
    } catch (error) {
      print('Error during login: $error');
      return http.Response('Error during login', 500);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: registerPage(context),
          )
        ],
      ),
    );
  }

  registerPage(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: size.height * 0.10),
            child: const Text(
              'Care Kinet',
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
            width: size.width * 0.9,
            child: TextField(
              controller: namesController,
              decoration: const InputDecoration(
                  labelText: 'Full names', border: OutlineInputBorder()),
            ),
          ),
          Container(
            width: size.width * 0.9,
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                  labelText: 'Email', border: OutlineInputBorder()),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
            width: size.width * 0.9,
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: 'Password', border: OutlineInputBorder()),
            ),
          ),
          Container(
            width: size.width * 0.9,
            child: TextField(
              controller: confirmpwdController,
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: 'Confirm Password', border: OutlineInputBorder()),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.width * 0.1),
            width: size.width * 0.9,
            height: size.height * 0.06,
            child: ElevatedButton(
                onPressed: () => {
                      _performRegistration(
                          namesController.text,
                          emailController.text,
                          passwordController.text,
                          confirmpwdController.text)
                    },
                child: Text('CREATE ACCOUNT')),
          ),
          Container(
            margin: EdgeInsets.only(top: size.width * 0.1),
            child: GestureDetector(
              onTap: () => {},
              child: Text('Skip Registration'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.width * 0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () => {
                    // print("clicked"),
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()))
                  },
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
