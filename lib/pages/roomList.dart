// ignore_for_file: file_names

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

  void initState() {
    // TODO: implement initState
    super.initState();
    fetchRoomData();
  }

  @override
  Widget build(BuildContext context) {
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
                onTap: () {
                  Navigator.pushNamed(context, '/viewhotelinformation');
                },
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
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: FutureBuilder(
              future: fetchRoomData(),
              builder: (BuildContext context, AsyncSnapshot snapShot) {
                if (snapShot.hasData) {
                  final data = snapShot.data;

                  return GridView.builder(
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
        ));
  }
}
