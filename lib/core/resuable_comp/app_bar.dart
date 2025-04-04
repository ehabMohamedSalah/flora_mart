import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  void Function()? onpressed;
  String title;
  AppBarWidget({required this.onpressed, required  this.title});
  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        IconButton(
          onPressed: onpressed,
          icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,size: 25,) ,

        ),
        Text(title??"",style:  Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black,),),

      ],
    );

  }
}
