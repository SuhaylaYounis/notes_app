import 'package:flutter/material.dart';

import 'constants.dart';

class DiscriptionScreen extends StatefulWidget {
  const DiscriptionScreen({Key? key}) : super(key: key);

  @override
  _DiscriptionScreenState createState() => _DiscriptionScreenState();
}

class _DiscriptionScreenState extends State<DiscriptionScreen> {
  String? title, date, discription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //toolbarHeight: 90,
        title: Text("Add Notes"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: white,
            size: 25,
          ),
        ),
        backgroundColor: primarydarkcolor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        )),
        elevation: 10,
      ),
      backgroundColor: primarycolor,
      body: Padding(
        padding: EdgeInsets.all(Dpadding),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Title",
                labelStyle: TextStyle(color: white),
                hintText: "Enter title",
                contentPadding: EdgeInsets.all(Dpadding),
                helperStyle: TextStyle(color: primarydarkcolor),
                fillColor: primarydarkcolor,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(Dpadding),
                  ),
                  borderSide: BorderSide(color: primarydarkcolor, width: 0.5),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(Dpadding),
                  ),
                  borderSide: BorderSide(color: primarydarkcolor, width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(Dpadding),
                  ),
                  borderSide: BorderSide(color: primarydarkcolor, width: 0.5),
                ),
              ),
              onChanged:(value){
                setState(() {
                  title=value;
                });
              } ,
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Date",
                labelStyle: TextStyle(color: white),
                hintText: "Enter Date",
                contentPadding: EdgeInsets.all(Dpadding),
                helperStyle: TextStyle(color: primarydarkcolor),
                fillColor: primarydarkcolor,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(Dpadding),
                  ),
                  borderSide: BorderSide(color: primarydarkcolor, width: 0.5),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(Dpadding),
                  ),
                  borderSide: BorderSide(color: primarydarkcolor, width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(Dpadding),
                  ),
                  borderSide: BorderSide(color: primarydarkcolor, width: 0.5),
                ),
              ),
              onChanged:(value){
                setState(() {
                  date=value;
                });
              } ,
            ),
            SizedBox(height: 10),
            TextFormField(
              maxLines: 8,
              decoration: const InputDecoration(
                labelText: "Note",
                labelStyle: TextStyle(color: white),
                hintText: "Enter Text",
                contentPadding: EdgeInsets.all(Dpadding),
                helperStyle: TextStyle(color: primarydarkcolor),
                fillColor: primarydarkcolor,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(Dpadding),
                  ),
                  borderSide: BorderSide(color: primarydarkcolor, width: 0.5),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(Dpadding),
                  ),
                  borderSide: BorderSide(color: primarydarkcolor, width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(Dpadding),
                  ),
                  borderSide: BorderSide(color: primarydarkcolor, width: 0.5),
                ),
              ),
              onChanged:(value){
                setState(() {
                  discription=value;
                });
              } ,
            ),
            SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: primarydarkcolor,
                ),
                icon: Icon(
                  Icons.add,
                  size: 18,
                  color: white,
                ),
                label: Text(
                  "Add ",
                  style: TextStyle(color: white),
                ),
              ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primarydarkcolor,
        child: Icon(
          Icons.add,
          color: white,
        ),
      ),
    );
  }
}
