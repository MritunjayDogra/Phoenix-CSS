import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Emergency  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Container(child: Card(
              margin: EdgeInsets.all(27),
                              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
              color: Colors.black,
              child:Column(children: [

              // SizedBox(
              //                       width:double.infinity,
              //                       child: ElevatedButton(onPressed: () async {
              //                                     await availableCameras().then((value) => Navigator.push(context,
              //                                         MaterialPageRoute(builder: (_) => CameraPage(cameras: value))));
              //                                   }
              //
              //                       , child: Text('Accident',style: TextStyle(fontWeight: FontWeight.bold),),
              //                         style: ElevatedButton.styleFrom(primary: Colors.red),
              //                       ),
              //                     ),




                    SizedBox(
                                          width:double.infinity,
                                          child: ElevatedButton(onPressed: (){
//                                             launchUrlString("tel://8865025773");
                                                         launch("tel://8865025773");
                                          }, child: Text('Emergency',style: TextStyle(fontWeight: FontWeight.bold),),
                                            style: ElevatedButton.styleFrom(primary: Colors.red),
                                          ),
                                        ),
//
//
//
//
//
//
//                        SizedBox(
//                                                            width:double.infinity,
//                                                            child: ElevatedButton(onPressed: (){
//                        //                                       launchUrlString("tel://8865025773");
//                                                              launch("tel://8865025773");
//
//                                                            }, child: Text('Women Care',style: TextStyle(fontWeight: FontWeight.bold),),
//                                                              style: ElevatedButton.styleFrom(primary: Colors.red),
//                                                            ),
//                                                          ),

              ],)


            ,),)
        ],),
      ),
      );
}
}


