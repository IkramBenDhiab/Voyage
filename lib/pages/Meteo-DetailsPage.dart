import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';
class MeteoDetailsPage extends StatefulWidget{
  String ville ="";
  MeteoDetailsPage(this.ville);
  @override
  State<MeteoDetailsPage> createState() => _MeteoDetailsPageState();
}
  class _MeteoDetailsPageState extends State<MeteoDetailsPage> {
    var meteoData;

    @override
    void initState() {
      super.initState();
      getMeteoData(widget.ville);
    }

    void getMeteoData(String ville) {
      print("Méteo de la ville de " + ville);
      String url = "https://api.openweathermap.org/data/2.5/forecast?q=paris&appid=c109c07bc4df77a88c923e6407aef864&fbclid=IwAR2X4_B7Z8DWqTH0tynumT0QgcpKeOrwJdBDBt2eziyVRtlKwnJlS1n_mlo";
      http.get(Uri.parse(url)).then((resp) {
        setState(() {
          this.meteoData = json.decode(resp.body);
          print(this.meteoData);
        });
      }).catchError((err) {
        print(err);
      });
    }

    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(title: Text('Page Meteo Details ${widget.ville}')),
          body: meteoData == null ? Center(
            child: CircularProgressIndicator(),
          ) :
          ListView.builder(
              itemCount: (meteoData == null ? 0 : meteoData['list'].length),
              itemBuilder: (context, index) {
                return Card(
                  //Supprimer cette  propriéte
                  //color: Colors.blue,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.blue, Colors.transparent])),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  "images/${meteoData['list'][index]['weather'][0]['main']
                                      .toString()
                                      .toLowerCase()}.png"
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text(
                                    "${new DateFormat('E-dd/MM/yyyy').format(
                                        DateTime.fromMicrosecondsSinceEpoch(
                                            meteoData['list'][index]['dt'] *
                                                1000000))}",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text(
                                    "${new DateFormat('HH:mm').format(
                                        DateTime.fromMicrosecondsSinceEpoch(
                                            meteoData['list'][index]['dt'] * 1000000))}"
                                        " | ${meteoData['list'][index]['weather'][0]['main']}",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],),
                            ),
                          ],),

                        Text(
                          "${(meteoData['list'][index]['main']['temp'] - 273.15)
                              .round()} °C",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              })
      );
    }
}




