// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController? _description ;
  String? a;





  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Center(
        child: Container(


          margin: EdgeInsets.symmetric(vertical: 100),
          child: Column(
            children: [

              Container(
                margin: EdgeInsets.all(27),

                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Icon(Icons.tv_outlined,color: Colors.white,),
                          Text(' Wanna share a feedback? 📰',style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.05,fontFamily: 'Dongle'),),

                        ],
                      ),
                      margin: EdgeInsets.only(bottom: 55),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Description:',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
                    Card(

                      color: Colors.white12,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: const InputDecoration(

                            hintText: 'Describe what yoy want to convey.....',
                            // labelText: 'Description:',
                            hintStyle: TextStyle(color: Colors.white70)
                          ),
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white54,
                          textCapitalization: TextCapitalization.sentences,
                          // dragStartBehavior: DragStartBehavior.start,

                          autofocus: false,
                          // focusNode: _focusnode,
                          maxLines: null,
                          controller: _description,

                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ),


                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.all(27),
                child: ElevatedButton(
                    onPressed: (){

                    },
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.upload_file),
                    Text( ' Upload a file'),
                  ],
                )),
              ),

              Container(
                margin: EdgeInsets.all(27),
                child: ElevatedButton(
                    onPressed: () async{
                      // await FlutterEmailSender.send(send_email);

                    },
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.upload_file),
                    Text( ' Submit'),
                  ],
                )),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
