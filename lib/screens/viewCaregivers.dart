import 'dart:async';
import 'dart:math';

import 'package:carekinet/models/caregiver.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ViewCaregivers extends StatefulWidget {
  const ViewCaregivers({super.key});

  @override
  State<ViewCaregivers> createState() => _ListCarersState();
}

class _ListCarersState extends State<ViewCaregivers> {
  List caregiver = [];

  @override
  void initState() {
    super.initState();
    _getCaregivers();
  }

  Future<Object> _getCaregivers() async {
    const apiURL = 'http://10.0.2.2:4500/employee/get_caregivers';

    try {
      final response = await http.get(Uri.parse(apiURL),
          headers: {"Content-Type": "application/json"});

      final Map<String, dynamic> responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        final List<dynamic> parsedData = responseData['caregivers'];

        setState(() {
          caregiver = parsedData;
        });

        print('Caregivers Loaded Successfully: $caregiver');
      } else {
        print(response);
      }
      return caregiver;
    } catch (error) {
      print('Error is $error');
      return http.Response('Error loading Caregivers', 500);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildApBar(),
      body: filterCaregivers(context),
    );
  }

  AppBar _buildApBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.blue,
      centerTitle: true,
      title: const Row(children: [Text('Find Caregiver')]),
    );
  }

  Widget filterCaregivers(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        color: Colors.blue[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.white,
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Filter',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  IconButton(
                      onPressed: () {
                        print('View Menu');
                      },
                      icon: const Icon(Icons.arrow_downward_rounded))
                ],
              ),
            ),
            filterForm(context)
          ],
        ),
      ),
    );
  }

  Widget filterForm(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 12.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'By Location',
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      print('fetch location');
                    },
                    icon: const Icon(Icons.location_city_rounded))
              ],
            ),
            const Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'By Ailment e.g Diabetes',
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 6.0, horizontal: 0.0),
              child: (const Text('By Date & Time',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Date:'),
                Gap(8.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      print('Pick date');
                    },
                    child: Text('Select Start date'),
                  ),
                ),
                Gap(16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      print('Pick date');
                    },
                    child: Text('Select End date'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 0.875,
                  height: size.height * 0.06,
                  margin: EdgeInsets.only(top: size.height * 0.02),
                  child: ElevatedButton(
                      onPressed: () => {print('Filter caregivers')},
                      child: const Text('Filter')),
                ),
              ],
            ),
            listCaregivers()
          ],
        ),
      ),
    );
  }

  Widget listCaregivers() {
    return Container(
      color: const Color.fromARGB(255, 244, 244, 244),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      margin: const EdgeInsets.only(bottom: 8),
        height: 391,
        child: ListView.builder(
          itemCount: caregiver.length,
          itemBuilder: (context, index) {
            return singleCaregiver(caregiver[index]['full_name']);
          },
        ));
  }

  Widget singleCaregiver(String fullName) {
    return Container(
        color: Colors.grey,
        margin: const EdgeInsets.only(bottom: 10),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          onTap: () {
            print('One Caregiver card');
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          tileColor: Colors.white,
          title: Text(fullName),
          trailing: Container(
            child: Text('Trailing'),
          ),
        ));
  }
}
