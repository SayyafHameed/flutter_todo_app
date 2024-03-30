import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/shared/bloc_cubit/home_layout/home_state.dart';

import '../../../screens/archive_screen/archive_screen.dart';
import '../../../screens/done_screen/done_screen.dart';
import '../../../screens/task_screen/task_screen.dart';

class AppHomeCubit extends Cubit<AppHomeStates>
{
  AppHomeCubit() : super(AppInitialState());

  static AppHomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens =  [
    AppTaskScreen(),
    AppDoneScreen(),
    AppArchiveScreen(),
  ];

  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archive Tasks',
  ];

  void changeIndex(int index)
  {
    currentIndex = index;
    emit(AppChangeNavBarState());
  }

  bool isBottomSheet = false;
  IconData iconBottomSheet = Icons.edit;
  late Database database;
  List<Map> tasks = [];

  void createDatabase()  {
    openDatabase(
      'sayyaf_todo.db',
      version: 1,
      onCreate: (database, version) {
        print('Database Created');
        database
            .execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT,count TEXT, price TEXT, date TEXT, status TEXT )',
        )
            .then((value) {
          print('Table Created');
        }).catchError((error) {
          print('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDatabase(database).then((value) {
          tasks = value;
          print(tasks);

          emit(AppGetDatabaseState());
        });
        print('Database Opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  Future insertToDatabase({
    required String title,
    required String count,
    required String price,
    required String date,
  }) async {
    try{
      await database.transaction((txn) async {
        await txn.rawInsert(
          'INSERT INTO tasks(title, count, price, date, status) VALUES("$title","$count", "$price", "$date", "new")',
        ).then((value) {
          print('$value Insert Successfully');
          emit(AppInsertDatabaseState());

          getDatabase(database).then((value) {
            tasks = value;
            print(tasks);

            emit(AppGetDatabaseState());
          });
        });
      });
    }catch (error){
      print("$error");
    }
  }

  Future<List<Map>> getDatabase(database) async {
    emit(AppGetDatabaseLoadingState());
    return await database.rawQuery('SELECT * FROM tasks');
  }
}