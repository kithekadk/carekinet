import 'dart:convert';

import 'package:carekinet/screens/login.dart';
import 'package:carekinet/screens/patientLandingPage.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;

class RegisterCaregiver extends StatefulWidget {
  const RegisterCaregiver({super.key});

  @override
  State<RegisterCaregiver> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterCaregiver> {
  final TextEditingController fullnamesController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phonenoController = TextEditingController();
  final TextEditingController certificationController = TextEditingController();
  final TextEditingController certifiedFromController = TextEditingController();
  final TextEditingController profileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<http.Response> _performRegistration(
      String full_name,
      String email,
      String phone_no,
      String certification_no,
      String certified_from,
      String profile,
      String password
      ) async {
    const apiUrl = 'http://10.0.2.2:4500/employee/register_caregiver';
    try {
      final response = await http.post(Uri.parse(apiUrl),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            'full_name': full_name,
            'email': email,
            'phone_no': phone_no,
            'certification_no': certification_no,
            'certified_from': certified_from,
            'profile': profile,
            'password': password
          }));

      print(response);

      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        await Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const PatientLandingPage()));
      } else {
        final responseData = json.decode(response.body);
        final errorMsg = responseData['message'] ?? 'Registration failed';
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(errorMsg),
          backgroundColor: Colors.red[400],
        ));
      }
      return response;
    } catch (error) {
      print('Error during registration: $error');
      return http.Response('Error during registration', 500);
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
            margin: EdgeInsets.symmetric(vertical: size.height * 0.05),
            child: const Text(
              'Care Kinet',
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(padding: EdgeInsetsDirectional.only(top: 5.0)),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: size.height * 0.005),
            width: size.width * 0.9,
            child: TextField(
              controller: fullnamesController,
              decoration: const InputDecoration(
                  labelText: 'Full names', border: OutlineInputBorder()),
            ),
          ),
          Container(
            width: size.width * 0.9,
            margin: EdgeInsets.symmetric(vertical: size.height * 0.005),
            child: TextField(
              controller: phonenoController,
              decoration: const InputDecoration(
                  labelText: 'Phone number', border: OutlineInputBorder()),
            ),
          ),
          Container(
            width: size.width * 0.9,
            margin: EdgeInsets.symmetric(vertical: size.height * 0.005),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                  labelText: 'Email', border: OutlineInputBorder()),
            ),
          ),
          Container(
            width: size.width * 0.9,
            margin: EdgeInsets.symmetric(vertical: size.height * 0.005),
            child: TextField(
              controller: certificationController,
              decoration: const InputDecoration(
                  labelText: 'Certification Number',
                  border: OutlineInputBorder()),
            ),
          ),
          Container(
            width: size.width * 0.9,
            margin: EdgeInsets.symmetric(vertical: size.height * 0.005),
            child: TextField(
              controller: certifiedFromController,
              decoration: const InputDecoration(
                  labelText: 'Certified From', border: OutlineInputBorder()),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: size.height * 0.005),
            width: size.width * 0.9,
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: 'Password', border: OutlineInputBorder()),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: size.height * 0.005),
            width: size.width * 0.9,
            child: TextField(
              controller: profileController,
              decoration: const InputDecoration(
                  labelText: 'Profile', border: OutlineInputBorder()),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.width * 0.1),
            width: size.width * 0.9,
            height: size.height * 0.06,
            child: ElevatedButton(
                onPressed: () => {
                      _performRegistration(
                          fullnamesController.text,
                          emailController.text,
                          phonenoController.text,
                          certificationController.text,
                          certifiedFromController.text,
                          profileController.text,
                          passwordController.text)
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
