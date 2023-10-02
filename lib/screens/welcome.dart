import 'package:carekinet/screens/verifyphoneno.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 175, 204, 254),
      // appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [introText(context)],
            ),
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0, //removes navbar shadow
      backgroundColor: Colors.blueGrey,
      title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: Colors.black,
              size: 30,
            )
          ]),
    );
  }
}

Widget introText(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(top: 40.0),
          child: const Text(
            "Hello Friend,",
            style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 140, 254)),
          ),
        ),
        const SizedBox(height: 12),
        const Center(
          child: Text('Care Kinet',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,)),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Are you looking to find a caregiver who really cares about you? Are you seeking to improve your health outcomes. We can help you. Register today.',
          style: TextStyle(fontSize: 13, color: Colors.black),
        ),

        SizedBox(
          height: size.height * 0.5,
          child: Image.asset('assets/nurse.png'),
        ), //creates a gap to push the text below it to the bottom
        GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const VerifyPhone()));
            },
            child: const Center(
              child: Text('Get Started >>', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            ))
      ],
    ),
  );
}
