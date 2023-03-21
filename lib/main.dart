// import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:phoenix_ccs/page.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:phoenix_ccs/addScr.dart';
import 'package:phoenix_ccs/authHome.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:phoenix_ccs/signin.dart';
import 'package:phoenix_ccs/signup.dart';


var email;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  email = prefs.getString('email');
  print(email);
  runApp( const myApp());
}

class myApp extends StatelessWidget{
  const myApp({super.key});


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

      home: AuthHomeScreen(),// : threeOptionsScreen(),
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
          title: Text('Phoenix CCS'),
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



class AuthHomeScreen extends StatelessWidget {
  const AuthHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,

        // decoration: BoxDecoration(
        //
        //
        //   // image: DecorationImage(
        //   //     image: AssetImage('assets/images/newspaper.jpg'),
        //   //     fit: BoxFit.cover),
        // ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  padding: EdgeInsets.all(76),
                  decoration: BoxDecoration(
                    // color: Colors.black54,
                    // image: DecorationImage(
                    //     image: AssetImage('assets/images/newspaper.jpg'),
                    //     fit: BoxFit.contain),

                    borderRadius: BorderRadius.circular(
                        18),
                  ),


                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      // SimpleShadow(
                      //
                      //   child: Image.asset('assets/images/logoS.png',color: Colors.white,),
                      //   color: Colors.black,
                      //   opacity: 1,
                      // ),
                      BorderedText(
                        strokeWidth: 2,
                        child:Text('CCS' ,style: TextStyle(fontFamily: 'Darker',fontSize: 54,fontWeight: FontWeight.bold),),),
                    ],
                  )),
              Column(
                children: [


                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SignInScreen()));
                    },

                    style: ElevatedButton.styleFrom(
                        elevation: 18,
                        padding:
                        EdgeInsets.symmetric(horizontal: 75.0, vertical: 10.0),
                        backgroundColor: Colors.black54,
                        shape: StadiumBorder(side: BorderSide(width: 2,color: Colors.white))
                    ),
                    child: Text('Sign in',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SignUpScreen()));},
                    style: ElevatedButton.styleFrom(
                        elevation: 18,
                        padding:
                        EdgeInsets.symmetric(horizontal: 75.0, vertical: 10.0),
                        backgroundColor: Colors.white70,
                        shape: StadiumBorder(side: BorderSide(width: 2))
                    ),
                    child: Text('Sign up',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


