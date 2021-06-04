import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/Screen/login_page.dart';


class TrendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
            title: Text('Trendy News'),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.backspace_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              )
            ]
        ),
        body: JsonImageList(),
      ),
    );
  }
}

class TrendNews {
  int id;
  String newTitle;
  String newImages;

  TrendNews({
    this.id,
    this.newTitle,
    this.newImages
  });

  factory TrendNews.fromJson(Map<String, dynamic> json) {
    return TrendNews(
        id: json['id'],
        newTitle: json['news_title'],
        newImages: json['news_image']
    );
  }
}

class JsonImageList extends StatefulWidget {

  JsonImageListWidget createState() => JsonImageListWidget();

}

class JsonImageListWidget extends State {

  final String apiURL = "https://news-dataviv.herokuapp.com/NewsApp/GetAllTopStoriesNewsDetails/";

  Future<List<TrendNews>> fetchFlowers() async {

    var response = await http.get(Uri.parse(apiURL));

    if (response.statusCode == 200) {

      final items = json.decode(response.body).cast<Map<String, dynamic>>();

      List<TrendNews> listOfFruits = items.map<TrendNews>((json) {
        return TrendNews.fromJson(json);
      }).toList();

      return listOfFruits;
    }
    else {
      throw Exception('Failed to load data from Server.');
    }
  }

  selectedItem(BuildContext context, String holder) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(holder),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TrendNews>>(
      future: fetchFlowers(),
      builder: (context, snapshot) {

        if (!snapshot.hasData) return Center(
            child: CircularProgressIndicator()
        );

        return ListView(
          children: snapshot.data
              .map((data) => Column(children: <Widget>[
            GestureDetector(
              onTap: (){selectedItem(context, data.newTitle);},
              child: Row(
                  children: [
                    Container(
                        width: 200,
                        height: 100,
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child:
                            Image.network(data.newImages,
                              width: 200, height: 100, fit: BoxFit.cover,))),

                    Flexible(child:
                    Text(data.newTitle,
                        style: TextStyle(fontSize: 18)))
                  ]),),

            Divider(color: Colors.black),

          ],))
              .toList(),
        );
      },
    );
  }
}