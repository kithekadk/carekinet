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

Widget loginPage(BuildContext context) {
  Size size = MediaQuery.of(context).size;

  return SingleChildScrollView(child: 
    Column(
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: size.height * 0.2),
          child: const Text(
            'Care Kinet',
            style: TextStyle(fontSize: 40, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        const Center(
          child: Icon(Icons.account_circle, size: 80, color: Colors.white,),
        ),
        Container(
          margin: EdgeInsets.only(top: size.width * 0.1),
          width: size.width * 0.9,
          child: const TextField(
            decoration: InputDecoration(
              labelText: 'Username' ,
              labelStyle: TextStyle(color: Color.fromARGB(255, 40, 40, 40)),
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Color.fromARGB(255, 221, 221, 221),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
              )
            ),
          )),
        Container(
          margin: EdgeInsets.only(top: size.width * 0.05),
          width: size.width * 0.9,
          child: const TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password' ,
              labelStyle: TextStyle(color: Color.fromARGB(255, 40, 40, 40)),
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Color.fromARGB(255, 221, 221, 221),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
              )
            ),
          ),
        ),

        Container(
          width: size.width * 0.9,
          margin: EdgeInsets.only(top: size.height * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                child: const Text('Forgot password?', style: TextStyle(color: Colors.blue),),
                onTap: () =>{
                  print('proceed to reset')
                },
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
                ElevatedButton(onPressed: ()=>{

                }, child: const Text('LOGIN')),
            ),
            Container(
              width: size.width * 0.9,
              height: size.height * 0.06,
              margin: EdgeInsets.only(top: size.height * 0.01),
              child: OutlinedButton(onPressed: ()=>{
            
              }, child: const Text('SIGN UP')),
            )
          ],
        )
      ],
    )
  );
}
