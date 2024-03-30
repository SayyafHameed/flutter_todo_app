import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/shared/bloc_cubit/home_layout/home_cubit.dart';
import 'package:todo_app/shared/bloc_cubit/home_layout/home_state.dart';
import 'package:todo_app/shared/components/components.dart';
import 'package:intl/intl.dart';

class InsertTasksScreen extends StatelessWidget {
  InsertTasksScreen({Key? key}) : super(key: key);

  var titleController = TextEditingController();
  var numController = TextEditingController();
  var priceController = TextEditingController();
  var dateController = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppHomeCubit, AppHomeStates>(
      listener: (context, state){
        if (state is AppInsertDatabaseState){
          Navigator.pop(context);
        }
      },
      builder: (context, state){
        return Scaffold(
          appBar: AppBar(
            title: const Text('Add Product'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formState,
              child: Column(
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
                        dateController.text = DateFormat.yMMMd().format(value!);
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50.0,
                    child: MaterialButton(
                      onPressed: () {
                        if (formState.currentState!.validate()) {
                          AppHomeCubit.get(context).insertToDatabase(
                            title: titleController.text,
                            count: numController.text,
                            price: priceController.text,
                            date: dateController.text,
                          );
                          // insertToDatabase(
                          //   title: titleController.text,
                          //   number: numController.text,
                          //   price: priceController.text,
                          //   date: dateController.text,
                          // );
                        }
                      },
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                      child: const Text(
                        'Add Product',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
