import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/todo/const/todo_colors.dart';
import 'package:flutter_ui/features/todo/model/todo_day.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoTaskRow extends StatelessWidget {
  const TodoTaskRow({required this.task, required this.onChanged, super.key});

  final TodoTask task;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onChanged,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 3.h),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 160),
              width: 21.w,
              height: 21.w,
              decoration: BoxDecoration(
                color: task.isDone ? TodoColors.orangeClr : Colors.transparent,
                border: Border.all(
                  color: task.isDone
                      ? TodoColors.orangeClr
                      : colors.onSurfaceVariant,
                  width: 1.8,
                ),
                borderRadius: BorderRadius.circular(3.r),
              ),
              child: task.isDone
                  ? Icon(Icons.check_rounded, color: Colors.white, size: 17.sp)
                  : null,
            ),
            SizedBox(width: 11.w),
            Text(
              task.title,
              style: GoogleFonts.roboto(
                color: task.isDone ? colors.onSurfaceVariant : colors.onSurface,
                fontSize: 18.sp,
                height: 1.35,
                decoration: task.isDone
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                decorationColor: colors.onSurfaceVariant,
                decorationThickness: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
