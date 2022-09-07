import 'package:flutter/material.dart';

import '../../models/models.dart';

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
    return Container();
  }
}
