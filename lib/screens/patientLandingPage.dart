import 'package:carekinet/screens/addDosages.dart';
import 'package:carekinet/screens/addPersonalCaregiver.dart';
import 'package:carekinet/screens/constants/colors.dart';
import 'package:carekinet/screens/login.dart';
import 'package:carekinet/screens/viewCaregivers.dart';
import 'package:flutter/material.dart';

class PatientLandingPage extends StatelessWidget {
  const PatientLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: patientMenu(context),
      body: patientPage(context),
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    elevation: 0, //removes navbar shadow
    backgroundColor: Colors.blue,
    centerTitle: true,
    title:
        const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text('CareKinet'),
      // Icon(
      //   Icons.menu,
      //   color: Colors.black,
      //   size: 30,
      // )
    ]),
  );
}

Widget patientPage(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0)),
              color: Color.fromARGB(255, 136, 217, 255)),
          height: size.height * 0.16,
          padding:
              EdgeInsets.symmetric(vertical: 8, horizontal: size.width * 0.03),
          child: Column(
            children: [
              const Row(children: [
                Text(
                  'Welcome',
                  style: TextStyle(),
                ),
                Text(' '),
                Text(
                  'Tilda',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ]),
              searchBox(context),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  width: 80,
                  height: 80,
                  child: TextButton(
                    onPressed: () => {},
                    child: const Icon(Icons.warning, color: Colors.red),
                  )),
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  width: 80,
                  height: 80,
                  child: TextButton(
                      onPressed: () => {},
                      child: const Icon(
                        Icons.message,
                        color: Colors.white,
                      ))),
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  width: 80,
                  height: 80,
                  child: TextButton(
                      onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ViewCaregivers()))
                          },
                      child: const Text(
                        'Search caregiver?',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 11.0, color: Colors.white),
                      ))),
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  width: 80,
                  height: 80,
                  child: TextButton(
                      onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AddPersonalCaregiver()))
                          },
                      child: const Text(
                        'Add my caregiver?',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 11.0, color: Colors.white),
                      )))
            ],
          ),
        ),
        activitiesSection(context)
      ],
    ),
  );
}

Widget searchBox(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Container(
      padding: EdgeInsets.only(top: size.height * 0.01),
      child: const TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.white)),
      ));
}

Widget activitiesSection(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(
              top: size.width * 0.03, bottom: size.width * 0.03),
          child: const Text(
            'Activity',
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const Center(
          child: Text('You have no dosages'),
        ),
        Divider(
          height: 5,
          thickness: 2.0,
          color: grey,
        ),
        Row(
          children: [
            const Icon(
              Icons.local_hospital,
              size: 50,
              color: Colors.green,
            ),
            Container(
                width: size.width * 0.7,
                padding: EdgeInsets.only(
                    top: size.height * 0.15, left: size.width * 0.2),
                child: GestureDetector(
                  onTap: () {
                    addDosages(context);
                  },
                  child: Text(
                    'Add Dosages Now',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: grey),
                  ),
                )),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Divider(
            height: 5,
            thickness: 1.0,
            color: grey,
          ),
        ),
        Row(
          children: [
            const Icon(
              Icons.calendar_today,
              size: 50,
              color: Colors.green,
            ),
            Container(
                width: size.width * 0.7,
                padding: EdgeInsets.only(
                    top: size.height * 0.15, left: size.width * 0.15),
                child: GestureDetector(
                  child: Text(
                    'Lets help you never miss any Appointment',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: grey),
                  ),
                )),
          ],
        )
      ],
    ),
  );
}

Widget patientMenu(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(color: Colors.blue),
          child: Text('Menu'),
        ),
        ListTile(
          title: const Text('Upcoming Events'),
          onTap: () {
            print('Clicked');
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Medical History'),
          onTap: () {
            print('Clicked');
          },
        ),
        ListTile(
          title: const Text('Add Syptoms'),
          onTap: () {
            print('Clicked');
          },
        ),
        ListTile(
          title: const Text('View Caregivers'),
          onTap: () {
            print('Clicked');
          },
        ),
        ListTile(
          title: const Text('Logout'),
          textColor: Colors.red,
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Login()));
          },
        ),
      ],
    ),
  );
}

void addDosages(BuildContext context) {
  Navigator.push(context,
  MaterialPageRoute(
    builder: (context) => const AddDosages(),
  ));
}
