import 'package:flutter/material.dart';
import 'package:todoapp/constants.dart';
import 'package:todoapp/review_screen.dart';
import 'review_screen.dart';
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
    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      Note().db.then((value) {
        print("value $value");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: Text(
          "Notes",
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: primarydarkcolor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        )),
        elevation: 10,
      ),
      backgroundColor: primarycolor,
      // body: Center(
      //   child: Text("Your Note is empty."),
      // ),
      body: FutureBuilder(
        future: Note().getdata(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length == 0) {
              return Center(
                child: Text(
                  "Your Note is empty.",
                  style: TextStyle(color: white),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.transparent,
                    child: ListTile(
                      //to show the note details and description when tapping on it
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return ReviewScreen(date:snapshot.data[index].date,discription:snapshot.data[index].discription,title:snapshot.data[index].title,done:snapshot.data[index].done);
                                }));
                      },
                      title: Text(
                        "${snapshot.data[index].title}",
                        style: TextStyle(color: white),
                      ),
                      subtitle: Text(
                        "${snapshot.data[index].date}",
                        style: TextStyle(color: white),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: red,
                          size: 25,
                        ),
                        onPressed: () {
                          Note()
                              .deleteNote(snapshot.data[index].id)
                              .then((value) {
                            setState(() {
                              print("value: $value");
                            });
                          });
                        },
                      ),
                    ),
                  );
                },
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: red,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            );
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DiscriptionScreen();
          }));
        },
        backgroundColor: primarydarkcolor,
        child: Icon(
          Icons.add,
          color: white,
        ),
      ),
    );
  }
}
