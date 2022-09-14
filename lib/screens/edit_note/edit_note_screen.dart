import 'package:flutter/material.dart';

import '../../models/models.dart';

class EditNotescreen extends StatefulWidget {
  final Note? note;
  const EditNotescreen({
    Key? key,
    this.note,
  }) : super(key: key);

  @override
  State<EditNotescreen> createState() => _EditNotescreenState();
}

class _EditNotescreenState extends State<EditNotescreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
