// ignore_for_file: prefer_const_constructors

// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hotelbooking/Model/customerdetails.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CustomerDetailsAfterBooking extends StatefulWidget {
  const CustomerDetailsAfterBooking({Key? key}) : super(key: key);

  @override
  State<CustomerDetailsAfterBooking> createState() =>
      _CustomerDetailsAfterBookingState();
}

class _CustomerDetailsAfterBookingState
    extends State<CustomerDetailsAfterBooking> {
  double height = 0;
  double width = 0;
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    setState(() {
      height = MediaQuery.of(context).size.height;
      width = MediaQuery.of(context).size.width;
    });
  }

  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  TextEditingController city = new TextEditingController();
  TextEditingController state = new TextEditingController();
  TextEditingController phoneNumber = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 60),
          child: Text(
            "Customer Information ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                'Guest Details',
                style: TextStyle(color: Colors.black54, fontSize: 18),
              ),
              Text(
                  'We will use this information to share your booking details.',
                  style: TextStyle(fontSize: 13)),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: TextField(
                  controller: firstName,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 3),
                    labelText: 'first Name',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'shyam',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: TextField(
                  controller: lastName,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 3),
                    labelText: 'Last Name',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Nepal',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: TextField(
                  controller: phoneNumber,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 3),
                    labelText: 'Phone Number',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: '9843117125',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: TextField(
                  controller: state,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 3),
                    labelText: 'state',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Bagmati',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: TextField(
                  controller: city,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 3),
                    labelText: 'City',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Kathmandu',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: width * .8,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    BookingDetails();
                  },
                  child: const Text('submit'),
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xff40cd7d),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future BookingDetails() async {
    String APIURL = "http://10.0.2.2:8000/api/customer-details/";

    customerDetails model = customerDetails(
      firstName: firstName.text,
      lastName: lastName.text,
      city: city.text,
      state: state.text,
      PhoneNumber: phoneNumber.text,
    );

    http.Response response =
        await http.post(Uri.parse(APIURL), body: model.toJson());
    final body = jsonDecode(response.body);
    if (response.statusCode == 200 && response.statusCode == 201) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Sucessfully book the room")));
      print("value add");
      await customer();
    } else {
      print("exception occor $response");
      print(response.statusCode);
    }
  }

  Future customer() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    var id = pref.getString("id");
    String APIURL = "http://10.0.2.2:8000/api/customer-info/";

    http.Response response = await http.post(Uri.parse(APIURL),
        body: ({'user': '${id}', 'phoneNumber': phoneNumber.text}));
    final body = jsonDecode(response.body);
    print(body);
    if (response.statusCode == 200 && response.statusCode == 201) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Sucessfully book the room")));
      print("value add");
    } else {
      print("exception occor $response");
      print(response.statusCode);
    }
  }
}
