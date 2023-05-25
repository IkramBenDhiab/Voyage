import 'package:flutter/material.dart';
import'package:firebase_auth/firebase_auth.dart';

class AuthentificationPage extends StatelessWidget {

  TextEditingController txt_login = new TextEditingController();
  TextEditingController txt_password = new TextEditingController();
  AuthentificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Page Authentification')),
        body: Column (
          children: [
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
                  _onAuthentifier(context);
                },
                child: Text("connexion", style: TextStyle (fontSize : 20)
                ),
              ),

            ),
            TextButton(
              child: Text("Nouvel Utilisateur ",
                  style: TextStyle(fontSize: 22)),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context,'/Inscription');
              },
            ),
          ],

        )
    );
  }
  Future<void> _onAuthentifier(BuildContext context) async{
    SnackBar snackBar = SnackBar(content: Text(""));
    if (!txt_login.text.isEmpty  && !txt_password.text.isEmpty){
      try{
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: txt_login.text.trim(),
                password: txt_password.text.trim(),
            );
        Navigator.pop(context);
        Navigator.pushNamed(context, '/home');
      }on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found'){
          snackBar =SnackBar(
            content: Text('Verifier votre mot de passe'),
          );
        }
      }catch(e){
        print(e);
      }
    }
    else{
      snackBar = SnackBar(
        content: Text('Verifier votre Id ou mot de passe  '),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
  }
