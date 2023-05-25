

import'package:firebase_core/firebase_core.dart';
import'package:firebase_auth/firebase_auth.dart';
import'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:test_ikram/pages/MeteoPage.dart';
import 'pages/AuthentificationPage.dart';
import 'pages/ContactPage.dart';
import 'pages/GaleriePage.dart';
import 'pages/HomePage.dart';
import 'pages/InscriptionPage.dart';
import 'pages/ParametresPage.dart';
import 'pages/PaysPage.dart';
import '../config/globalparams.dart';



ThemeData theme = ThemeData.light();
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  GlobalParams.themeActuel.setMode(await _onGetMode());
  runApp(MyApp());

}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp>{


  final routes = {
    "/home" : (context) => HomePage(),
    "/Inscription" : (context) => InscriptionPage(),
    "/Authentification" : (context) => AuthentificationPage(),
    "/meteo" : (context) => MeteoPage(),
    "/galerie" : (context) => GaleriePage(),
    "/pays" : (context) => PaysPage(),
    "/contact" : (context) => ContactPage(),
    "/parametres" : (context) => ParametresPage(),

  };

  Widget build (BuildContext context){
    return MaterialApp(
                debugShowCheckedModeBanner: false,
                routes: routes,
                theme: GlobalParams.themeActuel.getTheme(),
                home:
                StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context,snapshot){
                    if(snapshot.hasData)
                      return HomePage();
                    else
                      return AuthentificationPage();
                  }),
              );
            }
            @override
  void initState(){
    super.initState();
    GlobalParams.themeActuel.addListener(() {
      setState(() {});
    });
  }
  }
  Future<String>_onGetMode() async{
  final snapshot = await ref.child('mode').get();
  if(snapshot.exists)
    mode = snapshot.value.toString();
  else
    mode = "Jour";
  print(mode);
  return(mode);

  }


