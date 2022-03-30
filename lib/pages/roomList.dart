// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hotelbooking/Login/home.dart';
import 'package:hotelbooking/component/card.dart';
import 'package:hotelbooking/pages/detailsscreen.dart';
import 'package:http/http.dart' as http;

class RoomList extends StatefulWidget {
  @override
  State<RoomList> createState() => _RoomListState();
}

class _RoomListState extends State<RoomList> {
  Future fetchRoomData() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/room-details/'));

    if (response.statusCode == 200) {
      final ConvertDataJSON = json.decode(response.body);
      print(ConvertDataJSON);
      return ConvertDataJSON;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  DateTimeRange daterange =
      DateTimeRange(start: DateTime(2022, 1, 1), end: DateTime(2022, 12, 24));

  void initState() {
    // TODO: implement initState
    super.initState();
    fetchRoomData();
  }

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

  @override
  Widget build(BuildContext context) {
    final start = daterange.start;
    final end = daterange.end;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Padding(
            padding: EdgeInsets.only(left: 60),
            child: Text(
              "Discover",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ));
          }),
          // leading: IconButton(
          //     onPressed: () {},
          //     icon: const Icon(
          //       Icons.refresh,
          //       color: Colors.black,
          //     )),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('Shyam Nepal'),
                accountEmail: Text('shyamnepal567@gmail.com'),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                ),
                decoration: const BoxDecoration(
                  color: Color(0xff40cd7d),
                ),
              ),
              InkWell(
                onTap: () {
                  // Navigator.pushNamed(context, '/homepage');
                },
                child: const ListTile(
                  title: Text('Home Page'),
                  leading: Icon(
                    Icons.home,
                    color: Colors.red,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  title: Text('My Account'),
                  leading: Icon(
                    Icons.person,
                    color: Colors.red,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/hotelinformation');
                },
                child: const ListTile(
                  title: Text('Hotel information'),
                  leading: Icon(
                    Icons.shopping_basket,
                    color: Colors.red,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  title: Text('room information'),
                  leading: Icon(
                    Icons.category,
                    color: Colors.red,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  title: Text('view Hotel information'),
                  leading: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
              ),
              Divider(),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  title: Text('Settings'),
                  leading: Icon(
                    Icons.settings,
                    color: Colors.blue,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  title: Text('About'),
                  leading: Icon(
                    Icons.help,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext contex) {
                        return Dialog(
                          child: Container(
                            height: 550,
                            width: width * 8,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: width * .5,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: "Search for place",
                                          prefixIcon: const Icon(
                                            Icons.search,
                                            size: 35,
                                            color: Color(0xff3C4657),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 2.4,
                                                color: Color(0xff3C4657)),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 2.4,
                                                color: Color(0xff3C4657)),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xff3C4657),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      height: 50,
                                      width: 50,
                                      child: const Icon(Icons.filter_alt,
                                          size: 35, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 80,
                                    width: 140,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                    ),
                                    child: Column(children: [
                                      Text(
                                          "${start.year}/${start.month}/${start.day}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      TextButton(
                                          onPressed: () {
                                            pickDateRange();
                                          },
                                          child: Text("Check in"))
                                    ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Container(
                                      height: 80,
                                      width: 140,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                      ),
                                      child: Column(children: [
                                        Text(
                                            "${end.year}/${end.month}/${end.day}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                        TextButton(
                                            onPressed: () {
                                              pickDateRange();
                                            },
                                            child: Text("Check in",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)))
                                      ]),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 80,
                                    width: 140,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                    ),
                                    child: Column(children: [
                                      TextField(
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            errorText: "           Adult",
                                            errorStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14)),
                                      )
                                    ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Container(
                                      height: 80,
                                      width: 140,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                      ),
                                      child: Column(children: [
                                        TextField(
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              errorText: "           children",
                                              errorStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ]),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                              SizedBox(
                                width: width * .6,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Submint'),
                                  style: ElevatedButton.styleFrom(
                                      primary: const Color(0xff40cd7d),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                ),
                              ),
                            ]),
                          ),
                        );
                      });
                },
                child: Padding(
                  padding:
                      EdgeInsets.only(top: height * .02, bottom: height * .02),
                  child: Container(
                    height: 40,
                    width: width * .8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 30.0, // soften the shadow
                          spreadRadius: 2, //extend the shadow
                          offset: Offset(
                            10.0, // Move to right 10  horizontally
                            15.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: width * .04),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width * .04),
                            child: Text(
                              "search",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: FutureBuilder(
                    future: fetchRoomData(),
                    builder: (BuildContext context, AsyncSnapshot snapShot) {
                      if (snapShot.hasData) {
                        final data = snapShot.data;

                        return GridView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 0.6,
                            ),
                            itemCount: data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailScreen(
                                              imageUrl: 'http://10.0.2.2:8000  ' +
                                                  '${data[index]['roomImage']}',
                                              hotelName:
                                                  '${data[index]['room_type']}',
                                              hotelLocation:
                                                  '${data[index]['room_price']}')));
                                },
                                child: DiscoverCard(
                                  image: 'http://10.0.2.2:8000' +
                                      '${data[index]['roomImage']}',
                                  name: '${data[index]['room_type']}',
                                  price: '${data[index]['room_price']}',
                                ),
                              );
                            });
                      } else if (snapShot.hasError) {
                        return Text(snapShot.error.toString());
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ),
            ],
          ),
        ));
  }

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
        context: context,
        initialDateRange: daterange,
        firstDate: DateTime(1900),
        lastDate: DateTime(2022));
    if (newDateRange == null) return;

    setState(() => daterange = newDateRange);
  }
}
