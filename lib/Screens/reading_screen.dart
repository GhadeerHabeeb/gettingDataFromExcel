import 'package:flutter/material.dart';
import 'package:untitled2/Lecture_result.dart';
import 'package:untitled2/lessons_info_from_excal.dart';
import 'package:untitled2/video.dart';




class ReadingScreen extends StatefulWidget {
   String lessonTitle;
  ReadingScreen({required this.lessonTitle,Key? key}) : super(key: key);

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}
String Title='';
String video='';
String result='';
String ArabicLecture='';
String ArabicLectureTitle='';


void WhatLesson(String lessonTitle,int index)
{
  if(lessonTitle=='Math')
  {

    Title= '';
    video='';
    result='';

  }
  else if(lessonTitle=='Reading')
  {
    Title= '${feedbacks[index].k2ArabicTitle}';
    video='${feedbacks[index].k2ArabicYoutubeUrl}';
    ArabicLectureTitle='${feedbacks[index].k2ArabicLectureTitle}';
    ArabicLecture='${feedbacks[index].k2ArabicLectureLink}';
  }
  else if(lessonTitle=='Science')
  {
    Title= '';
    video='';
    result='';

  }
  else
  {
    Title= '';
    video='';
    result='';
  }
}

class _ReadingScreenState extends State<ReadingScreen> {
  @override
  void initState() {

   getFeedbackFromSheet();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
        children: [
          ListView.builder(

            itemCount: feedbacks.length,
            itemBuilder: (BuildContext context, int index) {
              WhatLesson(widget.lessonTitle, index);
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

                    height: 300,
                    width: 400,
                    child:  Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text(Title ,style: TextStyle(fontSize: 30),textAlign: TextAlign.center,),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amberAccent,
                                side: BorderSide(
                                    width: 0.2,
                                    color: Colors.grey
                                ),
                                minimumSize: Size(100, 50),

                              ),
                              onPressed: (){
                                WhatLesson(widget.lessonTitle,index);

                                Navigator.push(context,  MaterialPageRoute(builder: (context) =>   Video(id: video,index: index,)));
                              }, child: Text('watch video',style: TextStyle(fontSize: 25))),
                          SizedBox(
                            height: 10,
                          ),
                          Text(ArabicLectureTitle ,style: TextStyle(fontSize: 30),textAlign: TextAlign.center,),
                          SizedBox(
                            height: 10,
                          ),
                           ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffFFE4A0FF),
                                side: BorderSide(
                                    width: 0.2,
                                    color: Colors.grey
                                ),
                                minimumSize: Size(100, 50),

                              ),
                              onPressed: (){
                                WhatLesson(widget.lessonTitle,index);
                                print(video);
                                print(result);
                                Navigator.push(context,  MaterialPageRoute(builder: (context) => LectureResult(lectureResult: ArabicLecture,)));
                              }, child: Text('watch result',style: TextStyle(fontSize: 25)))

                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Container(
            height: 90,
            width: MediaQuery.of(context).size.width,

            decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))
            ),

            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 30.0,
                    child: Center(
                      child: IconButton(
                        onPressed: (){

                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios,size: 30,color: Colors.grey,),
                      ),
                    ),
                  ),
                  Text('المرحلة الثانية',style: TextStyle(fontSize: 30,color: Colors.amberAccent),),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Icon(Icons.menu,size: 30,color: Colors.grey,),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
