import 'dart:io';
import 'package:day12_login/view_customer_Signing_officer.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:day12_login/list.dart';

void main() => runApp(new ViewListForDesignatedOfficer());

class ViewListForDesignatedOfficer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: new MyHomePage(title: 'EPON Details Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final imagePicker = ImagePicker();
  File imageFile;
  void _setImage() async {
    imageFile = File(await ImagePicker()
        .getImage(source: ImageSource.gallery)
        .then((pickedFile) => pickedFile.path));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        leading: InkWell(
          onTap: () {
            Navigator.of(context, rootNavigator: true).pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
        ),
      ),
      body: Column(
        children: [
          new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  'Company Name: PSA\nVehicle No: SGX 2345G\nDriveer Name: Jimmy\nDriver PSA Contact No: UIX627G\nDescription:\n     1.  10 Boxes of Water Bottles\n     2.  5 Carton of Milk',
                  style: TextStyle(height: 2.5, fontSize: 20),
                ),
              ],
            ),
          ),
          Container(height: 130),
          ElevatedButton(
              onPressed: () {},
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Approve",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
