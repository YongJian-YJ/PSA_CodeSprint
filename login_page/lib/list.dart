import 'package:day12_login/form.dart';
import 'package:day12_login/view_customer.dart';
import 'package:day12_login/view_customer_Signing_officer.dart';

import 'icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'dart:collection';
import 'dart:convert';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  onSearch(String search) {}

  onClick(BuildContext context) {}

  nextPage() {}

  getContext(int index) {
    //Get context from backend
    Map map = Map<int, dynamic>();
    map = {
      0: {
        "requestID": "A123",
        "company": "Volvo",
        "vehicleNo": "SJX 3457G",
        "driverName": "John",
        "driverPSA": 30,
        "items": {"car": 3}
      },
      1: {
        "requestID": "A1234",
        "company": "Volvo",
        "vehicleNo": "SJX 3457G",
        "driverName": "John",
        "driverPSA": 30,
        "items": {"car": 3}
      },
      2: {
        "requestID": "A567",
        "company": "Panasonic",
        "vehicleNo": "SQA 211G",
        "driverName": "Lim",
        "driverPSA": 27,
        "items": {"television": 2, "refrigerator": 1}
      },
    };
    return map[index];
  }

  int _getDataSize() {
    //talk to backend to get the count of all request
    return 3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade100,
        title: Container(
          height: 38,
          child: TextField(
            onChanged: (value) => onSearch(value),
            decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 255, 255, 255),
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade500,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none),
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                hintText: "EPON No"),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 20,
          ),
          Text('All Submitted Requests',
              style: TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade700)),
          Container(
            height: 20,
          ),
          Container(
            color: Colors.grey.shade100,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _getDataSize(),
                itemBuilder: (context, index) {
                  return Slidable(
                      key: const ValueKey(0),
                      // The start action pane is the one at the left or the top side.
                      startActionPane: ActionPane(
                        // A motion is a widget used to control how the pane animates.
                        motion: const ScrollMotion(),

                        // A pane can dismiss the Slidable.
                        //dismissible: DismissiblePane(onDismissed: () {}),

                        // All actions are defined in the children parameter.
                        children: [
                          // A SlidableAction can have an icon and/or a label.
                          SlidableAction(
                            onPressed: onClick(context),
                            backgroundColor: Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                          SlidableAction(
                            onPressed: onClick(context),
                            backgroundColor: Color(0xFF21B7CA),
                            foregroundColor: Colors.white,
                            icon: Icons.share,
                            label: 'Share',
                          ),
                        ],
                      ),

                      // The end action pane is the one at the right or the bottom side.
                      endActionPane: ActionPane(
                        motion: ScrollMotion(),
                        children: [
                          SlidableAction(
                            // An action can be bigger than the others.
                            flex: 2,
                            onPressed: onClick(context),
                            backgroundColor: Color(0xFF7BC043),
                            foregroundColor: Colors.white,
                            icon: Icons.archive,
                            label: 'Archive',
                          ),
                          SlidableAction(
                            onPressed: onClick(context),
                            backgroundColor: Color(0xFF0392CF),
                            foregroundColor: Colors.white,
                            icon: Icons.save,
                            label: 'Save',
                          ),
                        ],
                      ),
                      // The child of the Slidable is what the user sees when the
                      // component is not dragged.
                      child: slideComponent(index));
                }),
          ),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FormPage()));
        },
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }

  slideComponent(int index) {
    final jsonEncoder = JsonEncoder();

    return InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ViewListForCustomer())), // Handle your callback
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(children: [
                Row(children: [
                  SizedBox(width: 10),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("ID : " + getContext(index)["requestID"],
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(jsonEncoder.convert(getContext(index)["items"]),
                            style: TextStyle(color: Colors.grey[500])),
                      ])
                ])
              ])),
          Container(
              child: Row(children: [
            Icon(iconlist(index),),
            SizedBox(width: 20)
          ])),
        ]));
  }
  IconData iconlist(int index){
    List <IconData> icon = [MyFlutterApp.ok_circled,Icons.pending,Icons.not_interested];
    return icon[index];
  }
}
