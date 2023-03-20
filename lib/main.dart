// import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:phoenix_ccs/page.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:phoenix_ccs/addScr.dart';
void main()  {

  runApp( myApp());
}
class myApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      // color: Colors.black,
      title: 'Admin App',
      debugShowCheckedModeBanner: false,
      scrollBehavior: CupertinoScrollBehavior(),
      theme: ThemeData(
          textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
          // backgroundColor: Color(0xFFF062121),
          primaryColor: Color(0xFFF062121),
          canvasColor: Colors.black,
          appBarTheme: AppBarTheme(color: Color(0xFFF062121))

      ),

      home: threeOptionsScreen(),
    );

  }

}


class threeOptionsScreen extends StatefulWidget {
  const threeOptionsScreen({Key? key}) : super(key: key);

  @override
  State<threeOptionsScreen> createState() => _threeOptionsScreenState();
}

class _threeOptionsScreenState extends State<threeOptionsScreen> {

  int _selectedIndex = 1;
  String dropdownvalue = 'Item 1';
  var items= ['Police','WomenCare','d'];


  // Widget popup(){
  //   return   PopupMenuButton(
  //     child: Center(child: Text('click here')),
  //     itemBuilder: (context) {
  //       return List.generate(5, (index) {
  //         return PopupMenuItem(
  //           child: Text('button no $index'),
  //         );
  //       });
  //     },
  //   );
  // }
  static  List<Widget> _widgetOptions = <Widget>[
    threeOptionsScreen(),
    PopupMenuButton(
      child: Center(child: Text('click here')),
      itemBuilder: (context) {
        return List.generate(5, (index) {
          return PopupMenuItem(
            child: Text('button no $index'),
          );
        });
      },
    )



  ];


  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text(
  //     'Index 0: Home',
  //
  //   ),
  //   Text(
  //     'Index 1: Complaints',
  //     // style: optionStyle,
  //   ),
  //
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late String _dropDownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('phoenix_CSC'),
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
                  elevation: 0,
                  child: Column(

                    children: [


                      Card(shape: StadiumBorder(side: BorderSide(width: 2,color: Colors.black)),
                        child: TextButton(child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 20),
                          child: Text('Emergency',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        ),onPressed: (){
                          launchUrlString("tel:112");
                        },),
                      ),
                      Card(shape: StadiumBorder(side: BorderSide(width: 2,color: Colors.black)),
                        child: TextButton(child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 20),
                          child: Text('Feedback',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        ),onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return AddScreen();
                          }));
                        },),
                      ),


                    ],
                  ),
                ),
              ),
            ],),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet<void>(
                backgroundColor: Color(0xFFF062121),
                // context and builder are
                // required properties in this widget
                context: context,
                builder: (BuildContext context) {
                  // we set up a container inside which
                  // we create center column and display text

                  // Returning SizedBox instead of a Container
                  return SizedBox(
                    height: 200,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 18,vertical: 5),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Card(
                                color: Colors.red,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                                child: TextButton(onPressed: (){
                                  launchUrlString("tel:100");
                                }, child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 12),
                                  child: Text('Police',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),),



                                ))),
                            Card(
                                color: Colors.white,
                                child: TextButton(onPressed: (){
                                  launchUrlString("tel:1091");
                                }, child: Container(
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 12),
                                  // margin: const EdgeInsets.symmetric(horizontal: 40,vertical: 8),

                                  child: Text('Womencare',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                ))),


                          ],
                        ),
                      ),
                    ),
                  );
                }
            );}



          ,
          backgroundColor: Colors.red,
          child: Icon(Icons.sos),


        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        bottomNavigationBar: BottomNavigationBar(
            selectedFontSize: 24,
            type: BottomNavigationBarType.shifting,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(

                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore_rounded),
                label: 'Complaints',

              ),

            ])
    );
  }
}
