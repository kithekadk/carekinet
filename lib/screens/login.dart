import 'package:carekinet/screens/patientLandingPage.dart';
import 'package:carekinet/screens/registerPatient.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
}

loginPage(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  bool hidePassword = true;

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
          child: const TextField(
            decoration: InputDecoration(
                labelText: 'Username',
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
          obscureText: hidePassword, // hide text for password inputs
          decoration: InputDecoration(
              labelText: 'Password',
              suffixIcon: GestureDetector(
                onTap: () => {
                  hidePassword = !hidePassword
                },
                child: const  Icon(
                  // hidePassword ? Icons.visibility : Icons.visibility_off,
                  Icons.visibility_off
                  ),
              ),
              labelStyle: TextStyle(color: Color.fromARGB(255, 40, 40, 40)),
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Color.fromARGB(255, 221, 221, 221),
              focusedBorder: OutlineInputBorder(
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
            child:
                ElevatedButton(onPressed: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const PatientLandingPage()))
                }, child: const Text('LOGIN')),
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
