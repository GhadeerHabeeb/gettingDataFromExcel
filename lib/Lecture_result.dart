import 'package:flutter/material.dart';

class LectureResult extends StatefulWidget {
  final String lectureResult;
  const LectureResult({required this.lectureResult,Key? key}) : super(key: key);

  @override
  State<LectureResult> createState() => _LectureResultState();
}

class _LectureResultState extends State<LectureResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child:Image.network(widget.lectureResult),
        ),
      ),
    );
  }
}
