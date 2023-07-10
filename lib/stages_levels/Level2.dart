import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:untitled2/StageData.dart';
import 'package:untitled2/lessons_info_from_excal.dart';
import 'package:untitled2/stages_levels/Level1.dart';
class Level2 extends StatefulWidget {
  static const id='level2';
  const Level2({Key? key}) : super(key: key);

  @override
  State<Level2> createState() => _Level2State();
}

class _Level2State extends State<Level2> {

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(

          children: [
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.black,
                  ),
                ),
                Hero(
                  tag: 'title',
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Stack(
                        clipBehavior:Clip.antiAlias,
                        children: [
                          Center(
                              child:  Text(args.title,style: TextStyle(color: Colors.white,fontSize: 20),)
                          ),]
                    ),
                    decoration: BoxDecoration(
                        color: args.color,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [BoxShadow(
                          blurRadius:10.0,
                          offset: Offset(0, 3),
                          spreadRadius: 2.0,
                          color: Colors.grey,
                        )]
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: Colors.white70,
              child: Center(child: Text('المرحلة الثانية',style: TextStyle(fontSize: 30),)),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: GridView.count(
                primary: false,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[

                  SubjectsCard(args: args,icons:Icons.add,subTilte: 'Math',),
                  SubjectsCard(args: args,icons:Icons.science,subTilte: 'Science',),
                  SubjectsCard(args: args,icons:Icons.menu_book,subTilte: 'Reading',),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
class SubjectsCard extends StatelessWidget {
  IconData icons;
  String subTilte;
  SubjectsCard({
    Key? key,
    required this.subTilte,
    required this.icons,
    required this.args,
  }) : super(key: key);

  final ScreenArguments args;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Column(
        children: [

          Card(
            color: Colors.white70,
            shadowColor: args.color,
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0,right: 10.0,left: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircularStepProgressIndicator(
                          totalSteps: 100,
                          currentStep: 74,
                          stepSize: 5,
                          selectedColor: args.color,
                          unselectedColor: Colors.grey[400],
                          padding: 0,
                          width: 50,
                          height: 50,
                          selectedStepSize: 6,
                          roundedCap: (_, __) => true,
                        ),
                        Text(subTilte,style: TextStyle(fontSize: 20),),
                      ],
                    ),
                  ),
                  Icon(icons,size: 100,color: Colors.blueGrey,),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
