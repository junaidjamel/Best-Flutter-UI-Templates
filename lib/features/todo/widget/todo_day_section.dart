import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/todo/model/todo_day.dart';
import 'package:flutter_ui/features/todo/widget/todo_task_row.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoDaySection extends StatelessWidget {
  const TodoDaySection({
    required this.day,
    required this.currentTime,
    required this.isExpanded,
    required this.taskController,
    required this.onHeaderTap,
    required this.onTaskAdded,
    required this.onTaskChanged,
    super.key,
  });

  final TodoDay day;
  final DateTime currentTime;
  final bool isExpanded;
  final TextEditingController taskController;
  final VoidCallback onHeaderTap;
  final ValueChanged<String> onTaskAdded;
  final ValueChanged<TodoTask> onTaskChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: theme.dividerColor)),
      ),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        alignment: Alignment.topCenter,
        child: InkWell(
          onTap: isExpanded ? null : onHeaderTap,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              32.w,
              isExpanded ? 22.h : 25.h,
              32.w,
              isExpanded ? 24.h : 25.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: onHeaderTap,
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(day.name, style: _dayStyle(context)),
                  ),
                ),
                if (isExpanded) ...[
                  SizedBox(height: 4.h),
                  Text(
                    '${_formatDate(day.date)}  –  ${_formatTime(currentTime)}',
                    style: GoogleFonts.roboto(
                      color: colors.onSurfaceVariant,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 23.h),
                  ...day.tasks.map(
                    (task) => TodoTaskRow(
                      task: task,
                      onChanged: () => onTaskChanged(task),
                    ),
                  ),
                  SizedBox(height: day.tasks.isEmpty ? 72.h : 52.h),
                  TextField(
                    controller: taskController,
                    onSubmitted: onTaskAdded,
                    textInputAction: TextInputAction.done,
                    style: GoogleFonts.roboto(
                      color: colors.onSurface,
                      fontSize: 18.sp,
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Add a new task...',
                      hintStyle: GoogleFonts.roboto(
                        color: colors.onSurfaceVariant.withValues(alpha: .72),
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

TextStyle _dayStyle(BuildContext context) {
  return GoogleFonts.roboto(
    color: Theme.of(context).colorScheme.onSurface,
    fontSize: 41.sp,
    fontWeight: FontWeight.w900,
    letterSpacing: -1.2.sp,
    height: 1,
  );
}

String _formatDate(DateTime date) {
  const months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  return '${months[date.month - 1]}, ${date.day} ${date.year}';
}

String _formatTime(DateTime time) {
  final hour = time.hour % 12 == 0 ? 12 : time.hour % 12;
  final minute = time.minute.toString().padLeft(2, '0');
  final period = time.hour < 12 ? 'am' : 'pm';
  return '$hour:$minute$period';
}
