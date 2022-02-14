import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news/news%20.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<News> newsList = [];
  bool _isLoad = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "News App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          backgroundColor: Colors.red,
        ),
        body: _isLoad
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Card(
                elevation: 20,
                shadowColor: Colors.red,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Image(
                              image: NetworkImage(
                            newsList[index].imageUrl!,
                          )),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            newsList[index].title!,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            newsList[index].description!,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  newsList[index].author!,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                flex: 1,
                              ),
                              Expanded(
                                child: SizedBox(),
                                flex: 1,
                              ),
                              Expanded(
                                child: Text(
                                  newsList[index].date!,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                flex: 1,
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: newsList.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      child: Divider(
                        thickness: 10,
                      ),
                    );
                  },
                ),
              ));
  }

  @override
  void initState() {
    _isLoad = true;
    fetchAlbum();
    super.initState();
  }

  fetchAlbum() async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=tesla&from=2021-08-09&sortBy=publishedAt&apiKey=c27d6f860573426b8a78fdfdf716a52d"));
    var jsonDecoded = jsonDecode(response.body);
    for (Map<String, dynamic> data in jsonDecoded['articles']) {
      newsList.add(News.fromMap(data));
    }
    setState(() {
      _isLoad = false;
    });
  }
}
