import 'package:flutter/material.dart';
import 'package:test_packages_app/widgets/text_view.dart';
 class CustomElevatedButton extends StatelessWidget {
   const CustomElevatedButton({Key? key, required this.text,required this.onTap, this.color = Colors.blueGrey}) : super(key: key);

   final String text;
   final Function onTap;
   final Color color;

   @override
   Widget build(BuildContext context) {
     return
       ElevatedButton(
         style: ElevatedButton.styleFrom(backgroundColor: color),
         onPressed: () {
           onTap();
         },
         child: TextView(text: text, color: Colors.white,),
       );
   }
 }
