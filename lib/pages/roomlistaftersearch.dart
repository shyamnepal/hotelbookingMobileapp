import 'package:flutter/material.dart';
import 'package:hotelbooking/component/card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hotelbooking/pages/detailsscreen.dart';

class roomListAfterSearch extends StatefulWidget {
  List<dynamic> data;
  DateTime datetime;
  int hours;

  roomListAfterSearch(
      {Key? key,
      required this.data,
      required this.datetime,
      required this.hours})
      : super(key: key);

  @override
  State<roomListAfterSearch> createState() => _roomListAfterSearchState();
}

class _roomListAfterSearchState extends State<roomListAfterSearch> {
  var toatalhours;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text('${widget.hours}'),
        GridView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.6,
            ),
            itemCount: widget.data.length,
            itemBuilder: (BuildContext context, int index) {
              var price = widget.data[index]['room_price'];
              var hours = widget.hours;
              var datetimeis = widget.datetime;
              // print('this is upper part of sharepreferences');

              // print('total hours is ${hours}');
              // print('total hours is ${datetimeis}');
              var totalPrice = price * hours;
              // print(totalPrice);
              // print("total price of room is ");
              // print(totalPrice);
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailScreen(
                                imageUrl: '${widget.data[index]['roomImage']}',
                                hotelName: '${widget.data[index]['room_type']}',
                                hotelLocation:
                                    '${widget.data[index]['hotelID']['hotel_location']}',
                                hotelPrice: totalPrice.toString(),
                                hotelId:
                                    '${widget.data[index]['hotelID']['hotelID']}',
                                roomNumber:
                                    '${widget.data[index]['room_number']}',
                              )));
                },
                child: DiscoverCard(
                  image: '${widget.data[index]['roomImage']}',
                  name: '${widget.data[index]['room_type']}',
                  price: totalPrice.toString(),
                ),
              );
            }),
      ]),
    );
  }
}
