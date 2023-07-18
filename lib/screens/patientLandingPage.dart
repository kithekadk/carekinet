import 'package:carekinet/screens/constants/colors.dart';
import 'package:flutter/material.dart';

class PatientLandingPage extends StatelessWidget {
  const PatientLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: patientPage(context),
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    elevation: 0, //removes navbar shadow
    backgroundColor: Colors.blue,
    title:
        const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(''),
      Icon(
        Icons.menu,
        color: Colors.black,
        size: 30,
      )
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
              color: Colors.grey),
          height: size.height * 0.15,
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
          padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(decoration: const BoxDecoration(color: Colors.orange), width: 80 , height: 80 ,child: TextButton(onPressed: () => {}, child: const Icon(Icons.warning, color:Colors.red),)),
              Container(decoration: const BoxDecoration(color: Colors.orange), width: 80 , height: 80 ,child: TextButton(onPressed: ()=> {}, child: Icon(Icons.message))),
              Container(decoration: const BoxDecoration(color: Colors.orange), width: 80 , height: 80,child: TextButton(onPressed: ()=> {}, child: Text('Finding caregiver?', textAlign: TextAlign.center, style: TextStyle(fontSize: 11.0),)))
            ],
          ),
        )
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
