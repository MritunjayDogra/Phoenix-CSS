import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phoenix_ccs/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'authHome.dart';


String? u1;
class usda{
  usda(String uid){
    u1=uid;
  }
}



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthService _auth = new AuthService();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(27),

        child: Column(

          children: [
            ListTile(leading: Icon(CupertinoIcons.settings,color: Colors.white,),title: Text('Settings',style: TextStyle(color: Colors.white),),onTap: (){}),
            const Divider(color: Colors.white,),
            ListTile(leading: Icon(Icons.manage_accounts,color: Colors.white,),title: Text('Account',style: TextStyle(color: Colors.white)),onTap: (){}),
            const Divider(color: Colors.white,),
            ListTile(leading: Icon(Icons.private_connectivity,color: Colors.white,),title: Text('Contact us',style: TextStyle(color: Colors.white)),onTap: (){}),
            Divider(color: Colors.white,),
            ListTile(leading: Icon(Icons.connect_without_contact,color: Colors.white,),title: Text('Become a reporter',style: TextStyle(color: Colors.white)),onTap: (){}),
            Divider(color: Colors.white,),
            ListTile(leading: Icon(Icons.lock_reset,color: Colors.white,),title: Text('Change Password',style: TextStyle(color: Colors.white)),onTap: (){}),
            Divider(color: Colors.white,),
            ListTile(leading: Icon(Icons.logout,color: Colors.white,),title: Text('Logout',style: TextStyle(color: Colors.white)),onTap: () async {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(

                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      title: Text('Are you sure you want to log out?'),
                      icon: Icon(Icons.output),

                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(

                            onPressed: () async {
                              await _auth.signOut();
                              print(u1);
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              prefs.remove('email');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AuthHomeScreen()));
                            },
                            style:  ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white)),
                              backgroundColor: Colors.green,


                            ),
                            child: Text('Yes'),),
                          ElevatedButton(onPressed: (){
                            Navigator.of(context, rootNavigator: true).pop('dialog');
                          }, child: Text('No'),
                            style:  ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
                              backgroundColor: Colors.red,


                            ),
                          )
                        ],),
                    );
                  });

            }),
            Divider(color: Colors.white,),
          ],
        ),
      ),
    );
  }
}

