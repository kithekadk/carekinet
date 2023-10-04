import 'package:flutter/material.dart';

class AddDosages extends StatelessWidget {
  const AddDosages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: addDrugsForm(),
    );
  }

  AppBar _buildAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.blue,
    title: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text('Add Dosages'), Text('')],
    ),
  );
}

Widget addDrugsForm(){
  return const SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Drug name',
              border: OutlineInputBorder()
            ),
          )
        ],
      ),
    ),
  );
}
}

// class dru