import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 175, 204, 254),
      body: loginPage(context), 
    );
  }
}

Widget loginPage(BuildContext context){
  Size size = MediaQuery.of(context).size;

  return Column(
        children: [Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: size.height * 0.2),
          child: Text('Care Kinet', style: TextStyle(fontSize: 40, color: Colors.black),),
        )
        ]
  );
}
