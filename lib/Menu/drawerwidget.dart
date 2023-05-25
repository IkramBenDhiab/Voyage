import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/GlobalParams.dart';

class MyDrawer extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient (colors: [Colors.white, Colors.blue]
                    )
                ),
                child: Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage("images/ikram.PNG"),
                      radius: 70,
                    )
                )
            ),
             //on remplace tout ca avec l'importation de classe lobalParams
            /*ListTile(
              title: Text('Acceuil', style: TextStyle(fontSize: 22)) ,
              leading: Icon(Icons.home, color: Colors.blue),
              trailing: Icon(Icons.arrow_right, color: Colors.blue),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "/home");
              },
            ),
            Divider(height :4, color: Colors.blue),
            ListTile(
              title: Text('Météo', style: TextStyle(fontSize: 22)) ,
              leading: Icon(Icons.sunny_snowing, color: Colors.blue),
              trailing: Icon(Icons.arrow_right, color: Colors.blue),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "/meteo");
              },
            ),
            Divider(height :4, color: Colors.blue),
            ListTile(
              title: Text('Gallerie', style: TextStyle(fontSize: 22)) ,
              leading: Icon(Icons.photo, color: Colors.blue),
              trailing: Icon(Icons.arrow_right, color: Colors.blue),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "/gallerie");
              },
            ),
            Divider(height :4, color: Colors.blue),
            ListTile(
              title: Text('Pays', style: TextStyle(fontSize: 22)) ,
              leading: Icon(Icons.location_city, color: Colors.blue),
              trailing: Icon(Icons.arrow_right, color: Colors.blue),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "/pays");
              },
            ),
            Divider(height :4, color: Colors.blue),
            ListTile(
              title: Text('Contact', style: TextStyle(fontSize: 22)) ,
              leading: Icon(Icons.contact_page, color: Colors.blue),
              trailing: Icon(Icons.arrow_right, color: Colors.blue),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "/contact");
              },
            ),
            Divider(height :4, color: Colors.blue),
            ListTile(
              title: Text('Paramétres', style: TextStyle(fontSize: 22)) ,
              leading: Icon(Icons.settings, color: Colors.blue),
              trailing: Icon(Icons.arrow_right, color: Colors.blue),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "/parametres");
              },
            ),
            Divider(height :4, color: Colors.blue),
            ListTile(
              title: Text('Déconnexion', style: TextStyle(fontSize: 22)) ,
              leading: Icon(Icons.logout, color: Colors.blue),
              trailing: Icon(Icons.arrow_right, color: Colors.blue),
              onTap: () async{
                  prefs = await SharedPreferences.getInstance();
                  prefs.setBool("connecte",false);
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/Authentification',(Route<dynamic> route)=>false);
              },
            ),
            Divider(height :4, color: Colors.blue),
            */
            //Parcourir les differentes elements du menu
            ...(GlobalParams.menus as List).map((item){
              return ListTile(
                title: Text('${item['title']}',style: TextStyle(fontSize: 22)),
                leading: item['icon'],
                trailing: Icon(Icons.arrow_right,color: Colors.blue),
                onTap: () async{
                  if ('${item['title']}'!="Déconnexion"){
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, "${item['route']}");
                  }
                  else{
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushNamedAndRemoveUntil('/Authentification', (Route<dynamic> route) => false);
                  }
                  },
              );
            }
            )
          ],
        )
    );
  }}