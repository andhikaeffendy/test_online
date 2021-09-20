import 'package:flutter/material.dart';
import 'package:test_app/api/articles.dart';
import 'package:test_app/model/articles.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Articles>? articles = [];
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Today Artikel",
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.search,
                size: 20,
                color: Colors.white,
              ))
        ],
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: articles?.length,
          itemBuilder: (context, index) {
            return _isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(
                        articles?[index].urlToImage == null
                            ? "https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832__340.jpg"
                            : "${articles?[index].urlToImage}",
                      ),
                      fit: BoxFit.fill,
                    )),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "${articles?[index].title}",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "${articles?[index].author}",
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                "${articles?[index].description}",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
          }),
    );
  }

  _loadData() async {
    ApiArticles.futureApiGetArticles().then((value) {
      if (value.isSucces()) {
        articles = value.articles;
        _isLoading = false;
      } else {
        articles = [];
      }
    });
  }
}
