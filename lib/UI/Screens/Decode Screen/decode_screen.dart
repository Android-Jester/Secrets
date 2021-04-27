import 'package:flutter/material.dart';
import 'package:secrets/Components/convertion.dart';
import 'package:secrets/UI/Components/rounded_button.dart';

import 'decode_result.dart';

class DecodeScreen extends StatefulWidget {
  static String id = "decode_screen";
  static String message, key1 = "";
  static int key2 = 0;
  static Color deCodeBackground = Color(0xff013220);
  final _formKey = GlobalKey<FormState>();

  @override
  _DecodeScreenState createState() => _DecodeScreenState();
}

class _DecodeScreenState extends State<DecodeScreen> {
  TextEditingController _messageController = TextEditingController();
  TextEditingController _key1Controller = TextEditingController();
  TextEditingController _key2Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _key1Controller.dispose();
    _key2Controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DecodeScreen.deCodeBackground,
      appBar: AppBar(
        leading: Container(color: Colors.transparent),
        title: Text("Decode"),
        centerTitle: true,
      ),
      extendBody: true,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.white,
                ),
                child: TextFormField(
                  // onFieldSubmitted: (value) {
                  //   DecodeScreen.message = _messageController.text;
                  //   print(DecodeScreen.message);
                  // },
                  textInputAction: TextInputAction.done,
                  controller: _messageController,
                  maxLines: 70,
                  style: TextStyle(fontSize: 17.0),
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    fillColor: Colors.white,
                    hoverColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(30),
                  child: RoundedButton(
                      label: "Continue",
                      press: () {
                        DecodeScreen.message = (_messageController.text == null
                            ? ""
                            : _messageController.text);
                        Encrypted().separator(DecodeScreen.message);
                        _messageController.clear();
                        Navigator.popAndPushNamed(context, DecodeResult.id);
                      },
                      margin: null)),
            ],
          ),
        ),
      ),
    );
  }

  Container typefield(
      BuildContext context, TextEditingController controller, String label,
      [bool isNumeric]) {
    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.white,
      ),
      child: TextFormField(
        keyboardType: isNumeric ? TextInputType.text : TextInputType.number,
        validator: (value) {
          if (value.isEmpty) return "Please enter your text";
          return null;
        },
        onFieldSubmitted: (value) {
          DecodeScreen.message = controller.text;
          print(DecodeScreen.message);
        },
        controller: controller,
        maxLines: 70,
        style: TextStyle(fontSize: 17.0),
        decoration: InputDecoration(
          labelText: label,
          focusColor: Colors.white,
          fillColor: Colors.white,
          hoverColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
      ),
    );
  }
}
