import 'package:flutter/material.dart';
import 'package:untitled2/Feedback_Model.dart';
import 'package:http/http.dart'as http;
import 'package:untitled2/Lecture_result.dart';
import 'dart:convert'as convert;

import 'package:untitled2/Video_screen.dart';
import 'package:untitled2/video.dart';


class LessonsScreen extends StatefulWidget {
  final String lessonTitle;
  const LessonsScreen({required this.lessonTitle,Key? key}) : super(key: key);

  @override
  State<LessonsScreen> createState() => _LessonsScreenState();
}
String Title='';
String video='';
String result='';
void WhatLesson(String lessonTitle,int index)
{
  if(lessonTitle=='Math')
    {

     Title= '${feedbacks[index].k1MathTitle}';
     video='${feedbacks[index].k1MathYoutubeUrl}';
     result='${feedbacks[index].k1MathLecture}';

    }
  else if(lessonTitle=='Reading')
      {
           Title= '${feedbacks[index].k1ArabicTitle}';
           video='${feedbacks[index].k1ArabicYoutubeUrl}';
           result='';
      }
  else if(lessonTitle=='Science')
  {
    Title= '${feedbacks[index].k1ScienceTitle}';
    video='${feedbacks[index].k1ScienceYoutubeUrl}';
    result='${feedbacks[index].k1ScienceLecture}';

  }
  else
    {
         Title= '';
         video='';
         result='';
    }
}
List<FeedBackModel> feedbacks=<FeedBackModel>[];
String apiEndpoint="https://script.google.com/macros/s/AKfycbwzltHCsTKy_MffxijzVCWpCfOFNFOjyN-gsInd_Uig6kT3PliASj0Pi5p3MFiKhD5P/exec";

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
        print('${element['K1_math_lecture']} next element>>>>>');

         FeedBackModel feedbackModel=new FeedBackModel(
             k1ArabicTitle: element['K1_arabic_title'],
             k1ArabicYoutubeUrl:  element['k1_arabic_youtube_url'],
             k1MathTitle:  element['K1_math_title'],
             k1MathYoutubeUrl:  element['K1_math_youtube_url'],
             k1ScienceTitle: element['K1_science_title'],
             k1ScienceYoutubeUrl:element['K1_science_youtube_url'],
             k1MathLecture: element['K1_math_lecture'],
             k1ScienceLecture:element['K1_science_lecture'] );


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

class _LessonsScreenState extends State<LessonsScreen> {
  @override
  Widget build(BuildContext context) {
    getFeedbackFromSheet();

     return Scaffold(
      body: Stack(
        children: [
          ListView.builder(

            itemCount: feedbacks.length,
            itemBuilder: (BuildContext context, int index) {
              WhatLesson(widget.lessonTitle, index);
              return video==''?Container(
                color: Colors.amberAccent,
                child: Center(child: Text(Title ,style: TextStyle(fontSize: 30),textAlign: TextAlign.center,)),
              ):Padding(
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

                          result==''?Container():ElevatedButton(
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
                                Navigator.push(context,  MaterialPageRoute(builder: (context) => LectureResult(lectureResult: result,)));
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
                  Text('المرحلة الاول',style: TextStyle(fontSize: 30,color: Colors.amberAccent),),
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
