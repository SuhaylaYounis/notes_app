import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'dart:io' as io;

class Note{
  static   Database? _db;

  static Future<Database?> get db async{
    //if we dont have data base create one
    if(_db==null){
      _db=await initialDB();
      return _db;
      //if we have data bas
    }else{
      return _db;
    }

  }

  static initialDB() async {
    //بيوصل للمكان الي ستخزن فيه ال ال app
    io.Directory directory=await getApplicationDocumentsDirectory();
    //create and get file of note app type data base will be put the the previous line path
    String path=join(directory.path,"noteapp.db");
    //to open data base file
    var mydb=await openDatabase(path,version: 1,onCreate: _onCreate);
    return mydb;
  }
//method to create table database
  static _onCreate(Database db,int version) async {
    await db.execute("CREATE TABLE noteapp (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,discription TEXT NOT NULL,title TEXT NOT NULL, date TEXT NOT NULL, done TEXT NOT NULL )");
    print("Notes Table Created");
  }

  static Future <int> insertdb(Map<String,dynamic>date)async{
    Database? db_clint=await db;
    var result =await db_clint!.insert("noteapp", date);
    return result;
  }

  static Future <int> deleteNote(int id)async{
    Database? db_clint=await db;
    var result =await db_clint!.rawUpdate("DELETE FROM noteapp WHERE id=$id");
    return result;
  }

  static Future <int> updateNote(String note,int id)async{
    Database? db_clint=await db;
    var result =await db_clint!.rawUpdate("UPDATE noteapp SET discription='$note' WHERE id=$id");
    return result;
  }

  static Future<List>getdata()async{
    Database? db_clint=await db;
    var result =await db_clint!.query("noteapp");
    return result;
  }
  static Future <List>getSingelRow(int id) async{
    Database? db_clint=await db;
    var result =await db_clint!.query("noteapp",where: 'id=$id');
    return result;
  }


}

