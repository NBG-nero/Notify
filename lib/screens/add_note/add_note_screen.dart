import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../utilities/constants/constants.dart';

class AddNotescreen extends StatefulWidget {
  final Note? note;
  const AddNotescreen({
    Key? key,
    this.note,
  }) : super(key: key);

  @override
  State<AddNotescreen> createState() => _AddNotescreenState();
}

class _AddNotescreenState extends State<AddNotescreen> {
  final formKey = GlobalKey<FormState>(); 
  
 TextEditingController titleCtrl = TextEditingController();
  TextEditingController descCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: NColors.secondaryColor,
      appBar: AppBar( 
        title: Text('Add Note'),
        centerTitle: true, 
        elevation: 0, 
        backgroundColor: Colors.transparent,
      ),
      body: ListView( 
        children:[ 
           TextFormField( 
            
            decoration: const InputDecoration( 
              border :InputBorder.none, 
              hintText: 'Enter Title Text', 
              hintStyle: TextStyle(fontSize:20.sp,fontWeight:FontWeight.bold,color:Colors.white54), 
              
            ),
            style: const TextStyle( 

                fontSize:20 .sp, 
                fontWeight: FontWeight.bold, 
                color:Colors.white,
              ), 
             
             

           ),
           SizedBox(height:10.h), 
           TextFormField( 
            decoration: const InputDecoration(
              border: InputBorder.none, 
              hintText:'Description'
              hintStyle:TextStylee(fontSize:10.sp,fontWeight:FontWeight.bold,color:Colors.white54), 
              
            ) ,
            style: const TextStyle( 
              fontSize:18.sp, 
              color:Colors.white,
            ),
            maxlines:1000

            )
        ]
      ), 
      floatingActionButton:FloatingActionButton( 
        onpressed:() { 

        },
        backgroundColors:Colors.white54, 
        child:Icon(Icons.add,size:30.h,color:Collors.blue.shade900),
      )
    );
  }
}
