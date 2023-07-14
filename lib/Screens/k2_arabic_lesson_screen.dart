import 'package:flutter/material.dart';
import 'package:untitled2/Screens/k2Arabic_lecture_screen.dart';
import 'package:untitled2/Screens/k2Arabic_video_screen.dart';
import 'package:untitled2/lessons_info_from_excal.dart';


class ArabicLessonsScreen extends StatefulWidget {
  const ArabicLessonsScreen({Key? key}) : super(key: key);

  @override
  State<ArabicLessonsScreen> createState() => _ArabicLessonsScreenState();
}
String Title='';
String onpress='';



void whenButtonPressed(String button,context)
{
  if(button=='video')
  {

    Navigator.push(context, MaterialPageRoute(builder: (context)=> K2VideoReading()));

  }
  else if(button=='lecture')
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> K2LectureReading()));

  }
  else
  {
    Title= '';
   onpress='';


  }

}

class _ArabicLessonsScreenState extends State<ArabicLessonsScreen> {

  @override
  void initState() {
   setState(() {
     getFeedbackFromSheet();
   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
          Column(
            children: [
             Container(
               height: 200,
             ),
              ElevatedButton(onPressed: (){
                whenButtonPressed('video', context);

              },
                  child: Text('Videos',style: TextStyle(fontSize: 30),)),

              SizedBox(
                height: 20,
              ),
              ElevatedButton(

                  onPressed: (){
                whenButtonPressed('lecture', context);
              },
                  child: Text('Lectures',style: TextStyle(fontSize: 30),)),

            ],
          ),
        ],
      ),
    );
  }
}
