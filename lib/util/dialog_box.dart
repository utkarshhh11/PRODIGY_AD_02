import 'package:flutter/material.dart';
import 'package:todolist_prodigy/util/my_button.dart';

class DialogBox extends StatelessWidget {
   DialogBox({super.key,required this.controller,required this.onSave,required this.onCancel});
   final controller;
   VoidCallback onSave;
   VoidCallback onCancel;


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue,
      content: Container(
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: controller ,
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add New Task",
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Save", onPressed: onSave),
                SizedBox(width: 55),

                MyButton(text: "Cancel", onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
