import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:secrets/Components/convertion.dart';
import 'package:secrets/UI/Components/rounded_button.dart';

import 'encode_result.dart';

class EncodeScreen extends StatefulWidget {
  static String id = "encode_screen";
  static String message = "";
  static Color enCodeBackground = Color(0xff000088);
  @override
  _EncodeScreenState createState() => _EncodeScreenState();
}

class _EncodeScreenState extends State<EncodeScreen> {
  TextEditingController _editingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EncodeScreen.enCodeBackground,
      appBar: AppBar(
        leading: Container(color: Colors.transparent),
        title: Text(
          "Encode",
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
        centerTitle: true,
      ),
      extendBody: true,
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 60.0,
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.white,
                ),
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r"[a-zA-Z\s\b|\b\s]")),
                  ],
                  // onFieldSubmitted: (value) {
                  //   EncodeScreen.message = _editingController.text;
                  //   print(EncodeScreen.message);
                  // },
                  controller: _editingController,
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
                        EncodeScreen.message = (_editingController.text == null
                            ? ""
                            : _editingController.text);
                        Encrypted().encrypt(EncodeScreen.message);
                        _editingController.clear();
                        Navigator.popAndPushNamed(context, EncodeResult.id);
                      },
                      margin: null)),
            ],
          ),
        ),
      ),
    );
  }
}
