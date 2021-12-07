import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/Models/note_model.dart';
import 'package:todo/Shared/Componant/constants.dart';
import 'package:todo/Shared/Cubit/state.dart';
import 'package:todo/modules/ArchiveTaskScreen/archive_task_screen.dart';
import 'package:todo/modules/FavoriteNoteScreen/favorite_note_screen.dart';
import 'package:todo/modules/NotesScreen/notes_screen.dart';



class AppCubit extends Cubit<AppStates> {

  AppCubit(): super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);



  int currentIndex = 0;

  List <Widget> screens = [
    const NotesScreen(),
    const DoneTaskScreen(),
  ];

  void changeNavIndex (int index)
  {
    currentIndex = index;
    emit(AppChangeNavBottomIndexState());
  }


  void createDatabase (){
    openDatabase(
      'note.db',
      version: 1,
      onCreate: (database , version){
        database.execute('CREATE TABLE notes (id INTEGER PRIMARY KEY , title TEXT , body TEXT , time TEXT , color TEXT , status TEXT )')
            .then((value) {
              print('Database Created successful');
        }).catchError((error){
          print('Error When create database : ${error.toString()}');
        });
      },

      onOpen: (database){
        print('database opened');
      }
    ).then((value) {
      emit(AppCreateDatabaseState());
    });

  }

  // void insertDatabase ({
  //   required String title ,
  //   required String body ,
  //   required String time ,
  //   required String color ,
  // })async {
  //   emit(AppInsertDatabaseLoadingState());
  //   database!.transaction((txn) {
  //     txn.rawInsert('INSERT INTO notes (title , body , time , color , status) VALUES("$title" , "$body" , "$time" ,"$color" ,  "new")')
  //     .then((value) {
  //       print(value);
  //       emit(AppInsertDatabaseState());
  //     }).catchError((error){
  //       print('Error When insert raw in datebase :  ${error.toString()}');
  //     });
  //     return null;
  //   }).then((value) {
  //     print('Successful insert note');
  //     emit(AppInsertDatabaseState());
  //   });
  // }

  void insertDatabase (NoteModel model) async
  {
    Database? database ;
    await database!.insert('notes', model.toMap()).then((value) {
      print(value);
      emit(AppInsertDatabaseState());
    }).catchError((error){
      print('Error When insert raw in datebase :  ${error.toString()}');
    });
  }


  List <Map> notes = [];
  void getDataFromDatabase (database) async {
    notes = [];

    emit(AppInsertDatabaseLoadingState());

    database.rawQuery('SELECT * FROM notes').then((value)
    {
      // tasks = value ;
      value.forEach((element)
      {
        if(element['status'] == 'new')
        {
          notes.add(element);
        }


      });

      emit(AppGetDatabaseState());
    }
    );

  }

  void updateStatusDatabase ({
    required String status ,
    required int id ,
  })
  {
    Database? database ;
    database!.rawUpdate(
        'UPDATE notes SET status = ? WHERE id = ?' ,
        ['$status' , id] ).then((value)
    {
      emit(AppUpdateDatabaseState());
      getDataFromDatabase(database);
    }
    );
  }

  void updateNoteDatabase ({
    required String title ,
    required String body ,
    required String time ,
    required String color ,
    required int id ,
  })
  {
    Database? database ;
    database!.rawUpdate(
        'UPDATE notes SET title = ? , body =? , time =? , color =?  WHERE id = ?' ,
        [title , body , time , color, id] ).then((value)
    {
      emit(AppUpdateDatabaseState());
      getDataFromDatabase(database);
    }
    );
  }



  void deleteDatabase ({
    required int id ,
  })
  {
    Database? database ;
    database!.rawDelete(
        'DELETE FROM notes  WHERE id = ?' , [id] ).then((value)
    {
      emit(AppDeleteDatabaseState());
      getDataFromDatabase(database);
    }
    );
  }

  Color chosenColor = Colors.white;

  void changeNoteColor (int color)
  {
    switch (color)
    {
      case 0 :
        bColor = Colors.black;
        bColor1 = Colors.orange;
        bColor2 = Colors.blue;
        bColor3 = Colors.redAccent;
        bColor4 = Colors.yellow;
        bColor5 = Colors.cyan;
        bColor6 = Colors.brown;
        bColor7 = Colors.purple;
        chosenColor = Colors.white;
        emit(AppChangeNoteColorState());
        break;

      case 1 :

        bColor = Colors.white;
        bColor1 = Colors.black;
        bColor2 = Colors.blue;
        bColor3 = Colors.redAccent;
        bColor4 = Colors.yellow;
        bColor5 = Colors.cyan;
        bColor6 = Colors.brown;
        bColor7 = Colors.purple;
        chosenColor = Colors.orange;

        emit(AppChangeNoteColorState());
        break;

      case 2 :

        bColor = Colors.white;
        bColor1 = Colors.orange;
        bColor2 = Colors.black;
        bColor3 = Colors.redAccent;
        bColor4 = Colors.yellow;
        bColor5 = Colors.cyan;
        bColor6 = Colors.brown;
        bColor7 = Colors.purple;
        chosenColor = Colors.blue;
        emit(AppChangeNoteColorState());
        break;

      case 3 :

        bColor = Colors.white;
        bColor1 = Colors.orange;
        bColor2 = Colors.blue;
        bColor3 = Colors.black;
        bColor4 = Colors.yellow;
        bColor5 = Colors.cyan;
        bColor6 = Colors.brown;
        bColor7 = Colors.purple;
        chosenColor = Colors.redAccent;
        emit(AppChangeNoteColorState());
        break;

      case 4 :

        bColor = Colors.white;
        bColor1 = Colors.orange;
        bColor2 = Colors.blue;
        bColor3 = Colors.redAccent;
        bColor4 = Colors.black;
        bColor5 = Colors.cyan;
        bColor6 = Colors.brown;
        bColor7 = Colors.purple;
        chosenColor = Colors.yellow;
        emit(AppChangeNoteColorState());
        break;

      case 5 :

        bColor = Colors.white;
        bColor1 = Colors.orange;
        bColor2 = Colors.blue;
        bColor3 = Colors.redAccent;
        bColor4 = Colors.yellow;
        bColor5 = Colors.black;
        bColor6 = Colors.brown;
        bColor7 = Colors.purple;
        chosenColor = Colors.cyan;
        emit(AppChangeNoteColorState());
        break;

      case 6 :
        bColor = Colors.white;
        bColor1 = Colors.orange;
        bColor2 = Colors.blue;
        bColor3 = Colors.redAccent;
        bColor4 = Colors.yellow;
        bColor5 = Colors.cyan;
        bColor6 = Colors.black;
        bColor7 = Colors.purple;
        chosenColor = Colors.brown;
        emit(AppChangeNoteColorState());
        break;

      case 7 :
        bColor = Colors.white;
        bColor1 = Colors.orange;
        bColor2 = Colors.blue;
        bColor3 = Colors.redAccent;
        bColor4 = Colors.yellow;
        bColor5 = Colors.cyan;
        bColor6 = Colors.brown;
        bColor7 = Colors.black;
        chosenColor = Colors.purple;
        emit(AppChangeNoteColorState());
        break;

      default :
        bColor = Colors.black;
        bColor1 = Colors.orange;
        bColor2 = Colors.blue;
        bColor3 = Colors.redAccent;
        bColor4 = Colors.yellow;
        bColor5 = Colors.cyan;
        bColor6 = Colors.brown;
        bColor7 = Colors.purple;
        chosenColor = Colors.white;
        emit(AppChangeNoteColorState());
    }
    emit(AppChangeNoteColorState());
  }


}