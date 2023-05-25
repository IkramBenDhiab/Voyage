import 'package:flutter/material.dart';

import 'PaysDetailsPage.dart';
class PaysPage extends StatelessWidget {
  TextEditingController txt_pays = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Pays'),
      ),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: txt_pays,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_on_rounded),
                    hintText:"keyword",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(10))),
              )
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50)),
                onPressed: () {
                  _onGetGalleryDetails(context);
                },
                child: Text( 'chercher', style: TextStyle(fontSize:22))),
          ),
        ],
      ),
    );
  }
  void _onGetGalleryDetails (BuildContext context){
    String keyword = txt_pays.text;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PaysDetailsPage(keyword)));
    txt_pays.text = "";
  }

}



