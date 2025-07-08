import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AnswerButton extends StatelessWidget{

  const AnswerButton(
    {required this.answertext,
    required this.onTap,
    super.key}
    );


  final String answertext;
  final void Function() onTap;
   @override
   Widget build(context){
      return ElevatedButton(
            onPressed: onTap, 
            style:ElevatedButton.styleFrom(
                //backgroundColor: const Color.fromARGB(255, 237, 141, 173),
                padding:EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 15,
                ),
                backgroundColor: const Color.fromARGB(255, 183, 212, 235),
                foregroundColor: const Color.fromARGB(255, 14, 12, 13),
                fixedSize: const Size(300,  60),
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(
                    color: Color.fromARGB(255, 3, 103, 133),
                    width: 1,
                    style: BorderStyle.solid,
                    
                  ),
                ),
                alignment: Alignment.center,
                shadowColor: const Color.fromARGB(255, 3, 103, 133 ),
                elevation: 10,
            ),
            child: Text(
              answertext,
            
             
               softWrap: true,         // ✅ Allows wrapping
               maxLines: 2,            // ✅ Wrap up to 3 lines if needed
               overflow: TextOverflow.visible,
              style: GoogleFonts.ubuntu(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 88, 4, 46),
                
                letterSpacing: 1,
              ),
              textAlign: TextAlign.center,
            )
            );
   }
}