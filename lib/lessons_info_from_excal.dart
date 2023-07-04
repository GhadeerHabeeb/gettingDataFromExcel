import 'package:flutter/material.dart';
import 'package:untitled2/Feedback_Model.dart';
import 'package:http/http.dart'as http;
import 'dart:convert'as convert;

import 'package:untitled2/Video_screen.dart';
import 'package:untitled2/video.dart';


class LessonsScrean extends StatefulWidget {
  final String lessonTitle;
  const LessonsScrean({required this.lessonTitle,Key? key}) : super(key: key);

  @override
  State<LessonsScrean> createState() => _LessonsScreanState();
}
WhatLesson(String lessonTitle,int index)
{
  if(lessonTitle=='Math')
    {

      return '${feedbacks[index].k1MathTitle}';
    }
  else if(lessonTitle=='Reading')
      {
          return '${feedbacks[index].k1ArabicTitle}';
      }
  else
    {
      return  '';
    }
}
List<FeedBackModel> feedbacks=<FeedBackModel>[];
String apiEndpoint="https://script.google.com/macros/s/AKfycbxKXW5I95tOE04jklSbugLqp0msJMvktFwgLIViCKYx_u9EGL3I1wesuXd8CWBm7G0/exec";

Future<List<FeedBackModel>? > getFeedbackFromSheet()
async{
  try {
    print('hello world');
    // Replace with your own api url

    final Uri url = Uri.parse(apiEndpoint);
    print(url);
    var response = await http.get(url);
    print('hiii!$response');

    if (response.statusCode == 200) {
      var jsonsDataString = response.body.toString(); // toString of Response's body is assigned to jsonDataString

      var jsonsDataDecode=convert.jsonDecode(jsonsDataString);
      print(jsonsDataDecode);
      jsonsDataDecode.forEach((element){
        print('${element} next element>>>>>');
        print('${element['K1_arabic_title']} next element>>>>>');

         FeedBackModel feedbackModel=new FeedBackModel(
             k1ArabicTitle: element['K1_arabic_title'],
             k1ArabicYoutubeUrl:  element['k1_arabic_youtube_url'],
             k1MathTitle:  element['K1_math_title'],
             k1MathYoutubeUrl:  element['K1_math_youtube_url']);
feedbacks.add(feedbackModel);
print(feedbacks.length);
      });

    };

  } catch (err) {
    // Handling error

    print('error ${err}');
  }
}


@override
void initState() {
  initState();

}

class _LessonsScreanState extends State<LessonsScrean> {
  @override
  Widget build(BuildContext context) {
    getFeedbackFromSheet();

     return Scaffold(
      body: Container(
        child:ListView.builder(

          itemCount: feedbacks.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding:  EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                        boxShadow: [BoxShadow(
                          blurRadius: 0.9,
                        spreadRadius: 0.9,
                        color: Colors.grey,
                        offset: Offset(3, 4)
                    )],
                    ),

                    height: 200,
                    width: 400,
                  child: Container(
                    child: Column(
                      children: [
                        Text(WhatLesson(widget.lessonTitle,index) ,style: TextStyle(fontSize: 30),),
                        ElevatedButton(

                            onPressed: (){
                              WhatLesson(widget.lessonTitle,index);
                              Navigator.push(context,  MaterialPageRoute(builder: (context) =>   Video(id: feedbacks[index].k1MathYoutubeUrl,index: index,)));
                            }, child: Text('watch video',style: TextStyle(fontSize: 30)))

                      ],
                    ),
                  ),
                    ),
              ),
            );
          },
        ),),
    );
  }
}
