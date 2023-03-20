import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class threeOptionsScreen extends StatefulWidget {
  const threeOptionsScreen({Key? key}) : super(key: key);

  @override
  State<threeOptionsScreen> createState() => _threeOptionsScreenState();
}

class _threeOptionsScreenState extends State<threeOptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Name'),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(
            // padding: EdgeInsets.all(27),
            child: Card(
              margin: EdgeInsets.all(27),
              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
              color: Colors.black,
              child: Column(
                
                children: [
                  SizedBox(
                    width:double.infinity,
                    child: ElevatedButton(onPressed: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context) {
                      //   return page1();
                      // }
                    }, child: Text('Emergency Response',style: TextStyle(fontWeight: FontWeight.bold),),
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    ),
                  ),

                   SizedBox(
                     width: double.infinity,
                     child: ElevatedButton(onPressed: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context) {
                      //   return page2();
                      // }
                  }, child: Text('Complaints',style: TextStyle(fontWeight: FontWeight.bold),),
                       style: ElevatedButton.styleFrom(primary: Colors.orange),
                     ),
                   ),

                   SizedBox(
                     width: double.infinity,
                     child: ElevatedButton(onPressed: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context) {
                      //   return page3();
                      // }
                  }, child: Text('Anonymous',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                       style: ElevatedButton.styleFrom(primary: Colors.yellow),
                     ),
                   ),


                ],
              ),
            ),
          ),
        ],),
      ),
    );
  }
}
