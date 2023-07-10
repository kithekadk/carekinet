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
              children: [introText()],
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

Widget introText() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Hello Friend,",
          style: TextStyle(fontSize: 10),
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
          'loremipsumloremipsumloremipsumloremipsumloremipsumloremipsumloremipsumloremipsumloremipsumloremipsumloremipsumloremipsumloremipsumloremipsum',
          style: TextStyle(fontSize: 12),
        ),

        const SizedBox(
          height: 10,
        ), //creates a gap to push the text below it to the bottom
        GestureDetector(
            onTap: () {
              print("fsfsfs");
            },
            child: const Text(
              'Get Started >>'
            ))
      ],
    ),
  );
}
