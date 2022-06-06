// ignore_for_file: prefer_const_constructors

// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hotelbooking/Model/customerdetails.dart';
import 'package:hotelbooking/Model/customerid.dart';
import 'package:hotelbooking/pages/booking.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CustomerDetailsAfterBooking extends StatefulWidget {
  double totalPrice;
  int hotelId;
  int roomNumber;
  CustomerDetailsAfterBooking(
      {Key? key,
      required this.totalPrice,
      required this.hotelId,
      required this.roomNumber})
      : super(
          key: key,
        );

  @override
  State<CustomerDetailsAfterBooking> createState() =>
      _CustomerDetailsAfterBookingState();
}

class _CustomerDetailsAfterBookingState
    extends State<CustomerDetailsAfterBooking> {
  var roomdetailsinfromation;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
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
          child: Form(
            key: formkey,
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
                  child: TextFormField(
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required";
                      } else if (!RegExp(r'^(?:\+977[- ])?\d{2}-?\d{8}$')
                          .hasMatch(value)) {
                        return "Please input the correct phone number";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required";
                      } else {
                        return null;
                      }
                    },
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
                      if (formkey.currentState!.validate()) {
                        BookingDetails();
                      }
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
    if (response.statusCode == 200 || response.statusCode == 201) {
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text("Sucessfully book the room")));
      print("value add");
      Map useMap = body;
      var customer = customerid.fromJson(useMap);
      var cid = int.parse('${customer.id}');
      print(cid);
      await customerdata(cid);
      // Bookings();
      //await reservation(cid);
    } else {
      print("exception occor $response");
      print(response.statusCode);
    }
  }

  Future customerdata(int cid) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var id = pref.getString("id");
    print(id);
    String APIURL = "http://10.0.2.2:8000/api/customer-info/";

    http.Response response = await http.post(Uri.parse(APIURL),
        body: ({'user': '${id}', 'id': '${cid}'}));
    final body = jsonDecode(response.body);
    print(body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      await reservation(body['customerId']);
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text("Sucessfully book the room")));

    } else {
      print("exception occor $response");
      print(response.statusCode);
    }
  }

  Future reservation(int cid) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var currentdate = pref.getString('bookdate');
    DateTime dt = DateTime.parse(currentdate!);
    //DateTime tempDate = new DateFormat("yyyy-MM-dd hh:mm").parse('currentdate');
    var d = DateFormat('yyyy-MM-dd').format(dt);

    var hour = pref.getInt("hours");
    var numberOfGuest = pref.getInt("numberOfGuest");
    var price = widget.totalPrice;
    String APIURL = "http://10.0.2.2:8000/api/reservation/";
    print("date is ${dt}");
    print(d);

    print(hour);
    print(numberOfGuest);

    http.Response response = await http.post(Uri.parse(APIURL),
        body: ({
          'checkInDateTime': '${d}',
          'checkOutDateTime': '${d}',
          'reservationGuest': '${firstName.text}',
          'numberOfGuest': '${numberOfGuest}',
          'CustomerId': '${cid}',
          'roomPrice': '${price}'
        }));
    final body = jsonDecode(response.body);
    print(body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      await rooms(widget.hotelId, widget.roomNumber, body['reservationNumber']);
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text("Sucessfully book the room")));
      print("value add");
    } else {
      print("exception occor $response");
      print(response.statusCode);
    }
  }

  Future rooms(int hotelId, int roomNumber, int reservationNumber) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var id = pref.getString("id");
    String APIURL = "http://10.0.2.2:8000/api/roomreservation/";

    http.Response response = await http.post(Uri.parse(APIURL),
        body: ({
          'roomNumber': '${roomNumber}',
          'hotelId': '${hotelId}',
          'reservationNumber': '${reservationNumber}'
        }));
    final body = jsonDecode(response.body);
    print(body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> roomdetails = await roomDetailsBooking();
      print('print before call');
      print(roomdetails);
      showToast();

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Sucessfully book the room")));
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Bookings(
                    BookingsDetails: roomdetails,
                    id: int.parse(id!),
                  )));

      print("value add");
    } else {
      print("exception occor $response");
      print(response.statusCode);
    }
  }

  Future roomDetailsBooking() async {
    final response = await http
        .get(Uri.parse('http://10.0.2.2:8000/api/roomDetailsReservation'));

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Sucessfully book the room")));
      final roomdata = json.decode(response.body);
      print('Booking information cusromer page');
      print(roomdata);
      return roomdata;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      Text('Failed to load search hotel');
    }
  }

  void showToast() {
    Fluttertoast.showToast(
        msg: 'sucessfully Book the room',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.green,
        textColor: Colors.white);
  }
}
