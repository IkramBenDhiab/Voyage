import 'package:flutter/material.dart';

import '../Menu/drawerwidget.dart';
import 'package:firebase_database/firebase_database.dart';
import '../config/globalparams.dart';
String mode="jour";
FirebaseDatabase fire = FirebaseDatabase.instance;
DatabaseReference ref = fire.ref();

class ParametresPage extends StatefulWidget {
  @override
  State<ParametresPage> createState() => _ParametersPageState();
}

class _ParametersPageState extends State<ParametresPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Parametres'),
      ),
      body: Column(
       mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Mode',style: Theme.of(context).textTheme.headline3,),
          Column(
            children: <Widget>[
              ListTile(
                title: const Text('Jour'),
                leading: Radio<String>(
                  value: "Jour",
                  groupValue:mode,
                  onChanged: (value){
                    setState(() {
                      mode=value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Nuit'),
                leading: Radio<String>(
                  value: "Nuit",
                  groupValue:mode,
                  onChanged: (value){
                    setState(() {
                      mode=value!;
                    });
                  },
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50)),
              onPressed: (){
                _onSavedMode();
              },
              child: Text('Enregistrer',style: TextStyle(fontSize: 22))),
          ),
        ],
      ),
    );
  }
  _onSavedMode() async{
    GlobalParams.themeActuel.setMode(mode);
    await ref.set({ "mode": mode});
    print("mode appliqué $mode");
    Navigator.pop(context);
  }
}

