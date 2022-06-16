import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotesCardView extends StatelessWidget {
  final String noteText;
  final String noteHearder;
  final Function()? onTap;
  const NotesCardView({
    Key? key,
    required this.noteText,
    required this.onTap,
    required this.noteHearder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.sp)),
          child: Padding(
            padding: EdgeInsets.all(12.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  noteHearder,
                  maxLines: 1,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      color: Colors.grey.shade800),
                ),
                SizedBox(height:9.h),
                Divider(
                  thickness: 2.sp,
                ),
                SizedBox(height:9.h),
                Text(
                  noteText,
                  maxLines: 5,
                  style:TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color:Colors.grey.shade800),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          )),
    );
  }
}
