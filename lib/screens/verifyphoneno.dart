import 'package:flutter/material.dart';

class VerifyPhone extends StatelessWidget {
  const VerifyPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: verifyPhoneBodyImage(context),
    );
  }
}

Widget verifyPhoneBodyImage(BuildContext context) {
  return Column(
    children: [
      const Center(
          child: Image(
        image: AssetImage('assets/african-nurse.jpg'),
        // image: NetworkImage('https://images.unsplash.com/photo-1610632380989-680fe40816c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGNvZmZlZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
      )),
      Container(
        margin: const EdgeInsets.all(20),
        child: const Text('Care Kinet',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      ),
      const Center(
        child: Text(
          'Please enter your Mobile Number',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                width: 70,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '+254',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(80, 20, 0, 20),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              )
            ],
          ),
        ),
      ),
      Center(
        child: Container(
          width: 200,
          height: 40,
          child: ElevatedButton(
            onPressed: () {
              print('clicked');
            },
            child: Text('Get Code'),
          ),
        ),
      ),
      Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
            child: Text('Skip Registration'),
            onTap: () {
              print('Skip registration');
            },
          ),
        ),
      ),
      SizedBox(
        height: 50,
      ),
      Center(
        child: Text(
          'Already have an account? Log in'
        ),
      )
    ],
  );
}
