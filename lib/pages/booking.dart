// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hotelbooking/Model/tabs.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Bookings extends StatefulWidget {
  List<dynamic> BookingsDetails;
  int id;

  Bookings({required this.BookingsDetails, required this.id});

  @override
  _BookingsState createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  String? id;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Provider.of<Tabs>(context).changeIndex(0);
            },
          ),
          bottom: new TabBar(
            tabs: <Widget>[
              new Tab(text: "BOOKED"),
              new Tab(text: "CANCELLED"),
            ],
          ),
          title: Text(
            'Bookings',
            style: TextStyle(
                fontFamily: 'poppins-regular', fontWeight: FontWeight.w500),
          ),
        ),
        body: TabBarView(
          children: <Widget>[Current(), Cancelled()],
        ),
      ),
    );
  }

  Widget Current() {
    print('this is in booking');
    print(widget.BookingsDetails);
    var booking = widget.BookingsDetails;
    getid();

    print('Hotel Name ${booking[1]['hotelId']['hotelName']}');
    print('image url is ${booking[1]['roomNumber']['roomImage']}');
    // for (int i = 0; i < booking.length; i++) {
    //   if (booking[i]['reservationNumber']['CustomerId']['user'] == id) {
    //     print('print the booking information');
    //     print(booking[i]['hotelName']);
    //     print(booking[i]['room_number']['roomImage']);
    //   }
    // }

    return ListView.builder(
        itemCount: booking.length,
        itemBuilder: (BuildContext ctxt, int index) {
          print(
              "database user id ${booking[index]['reservationNumber']['CustomerId']['user']}");
          // if (booking[index]['reservationNumber']['CustomerId']['user'] == id) {
          // return ListView(
          //   children: <Widget>[
          //     itemCard('Hatke Hotel', 'images/hotel1.jpg', false),
          //     itemCard('Hatke Hotel', 'images/hotel1.jpg', false),
          //   ],
          // );
          if (booking[index]['reservationNumber']['CustomerId']['user'] ==
              widget.id) {
            return ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: <Widget>[
                itemCard(
                    ' ${booking[index]['hotelId']['hotelName']}',
                    ' ${booking[index]['roomNumber']['roomImage']}',
                    false,
                    booking[index]['reservationNumber']['roomPrice'],
                    booking[index]['roomNumber']['hotelID']['hotel_location'],
                    booking[index]['reservationNumber']['reservationNumber'],
                    widget.BookingsDetails,
                    widget.id),
                // itemCard('Hatke Hotel', 'images/hotel1.jpg', false),
              ],
            );
          } else {
            return Text('');
          }
          // }
          // return Text('');
        });
  }

  Future getid() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var userid = pref.getString("id");
    print('user id brfore call function ${id}');
    setState(() {
      id = userid;
    });
  }

  Widget Cancelled() {
    return FutureBuilder(
        future: getCancelBooking(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  if (data[index]['user'] == widget.id) {
                    return ListView(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        itemCard1(
                            ' ${data[index]['hotelName']}',
                            ' ${data[index]['imageurl']}',
                            false,
                            data[index]['room_price'],
                            data[index]['hotel_location']),
                        // itemCard('Hatke Hotel', 'images/hotel1.jpg', false),
                      ],
                    );
                  } else {
                    return Text('');
                  }
                  // }
                  // return Text('');
                });
          } else {
            return Text('');
          }
        });
    // return ListView(
    //   children: <Widget>[
    //     itemCard1(
    //         'Hatke Hotel', 'images/hotel1.jpg', false, 500, 'machhapokhari', 1),
    //     // itemCard('Hatke Hotel', 'images/hotel1.jpg', false),
    //     // itemCard('Hatke Hotel', 'images/hotel1.jpg', false),
    //     // itemCard('Hatke Hotel', 'images/hotel1.jpg', false),
    //     // itemCard('Hatke Hotel', 'images/hotel1.jpg', false),
    //   ],
    // );
  }
}

Widget itemCard(String title, String imgPath, bool isFavorite, double roomprice,
    String roomlocation, int id, List<dynamic> roombookingdata, int ids) {
  return Padding(
    padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
    child: Container(
      height: 140.0,
      width: double.infinity,
      //color: Colors.white,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 140.0,
            height: 160.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                image: DecorationImage(
                    image: NetworkImage('http://10.0.2.2:8000' + imgPath),
                    fit: BoxFit.cover)),
          ),
          SizedBox(width: 4.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 17.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    width: 175.0,
                    child: Text(
                      roomlocation,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.grey,
                          fontSize: 12.0),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: Colors.orange[100],
                    size: 15,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.orange[100],
                    size: 15,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.orange[100],
                    size: 15,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.orange[100],
                    size: 15,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.orange[100],
                    size: 15,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 40.0,
                    width: 50.0,
                    child: Center(
                      child: Text(
                        'Rs ${roomprice}',
                        style: TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(width: 35.0),
                  Container(
                    child: FlatButton(
                      color: Colors.teal,
                      onPressed: () {
                        print('id is ${id}');
                        customerdata(id);
                        CancelBooking(title, imgPath, roomprice, roomlocation);
                      },
                      textColor: Colors.white,
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}

Future customerdata(int id) async {
  print(id);
  String APIURL = "http://10.0.2.2:8000/api/reservation-delete/" + "${id}/";

  http.Response response = await http.delete(Uri.parse(APIURL));

  if (response.statusCode == 200 || response.statusCode == 201) {
    // ScaffoldMessenger.of(context)
    //     .showSnackBar(SnackBar(content: Text("Sucessfully book the room")));

  } else {
    print("exception occor $response");
    print(response.statusCode);
  }
}

Widget itemCard1(String title, String imgPath, bool isFavorite,
    double roomprice, String roomlocation) {
  return Padding(
    padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
    child: Container(
      height: 120.0,
      width: double.infinity,
      //color: Colors.white,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 140.0,
            height: 160.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                image: DecorationImage(
                    image: NetworkImage('http://10.0.2.2:8000' + imgPath),
                    fit: BoxFit.cover)),
          ),
          SizedBox(width: 4.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 17.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    width: 175.0,
                    child: Text(
                      roomlocation,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.grey,
                          fontSize: 12.0),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: Colors.orange[100],
                    size: 15,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.orange[100],
                    size: 15,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.orange[100],
                    size: 15,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.orange[100],
                    size: 15,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.orange[100],
                    size: 15,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 40.0,
                    width: 50.0,
                    child: Center(
                      child: Text(
                        'Rs ${roomprice}',
                        style: TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(width: 35.0),
                  // Container(
                  //   child: FlatButton(
                  //     color: Colors.teal,
                  //     onPressed: () {

                  //     },
                  //     textColor: Colors.white,
                  //     child: Text(
                  //       'Cancel',
                  //       style: TextStyle(
                  //           fontFamily: 'Quicksand',
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.bold),
                  //     ),
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(30.0)),
                  //   ),
                  // )
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}

Future CancelBooking(String title, String imageURL, double room_price,
    String hotel_location) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  var id = pref.getString("id");
  print(id);
  String APIURL = "http://10.0.2.2:8000/api/cancelBooking/";

  http.Response response = await http.post(Uri.parse(APIURL),
      body: ({
        'hotelName': '${title}',
        'imageurl': '${imageURL}',
        'room_price': '${room_price}',
        'hotel_location': '${hotel_location}',
        'user': '${id}'
      }));
  final body = jsonDecode(response.body);
  print(body);
  // if (response.statusCode == 200 || response.statusCode == 201) {
  //   // ScaffoldMessenger.of(context)
  //   //     .showSnackBar(SnackBar(content: Text("Sucessfully book the room")));

  // } else {
  //   print("exception occor $response");
  //   print(response.statusCode);
  // }
}

Future<List> getCalled() async {
  List<dynamic> val = await getCancelBooking() as List;
  return val;
}

Future getCancelBooking() async {
  final response =
      await http.get(Uri.parse('http://10.0.2.2:8000/api/cancelBooking'));

  if (response.statusCode == 200) {
    // ScaffoldMessenger.of(context)
    //     .showSnackBar(SnackBar(content: Text("Sucessfully book the room")));
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
