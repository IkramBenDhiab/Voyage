import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class PaysDetailsPage extends StatefulWidget {
  String pays = "";

  PaysDetailsPage(this.pays);
  @override
  State<PaysDetailsPage> createState() => _PaysDetailsPageState();
}

class _PaysDetailsPageState extends State<PaysDetailsPage> {
  var paysData;
  @override
  void initState() {
    super.initState();
    getPaysData(widget.pays);
  }

  void getPaysData(String pays) {
    print("Page Pays Details de " + pays);
    String url =
        "https://restcountries.com/v3.1/name/${pays}?fbclid=IwAR2Ind-d7l7nfF21EkwBq4R72hzYFhF4vWqcrRmZM5MUKUQGDPxFER6ek24";

    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        List<int> bytes = resp.bodyBytes;
        String responseString = utf8.decode(bytes);
        this.paysData = json.decode(responseString);
        print(this.paysData);
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Pays Details ${widget.pays} '),
      ),
      body: paysData == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: paysData.length,
        itemBuilder: (context, index) {
          return
            Padding(
              padding: EdgeInsets.only(left: 16.0,top: 20,bottom: 20),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(
                      paysData[index]["flags"]["png"],
                      width: 400,
                      height: 400,
                    ),
                  ),                Text(paysData[index]["name"]["common"]),
                  SizedBox(height: 20,),
                  Text(paysData[index]["translations"]["per"]["common"]),
                  SizedBox(height: 20,),
                  Text("Administration", style: TextStyle(color: Colors.blue)),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text("Capitale: "),
                      Text(paysData[index]["capital"][0]),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text("Langues: "),
                      Text(paysData[index]["languages"].keys.join(", ")),
                    ],
                  ),
                  SizedBox(height: 20,),


                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text("Géographie", style: TextStyle(color: Colors.blue)),
                      SizedBox(height: 20,),

                      Text("Capitale : ${paysData[index]["capital"][0]}"),
                      SizedBox(height: 10,),

                      Text("Région : ${paysData[index]["region"]}"),
                      SizedBox(height: 10,),

                      Text("Fuseau horaire : ${paysData[index]["timezones"][0]} ${paysData[index]["utc_offset"]}"),
                    ],
                  ),
                  SizedBox(height: 20,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text("Démographie", style: TextStyle(color: Colors.blue)),
                      SizedBox(height: 10,),

                      Text("Population: ${paysData[index]["population"]}")

                    ],
                  ),
                ],
              ),);


          /*ListTile(
            title: Text(paysData[index]["name"]["common"]),
            subtitle: Text(paysData[index]["capital"][0]),
            leading: Image.network(paysData[index]["flags"]["png"]),
          );*/
        },
      ),
    );
  }
}
