import"package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";  
class StartScreen extends StatelessWidget{

const StartScreen(this.startQuiz,{super.key});

final void Function() startQuiz;

  @override
  Widget build(context){
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           Opacity(
            opacity: 0.8,
             child: Image.asset(
                'assets/logo.png',
                width: 350,
                height: 350,
                
                
                //color: Color.fromARGB(255, 235, 233, 244),
               
                //another way of making the image transparent by using the color property
                //the color is applied on the image, so it will be transparenT by opacity slider 
                ),
           ),
        

          /*
          one way of maKing the image transparent by wrapping it in an Opacity widget
          Opacity(
            opacity:0.4,
            child: Image.asset(
              'assets/images/quiz-logo.png',
              width: 250,
              ),
          ),

          */
          //const SizedBox(height: 20,),//for spacing
           Text(
            'Brush It Up!!',
              style:GoogleFonts.montserrat(
                color: Color.fromARGB(255, 5, 43, 25),
                fontSize: 30,
                fontWeight: FontWeight.bold,
                
              ),
              textAlign: TextAlign.center,
            ),
          const SizedBox(height: 20,),//for spacing
          OutlinedButton.icon(
            onPressed: () {
                 startQuiz();//this is a callback function that will be called when the button is pressed
                            //it will call the SwitchScreen function in the quiz.dart file


            }, 
            style:OutlinedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 179, 214, 231),
              //one way of styling the button 
            ),
            icon:  const Icon(Icons.play_lesson_outlined),
            label: Text(
               'Start Quiz',
               
               style:GoogleFonts.ubuntu(
                  color: const Color.fromARGB(255, 17, 4, 88),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
               ),
               ),
          ),
      ],
      
      ),
    );  
  }
} 