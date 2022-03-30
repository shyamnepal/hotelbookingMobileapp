import 'package:flutter/material.dart';

class OtpVerifcation extends StatefulWidget {
  const OtpVerifcation({Key? key}) : super(key: key);

  @override
  _OtpVerifcationState createState() => _OtpVerifcationState();
}

class _OtpVerifcationState extends State<OtpVerifcation> {
  TextEditingController _OtpController = TextEditingController();
  var otpnumber;
  //EmailVerification emial = new EmailVerification();
  @override
  Widget build(BuildContext context) {
    setState(() {
      otpnumber = '';
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Color(0xffFD877B),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Text(
                'My code is',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _textFieldOTP(first: true, last: false),
                    _textFieldOTP(first: false, last: false),
                    _textFieldOTP(first: false, last: false),
                    _textFieldOTP(first: false, last: true),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              RichText(
                  text: const TextSpan(children: [
                TextSpan(
                    text: "please enter 4-digit code sent\nto you at ",
                    style: TextStyle(
                      color: Colors.black,
                    )),
                TextSpan(
                    text: "demoemail@gmail.com",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ])),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Resend",
                  style: TextStyle(color: Color(0xffFD877B)),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    side: const BorderSide(width: 1, color: Color(0xffFD877B)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.3,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    // context,
                    // MaterialPageRoute(
                    //     builder: (context) => const PersonForm()));
                  },
                  child: const Text('Submit'),
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xffFD877B),
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

  Widget _textFieldOTP({required bool first, last}) {
    return Container(
      height: 85,
      child: AspectRatio(
        aspectRatio: 0.7,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            otpnumber = otpnumber + value;

            print(otpnumber);
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.purple),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
