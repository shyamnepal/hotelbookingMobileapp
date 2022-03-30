import 'package:flutter/material.dart';
import 'package:hotelbooking/auth/otpverification.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Row(
            children: const [
              Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              Padding(
                padding: EdgeInsets.only(left: 3),
                child: Text(
                  'Back',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          actions: const [
            Icon(
              Icons.help_outline,
              color: Colors.black,
            )
          ],
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 200),
              child: Text(
                'Reset password',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, right: 40),
              child: Text(
                "Enter the email associated with your account\nand we'll send an email with instructions to\nreset your password",
                textAlign: TextAlign.left,
                style: TextStyle(color: Color(0xff838c9a), fontSize: 15),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 230, top: 20),
              child: Text(
                'Email address',
                style: TextStyle(color: Color(0xff838c9a), fontSize: 15),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 10, left: 10),
                    hintText: 'mcraigw@outlook.com',
                    hintStyle: TextStyle(color: Colors.black),
                    fillColor: Color(0xffeceff3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Color(0xffeceff3)),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffeceff3),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffeceff3),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.09,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OtpVerifcation()));
                },
                child: const Text('send Instructions'),
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff40cd7d),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
            )
          ],
        ));
  }
}
