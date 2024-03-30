import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/screens/archive_screen/archive_screen.dart';
import 'package:todo_app/screens/done_screen/done_screen.dart';
import 'package:todo_app/screens/insert_screen/insert_screen.dart';
import 'package:todo_app/screens/task_screen/task_screen.dart';
import 'package:todo_app/shared/bloc_cubit/home_layout/home_cubit.dart';
import 'package:todo_app/shared/bloc_cubit/home_layout/home_state.dart';

import '../shared/components/components.dart';
import '../shared/components/constants.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({super.key});

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  var titleController = TextEditingController();
  var numController = TextEditingController();
  var priceController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppHomeCubit()..createDatabase(),
      child: BlocConsumer<AppHomeCubit, AppHomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppHomeCubit cubit = AppHomeCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
            ),
            body: ConditionalBuilder(
              condition: state is! AppGetDatabaseLoadingState,
              builder: (context) => cubit.screens[cubit.currentIndex],
              fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
            if (cubit.isBottomSheet)
            {
            if (formState.currentState!.validate()) {
            cubit.insertToDatabase(
              title: titleController.text,
              count: numController.text,
              price: priceController.text,
              date: dateController.text,
            ).then((value){
              Navigator.pop(context);
              cubit.isBottomSheet = false;
              cubit.iconBottomSheet = Icons.edit;
            });

            }}
            else {
                  scaffoldKey.currentState!.showBottomSheet(
                    (context) => Container(
                      color: Colors.grey[300],
                      child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              DefaultTextFormFld(
                                controller: titleController,
                                keyBoardType: TextInputType.text,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'Product must is not Empty';
                                  }
                                  return null;
                                },
                                textLabel: 'Enter Your Product ',
                                textHint: 'Please Enter Product',
                              ),
                              DefaultTextFormFld(
                                controller: numController,
                                keyBoardType: TextInputType.number,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'Number must is not Empty';
                                  }
                                  return null;
                                },
                                textLabel: 'Enter Your Number ',
                                textHint: 'Please Enter Number',
                              ),
                              DefaultTextFormFld(
                                controller: priceController,
                                keyBoardType: TextInputType.number,
                                textLabel: 'Enter Your Price ',
                                textHint: 'Please Enter Price',
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'Price must is not Empty';
                                  }
                                  return null;
                                },
                              ),
                              DefaultTextFormFld(
                                controller: dateController,
                                keyBoardType: TextInputType.datetime,
                                textLabel: 'Enter Your DateTime ',
                                textHint: 'Please Enter DateTime',
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2030-12-29'),
                                  ).then((value) {
                                    dateController.text =
                                        DateFormat.yMMMd().format(value!);
                                  });
                                },
                              ),
                            ],
                          )),
                    ),
                  ).closed.then((value) {
                    Navigator.pop(context);
                    cubit.isBottomSheet = false;
                    cubit.iconBottomSheet = Icons.edit;
                  });
                  cubit.isBottomSheet = true;
                  cubit.iconBottomSheet = Icons.add;
                }
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => InsertTasksScreen()));
              },
              child: Icon(cubit.iconBottomSheet),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.currentIndex;
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Tasks'),
                BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Done'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive), label: 'Archive'),
              ],
            ),
          );
        },
      ),
    );
  }
}
