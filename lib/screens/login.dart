import 'dart:convert';
import 'dart:developer';

import 'package:carekinet/screens/patientLandingPage.dart';
import 'package:carekinet/screens/registerPatient.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool hidePassword = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<http.Response> _performLogin(String email, String password) async {
    const apiUrl = 'http://localhost:4500/employee/login';

    try {
      final response = await http.post(Uri.parse(apiUrl),
          body: {'email': email, 'password': password});

      print(response);
      

      if (response.statusCode == 200) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const PatientLandingPage()));
      } else {
        final responseData = json.decode(response.body);
        final errorMsg = responseData['message'] ?? 'Login failed';
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(errorMsg)));
      }
      return response;

    } catch (error) {
      print(error);
      print('Error during login: $error');
      return http.Response('Error during login', 500);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 175, 204, 254),
      body: Stack(
        children: [
          Image.asset(
            'assets/loginbg.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: loginPage(context),
          )
        ],
      ),
    );
  }

  void switchHidePassword() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  loginPage(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: size.height * 0.13),
          child: const Text(
            'Care Kinet',
            style: TextStyle(
                fontSize: 40, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        const Center(
          child: Icon(
            Icons.account_circle,
            size: 80,
            color: Colors.white,
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: size.width * 0.1),
            width: size.width * 0.9,
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Color.fromARGB(255, 40, 40, 40)),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Color.fromARGB(255, 221, 221, 221),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            )),
        Container(
          margin: EdgeInsets.only(top: size.width * 0.05),
          width: size.width * 0.9,
          child: TextField(
            controller: passwordController,
            obscureText: hidePassword, // hide text for password inputs
            decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: GestureDetector(
                  onTap: () => {
                    setState(() {
                      hidePassword = !hidePassword;
                    })
                  },
                  child: Icon(
                    hidePassword ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
                labelStyle:
                    const TextStyle(color: Color.fromARGB(255, 40, 40, 40)),
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: const Color.fromARGB(255, 221, 221, 221),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey))),
          ),
        ),
        Container(
          width: size.width * 0.9,
          margin: EdgeInsets.only(top: size.height * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(color: Colors.blue),
                ),
                onTap: () => {print('proceed to reset')},
              ),
            ],
          ),
        ),
        Column(
          children: [
            Container(
              width: size.width * 0.9,
              height: size.height * 0.06,
              margin: EdgeInsets.only(top: size.height * 0.02),
              child: ElevatedButton(
                  onPressed: () => {
                        _performLogin(
                            emailController.text, passwordController.text)
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             const PatientLandingPage()))
                      },
                  child: const Text('LOGIN')),
            ),
            Container(
              width: size.width * 0.9,
              height: size.height * 0.06,
              margin: EdgeInsets.only(top: size.height * 0.01),
              child: OutlinedButton(
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPatient()))
                      },
                  child: const Text('SIGN UP')),
            )
          ],
        )
      ],
    ));
  }
}
