import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'note_model.dart';

class Note{
  static  Database? _db;

   Future<Database?> get db async{
    //if we dont have data base create one
    if(_db==null){
      _db=await initialDB();
      return _db;
      //if we have data bas
    }else{
      return _db;
    }

  }

   initialDB() async {
    //بيوصل للمكان الي ستخزن فيه ال ال app
    io.Directory directory=await getApplicationDocumentsDirectory();
    //create and get file of note app type data base will be put the the previous line path
    String path=join(directory.path,"noteapp.db");
    //to open data base file
    var mydb=await openDatabase(path,version: 2,onCreate: _onCreate);
    return mydb;
  }
//method to create table database
   _onCreate(Database db,int version) async {
    await db.execute("CREATE TABLE noteapp (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,discription TEXT NOT NULL,title TEXT NOT NULL, date TEXT NOT NULL, done TEXT NOT NULL )");
    print("Notes Table Created");
  }

   Future <int> insertdb(Map<String,dynamic>date)async{
    Database? db_clint=await db;
    var result =await db_clint!.insert("noteapp", date);
    return result;
  }

   Future <int> deleteNote(int id)async{
    Database? db_clint=await db;
    var result =await db_clint!.rawUpdate("DELETE FROM noteapp WHERE id=$id");
    return result;
  }

   Future <int> updateNote(String note,int id)async{
    Database? db_clint=await db;
    var result =await db_clint!.rawUpdate("UPDATE noteapp SET note='$note' WHERE id=$id");
    return result;
  }

   Future<List<NoteModel>>getdata()async{
  Database? db_clint=await db;
List<NoteModel>list=[];
  var result =await db_clint!.query("noteapp");
 print(result);
  for(var i in result){
    NoteModel noteModel=NoteModel(id:i["id"],discription:i["discription"],title:i["title"],date:i["date"],done:i["done"]);
 list.add(noteModel);
  }
return list;
}
    Future <List>getSingelRow(int id) async{
    Database? db_clint=await db;
    var result =await db_clint!.query("noteapp",where: 'id=$id');
    return result;
  }


}

