import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'constants.dart';
import 'function.dart';

class ReviewScreen extends StatefulWidget {
  var id;
  var discription ;
  var title;
  var date;
  var done;

  ReviewScreen({this.id, this.discription, this.title, this.date, this.done});

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //toolbarHeight: 90,
        title:  Text("${widget.title}"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: white,
            size: 25,
          ),
        ),
        backgroundColor: primarydarkcolor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            )),
        elevation: 10,
      ),
      backgroundColor: primarycolor,
      body: Padding(
        padding: const EdgeInsets.all(Dpadding),
        child: Column(
          children: [
            Text("${ widget.date}",style: TextStyle(fontWeight:FontWeight.bold ),),
            Text("${ widget.discription}",style: TextStyle(fontSize: fontdisc ),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Functions.shareLink("title:${widget.title}\n date:${widget.date}\n discription:${widget.discription}");
        },
        backgroundColor:primarydarkcolor ,
        child: const Icon(Icons.share,color: white,),
      ),
    );
  }
}
