import 'package:carekinet/screens/login.dart';
import 'package:carekinet/screens/patientLandingPage.dart';
import 'package:carekinet/screens/registerCaregiver.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class VerifyPhone extends StatelessWidget {
  const VerifyPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: verifyPhoneBody(context),
    );
  }
}

Widget verifyPhoneBody(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return SingleChildScrollView(
    //Use this to enable scroll to deal with overflow error
    child: Column(
      children: [
        const Image(
          fit: BoxFit.cover,
          image: AssetImage('assets/african-nurse.jpg'),
          // image: NetworkImage('https://images.unsplash.com/photo-1610632380989-680fe40816c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGNvZmZlZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(size.width * 0.4, 40)),
                onPressed: () {
                  print('clicked');
                },
                child: const Text('Patients'),
              ),
              // GAP
              const Gap(20),
              TextButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(size.width * 0.4, 40)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterCaregiver(),
                      ));
                },
                child: const Text('Caregiver'),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          child: const Text(
            'Care Kinet',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
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
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  width: 70,
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: '+254',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(80, 20, 0, 20),
                  child: const TextField(
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
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(size.width * 0.4, 50)),
            onPressed: () {
              print('clicked');
            },
            child: const Text('Get Code'),
          )
        ]),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
                child: const Text('Skip Registration'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PatientLandingPage()));
                }),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Already have an account?'),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ));
                },
                child: const Text(
                  'Log in',
                  style: TextStyle(color: Colors.green),
                ))
          ],
        )
      ],
    ),
  );
}
