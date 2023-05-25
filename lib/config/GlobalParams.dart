import 'package:flutter/material.dart';
import '../notifier/theme.dart';
class GlobalParams{
  static List<Map<String,dynamic>>menus=[
    {"title": "Acceuil","icon":Icon(Icons.home,color:Colors.blue),"route":"/home"},
    {"title": "meteo","icon":Icon(Icons.sunny_snowing,color:Colors.blue),"route":"/meteo"},
    {"title": "galerie","icon":Icon(Icons.photo,color:Colors.blue),"route":"/galerie"},
    {"title": "pays","icon":Icon(Icons.location_city,color:Colors.blue),"route":"/pays"},
    {"title": "contact","icon":Icon(Icons.contact_page,color:Colors.blue),"route":"/contact"},
    {"title": "parametres","icon":Icon(Icons.settings,color:Colors.blue),"route":"/parametres"},
    {"title": "Déconnexion","icon":Icon(Icons.logout,color:Colors.blue),"route":"/Authentification"},
  ];
  static MonTheme themeActuel=MonTheme();
}