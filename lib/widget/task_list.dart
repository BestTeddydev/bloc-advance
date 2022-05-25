import 'package:flutter/material.dart';

import '../models/task.dart';
import '../blocs/bloc_exports.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  const TaskList({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: ((context, index) {
          Task task = tasks[index];
          return ListTile(
            title: Text(task.title),
            trailing: Checkbox(
              onChanged: (value) {
                context.read<TasksBloc>().add(UpdateTask(task: task));
              },
              value: task.isDone,
            ),
            onLongPress: () =>
                context.read<TasksBloc>().add(DeleteTask(task: task)),
          );
        }),
      ),
    );
  }
}
