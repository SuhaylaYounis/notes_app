import 'package:flutter/material.dart';
import 'package:todoapp/constants.dart';
import 'Helper.dart';
import 'discription_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Note.db.then((value) {
      print("value $value");
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            toolbarHeight: 90,
            title: Text("Notes",style: TextStyle(fontSize: 30),),
            centerTitle:true ,
            backgroundColor: primarydarkcolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              )
            ),
            elevation: 10,
          ),
backgroundColor: primarycolor,
      body: Center(
        child: Text("Your Note is empty."),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DiscriptionScreen();
          }));
        },
        backgroundColor:primarydarkcolor ,
  child: Icon(Icons.add,color: white,),
),
    );
  }
}
