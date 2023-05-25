import 'package:flutter/material.dart';
import'package:firebase_auth/firebase_auth.dart';
class InscriptionPage extends StatelessWidget {

  TextEditingController txt_login = new TextEditingController();
  TextEditingController txt_password = new TextEditingController();
  InscriptionPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Inscription')),
      body: Column (children: [
        Container(

          padding: EdgeInsets.fromLTRB(20,100,20,20),
          child: TextFormField(
              controller: txt_login,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: "Utilsateur",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(10)
                  )
              )
          ),

        ),
        Container(
          padding: EdgeInsets.fromLTRB(20,10,20,20),
          child: TextFormField(
              controller: txt_password,
              obscureText: true,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  hintText: "Password",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(10)
                  )
              )
          ),

        ),
        Container(
            padding: EdgeInsets.fromLTRB(100,10,100,10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50)),
              onPressed: () {
                _onInscrire(context);
              },
              child: Text("insciption", style: TextStyle (fontSize : 20)
              ),
            )
        ),
        TextButton(
          child: Text("j'ai deja un compte",
              style: TextStyle(fontSize: 22)),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context,'/Authentification');
          },
        ),
      ],

      ),
    );
  }
  Future<void> _onInscrire(BuildContext context) async{
    SnackBar snackBar = SnackBar(content: Text(""));
    if (!txt_login.text.isEmpty && !txt_password.text.isEmpty){
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: txt_login.text.trim(),
            password: txt_password.text.trim());
        Navigator.pop(context);
        Navigator.pushNamed(context, '/home');
      }on FirebaseAuthException catch (e) {
        if(e.code == 'weak-password'){
          snackBar = SnackBar(
            content: Text('mot de passe faible'),
          );
        }else if (e.code == 'email-already-in-use'){
          snackBar = SnackBar(
            content: Text('Email deja existant'),
          );
        }
      }
    }
    else{
       snackBar = SnackBar(
        content: Text('Id mot de passe vides '),
      );
    }
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}


