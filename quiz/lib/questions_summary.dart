import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget{
const QuestionsSummary({super.key,required this.summaryData});

final List<Map<String,Object>> summaryData;


  @override
  Widget build(context){
     return SizedBox(
       height:300,
       child: SingleChildScrollView(
         child: Column(
          children: summaryData.map(
            (data){
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Padding(
                 padding: const EdgeInsets.only(top: 6),
                 child: 
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: 
                      (data['user_answer'] as String) == (data['correct_answer'] as String)
                          ? const Color.fromARGB(255, 46, 215, 8)
                          : const Color.fromARGB(255, 202, 12, 12),
                     
                   child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: GoogleFonts.ubuntu(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    
                    ),
                 ),
                
               ),
              SizedBox(width: 5),
               Expanded(
                 child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.start,
                  children:[
                    
                   Text(
                    data['question'] as String,
                    style: GoogleFonts.ubuntu(
                        color: const Color.fromARGB(255, 52, 10, 89),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        
                        decorationColor: const Color.fromARGB(255, 88, 4, 46),
                    ),
                       ),
                   const SizedBox(height: 8),
                    
                    Text.rich(
                        TextSpan(
                           children: [
                            const TextSpan(
                              text: 'Selected: ',
                              style: TextStyle(
                                color: Color.fromARGB(255, 12, 9, 11),
                                fontWeight: FontWeight.bold,
                                fontSize: 10
                              ),
                            ),
                            TextSpan(
                              text:data['user_answer'] as String,
                              style: GoogleFonts.ubuntu(
                                       color: data['user_answer'] == data['correct_answer']
                                              ? const Color.fromARGB(255, 29, 135, 5)
                                              : const Color.fromARGB(255, 130, 6, 6),
                                      fontSize: 10,
                                       fontWeight: FontWeight.bold,
                                       )
                                    )
                                 ]  
                               ), 
                            ),
                   const SizedBox(height: 3),

                   Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Correct Answer: ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 12, 9, 11),
                            fontWeight: FontWeight.bold,
                            fontSize: 10
                          ),
                    ),
                    TextSpan(

                      text: data['correct_answer'] as String,
                      style: GoogleFonts.ubuntu(
                        color: const Color.fromARGB(255, 67, 123, 151),
                        fontSize: 10,
                       )
                    )

                    ]
                    )
                   
                    )
                    
                 ]),
               ),
            ],
            );
            },
          ).toList(),
             ),
       ),
     );
  }
}