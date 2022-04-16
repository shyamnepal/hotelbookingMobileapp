import 'package:flutter/material.dart';
import 'package:hotelbooking/component/card.dart';
import 'package:hotelbooking/pages/detailsscreen.dart';

class roomListAfterSearch extends StatefulWidget {
  List<dynamic> data;
  roomListAfterSearch({Key? key, required this.data}) : super(key: key);

  @override
  State<roomListAfterSearch> createState() => _roomListAfterSearchState();
}

class _roomListAfterSearchState extends State<roomListAfterSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
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
                              hotelPrice:
                                  '${widget.data[index]['room_price']}')));
                },
                child: DiscoverCard(
                  image: '${widget.data[index]['roomImage']}',
                  name: '${widget.data[index]['room_type']}',
                  price: '${widget.data[index]['room_price']}',
                ),
              );
            }),
      ]),
    );
  }
}
