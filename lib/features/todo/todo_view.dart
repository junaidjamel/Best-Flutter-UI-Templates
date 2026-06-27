import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ui/core/const/app_spacing.dart';
import 'package:flutter_ui/features/todo/const/todo_colors.dart';
import 'package:flutter_ui/features/todo/model/todo_day.dart';
import 'package:flutter_ui/features/todo/widget/todo_day_section.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  final _taskController = TextEditingController();
  late final Timer _clockTimer;
  DateTime _currentTime = DateTime.now();
  int? _expandedDay = 0;

  final _days = [
    TodoDay(
      name: 'MONDAY',
      date: _dateForWeekday(DateTime.monday),
      tasks: [
        TodoTask(title: '5km run', isDone: true),
        TodoTask(title: 'Read 10 pages'),
        TodoTask(title: 'Walk the dog'),
        TodoTask(title: 'Get groceries'),
        TodoTask(title: 'Design a to-do app(?)'),
      ],
    ),
    TodoDay(
      name: 'TUESDAY',
      date: _dateForWeekday(DateTime.tuesday),
      tasks: [
        TodoTask(title: 'Reply to emails', isDone: true),
        TodoTask(title: 'Team meeting'),
        TodoTask(title: 'Finish project notes'),
      ],
    ),
    TodoDay(
      name: 'WEDNESDAY',
      date: _dateForWeekday(DateTime.wednesday),
      tasks: [
        TodoTask(title: 'Morning workout'),
        TodoTask(title: 'Call the dentist'),
        TodoTask(title: 'Review app screens'),
      ],
    ),
    TodoDay(
      name: 'THURSDAY',
      date: _dateForWeekday(DateTime.thursday),
      tasks: [
        TodoTask(title: 'Pay utility bills', isDone: true),
        TodoTask(title: 'Buy office supplies'),
        TodoTask(title: 'Plan next week'),
      ],
    ),
    TodoDay(
      name: 'FRIDAY',
      date: _dateForWeekday(DateTime.friday),
      tasks: [
        TodoTask(title: 'Submit weekly report'),
        TodoTask(title: 'Clean the workspace'),
        TodoTask(title: 'Movie night'),
      ],
    ),
    TodoDay(
      name: 'SATURDAY',
      date: _dateForWeekday(DateTime.saturday),
      tasks: [
        TodoTask(title: 'Do the laundry'),
        TodoTask(title: 'Meet friends for lunch'),
        TodoTask(title: 'Read a book'),
      ],
    ),
    TodoDay(
      name: 'SUNDAY',
      date: _dateForWeekday(DateTime.sunday),
      tasks: [
        TodoTask(title: 'Go for a morning walk'),
        TodoTask(title: 'Prepare meals for the week'),
        TodoTask(title: 'Call family'),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _clockTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      if (mounted) setState(() => _currentTime = DateTime.now());
    });
  }

  @override
  void dispose() {
    _clockTimer.cancel();
    _taskController.dispose();
    super.dispose();
  }

  void _addTask(String value) {
    final title = value.trim();
    if (title.isEmpty || _expandedDay == null) return;

    setState(() {
      _days[_expandedDay!].tasks.add(TodoTask(title: title));
    });
    _taskController.clear();
  }

  void _toggleDay(int index) {
    FocusScope.of(context).unfocus();
    _taskController.clear();
    setState(() => _expandedDay = _expandedDay == index ? null : index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TodoColors.whiteClr,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: rightPadding,
            child: IconButton(onPressed: () {}, icon: Icon(Icons.dark_mode)),
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.zero,
          children: List.generate(_days.length, (index) {
            final day = _days[index];
            final isExpanded = _expandedDay == index;

            return TodoDaySection(
              day: day,
              currentTime: _currentTime,
              isExpanded: isExpanded,
              taskController: _taskController,
              onHeaderTap: () => _toggleDay(index),
              onTaskAdded: _addTask,
              onTaskChanged: (task) {
                setState(() => task.isDone = !task.isDone);
              },
            );
          }),
        ),
      ),
    );
  }
}

DateTime _dateForWeekday(int weekday) {
  final today = DateTime.now();
  final monday = today.subtract(Duration(days: today.weekday - 1));
  return DateTime(monday.year, monday.month, monday.day + weekday - 1);
}
