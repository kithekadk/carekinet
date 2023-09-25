import 'package:carekinet/screens/patientLandingPage.dart';
import 'package:flutter/material.dart';

class AddPersonalCaregiver extends StatelessWidget {
  const AddPersonalCaregiver({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: personalCaregiverForm(context),
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.blue,
    title: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text('Add Caregiver'), Text('')],
    ),
  );
}

Widget personalCaregiverForm(BuildContext context) {
  Size size = MediaQuery.of(context).size;

  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
            width: size.width * 0.98,
            child: const TextField(
              decoration: InputDecoration(
                  labelText: 'Name', border: OutlineInputBorder()),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: size.width * 0.01),
            width: size.width * 0.98,
            child: const TextField(
              decoration: InputDecoration(
                  labelText: 'Email', border: OutlineInputBorder()),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: size.width * 0.01),
            width: size.width * 0.98,
            child: const TextField(
              decoration: InputDecoration(
                  labelText: 'Phone Number', border: OutlineInputBorder()),
            ),
          ),
          Container(
              width: size.width * 0.95,
              height: size.height * 0.07,
              margin: EdgeInsets.only(top: size.height * 0.02),
              child: ElevatedButton(
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PatientLandingPage()))
                      },
                  child: const Text('Create Caregiver',style: TextStyle(fontSize: 20 ))),
            ),
        ],
      ),
    ),
  );
}
