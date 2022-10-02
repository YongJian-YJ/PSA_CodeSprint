import 'package:day12_login/list.dart';

import 'custom_form_field.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FormPage(),
    ));

class FormPage extends StatefulWidget {
  const FormPage({Key key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  String _name;
  List<Row> textFields = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //textFields.add(_buildTextField());
  }

  Row _buildTextField() {
    return Row(
      children: [
        SizedBox(width: 16),
        Expanded(
            child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Items",
                    hintStyle: TextStyle(color: Colors.grey[400])))),
        SizedBox(width: 16), // Use this to add some space
        Expanded(
            child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Qty",
                    hintStyle: TextStyle(color: Colors.grey[400])))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom form field Demo"),
      ),
      body: Form(
        key: key,
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
                SizedBox(
                  height: 20,
                ),
                CustomFormField().field(
                  question: "Company Name",
                  canBeNull: false,
                  formKey: key,
                  onSavedCallback: (String val) {
                    _name = val;
                  },
                  horizontalTextPadding: 20,
                  verticalTextPadding: 10,
                  labelTextStyle: const TextStyle(color: Colors.black),
                  icon: const Icon(
                    Icons.email_outlined,
                    color: Colors.grey,
                    size: 25,
                  ),
                  fieldTextFontSize: 15,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomFormField().field(
                  question: "Vehicle No",
                  canBeNull: false,
                  formKey: key,
                  onSavedCallback: (String val) {
                    _name = val;
                  },
                  horizontalTextPadding: 20,
                  verticalTextPadding: 10,
                  labelTextStyle: const TextStyle(color: Colors.black),
                  icon: const Icon(
                    Icons.email_outlined,
                    color: Colors.grey,
                    size: 25,
                  ),
                  fieldTextFontSize: 15,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomFormField().field(
                  question: "Driver name",
                  canBeNull: false,
                  formKey: key,
                  onSavedCallback: (String val) {
                    _name = val;
                  },
                  horizontalTextPadding: 20,
                  verticalTextPadding: 10,
                  labelTextStyle: const TextStyle(color: Colors.black),
                  icon: const Icon(
                    Icons.email_outlined,
                    color: Colors.grey,
                    size: 25,
                  ),
                  fieldTextFontSize: 15,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomFormField().field(
                  question: "Driver's PSA Pass no",
                  canBeNull: false,
                  formKey: key,
                  onSavedCallback: (String val) {
                    _name = val;
                  },
                  horizontalTextPadding: 20,
                  verticalTextPadding: 10,
                  labelTextStyle: const TextStyle(color: Colors.black),
                  icon: const Icon(
                    Icons.email_outlined,
                    color: Colors.grey,
                    size: 25,
                  ),
                  fieldTextFontSize: 15,
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Items"),
              ] +
              textFields +
              [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          textFields.add(_buildTextField());
                        });
                      },
                      child: const Text("Add")),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop(context);
                        //key.currentState.save();
                        //debugPrint(_name);
                      },
                      child: const Text("SUBMIT")),
                ),FloatingActionButton(
        onPressed: () {},
        child: new Icon(Icons.camera_alt),
      ),
              ],
        ),
      ),
    );
  }
}
