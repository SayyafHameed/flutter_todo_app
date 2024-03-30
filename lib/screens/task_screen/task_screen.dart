import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/shared/bloc_cubit/home_layout/home_cubit.dart';
import 'package:todo_app/shared/bloc_cubit/home_layout/home_state.dart';
import 'package:todo_app/shared/components/components.dart';

class AppTaskScreen extends StatelessWidget {
  const AppTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppHomeCubit, AppHomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppHomeCubit.get(context).tasks;
        return ListView.separated(
          itemBuilder: (context, index) => BuildTasksItems(tasks[index]),
          separatorBuilder: (context, index) =>
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 20.0),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[300],
                ),
              ),
          itemCount: tasks.length,
        );
    },);
  }
}
