import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:secrets/Components/convertion.dart';
import 'package:secrets/UI/Components/rounded_button.dart';
import 'package:share/share.dart';

import 'decode_screen.dart';

class DecodeResult extends StatelessWidget {
  static String id = "decode_result";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DecodeScreen.deCodeBackground,
      extendBody: true,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 15.0,
            ),
            Text("Inputed Message"),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 125.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Colors.green,
                    width: 1.0,
                  )),
              child: Center(child: Text(DecodeScreen.message)),
            ),
            SizedBox(
              height: 40.0,
            ),
            Text("Decoded Message"),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 125.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Colors.green,
                    width: 1.0,
                  )),
              child: Center(
                child: Text(Encrypted.decoded_message),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            RoundedButton(
              label: "Copy Text",
              press: () {
                FlutterClipboard.copy(Encrypted.decoded_message).then(
                  (value) => Fluttertoast.showToast(
                      msg: "Copied",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.grey,
                      textColor: Colors.white,
                      fontSize: 16.0),
                );
              },
              margin: EdgeInsets.only(left: 40, bottom: 10.0),
            ),
            RoundedButton(
              label: "Share",
              press: () {
                _onShare(context);
              },
              margin: EdgeInsets.only(left: 40),
            )
          ],
        ),
      ),
    );
  }

  _onShare(BuildContext context) async {
    final RenderBox box = context.findRenderObject();
    await Share.share(Encrypted.decoded_message,
        subject: null,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
}
