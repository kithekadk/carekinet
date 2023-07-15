import 'package:carekinet/screens/verifyphoneno.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: _buildAppBar(),
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
  final setHeight = MediaQuery.of(context).size.height;
  final requiredHeight = setHeight * 0.5;
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Hello Friend,",
          style: TextStyle(fontSize: 12),
        ),
        const SizedBox(height: 12),
        const Center(
          child: Text('Care Kinet',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'CareKinet is a mobile application designed to provide healthcare information and support to individuals. CareKinet helps users manage their appointments efficiently, ensuring timely access to healthcare services. It also focuses on improving drug adherence by providing medication reminders and tracking tools. Additionally, the app simplifies the process of finding and hiring home caregivers, offering a directory and matching services. With its user-friendly interface and diverse features, CareKinet empowers individuals to take control of their healthcare by seamlessly managing appointments, promoting medication adherence, and facilitating caregiver connections.',
          style: TextStyle(fontSize: 12),
        ),

        SizedBox(
          height: requiredHeight,
        ), //creates a gap to push the text below it to the bottom
        GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const VerifyPhone()));
            },
            child: const Center(
              child: Text('Get Started >>'),
            ))
      ],
    ),
  );
}
