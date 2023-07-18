import 'package:carekinet/screens/login.dart';
import 'package:flutter/material.dart';

class RegisterPatient extends StatelessWidget {
  const RegisterPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: registerPatient(context),
    );
  }
}

Widget registerPatient(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return SingleChildScrollView(
      child: Center(
    child: Column(
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: size.height * 0.10),
          child: const Text(
            'Care Kinet',
            style: TextStyle(fontSize: 40, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
          width: size.width * 0.9,
          child: const TextField(
            decoration: InputDecoration(
                labelText: 'Full names', border: OutlineInputBorder()),
          ),
        ),
        Container(
          width: size.width * 0.9,
          child: const TextField(
            decoration: InputDecoration(
                labelText: 'Email', border: OutlineInputBorder()),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
          width: size.width * 0.9,
          child: const TextField(
            decoration: InputDecoration(
                labelText: 'Password', border: OutlineInputBorder()),
          ),
        ),
        Container(
          width: size.width * 0.9,
          child: const TextField(
            decoration: InputDecoration(
                labelText: 'Confirm Password', border: OutlineInputBorder()),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: size.width * 0.1),
          width: size.width * 0.9,
          height: size.height * 0.06,
          child: ElevatedButton(onPressed: ()=>{

          }, child: Text('CREATE ACCOUNT')),
        ),
        Container(
          margin: EdgeInsets.only(top: size.width * 0.1),
          child: GestureDetector(
            onTap: ()=>{

            },child: Text('Skip Registration'),
          ),
        ),
        Container(
           margin: EdgeInsets.only(top: size.width * 0.1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account?', style: TextStyle(fontWeight: FontWeight.bold),),
              GestureDetector(
                onTap: ()=>{
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()))
                }, child: const Text('Log in', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),)
            ],
          ),
        )
      ],
    ),
  ));
}
