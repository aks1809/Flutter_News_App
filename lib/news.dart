import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:newsapp/constants.dart';
import 'fetcher.dart';

class MyNews extends StatefulWidget {
  final String category;
  MyNews({Key key, @required this.category}) : super(key: key);
  @override
  _MyNewsState createState() => _MyNewsState(category);
}

class _MyNewsState extends State<MyNews> {
  String _category;
  List _fetchedData;
  _MyNewsState(this._category);

  getNews() async {
    var news = await Fetcher(category: _category).fetchData();
    setState(() {
      _fetchedData = news;
    });
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Swiper(
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                overflow: Overflow.clip,
                children: [
                  InkWell(
                    child: Image(
                      height: height * 0.5,
                      width: width,
                      image: NetworkImage(_fetchedData[index]["urlToImage"] ??
                          "https://revisionmanufacture.com/assets/uploads/no-image.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: height * 0.4,
                    child: Container(
                      height: height,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                        ),
                        color: ligthPurple,
                      ),
                    ),
                  ),
                  Positioned(
                    top: height * 0.4,
                    child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 10.0),
                        child: Column(
                          children: [
                            Container(
                              width: width * 0.9,
                              child: Text(
                                _fetchedData[index]["title"] ??
                                    "Title Not Found",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width*0.05,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Container(
                              width: width * 0.9,
                              child: Text(
                                _fetchedData[index]["content"] ??
                                    "Content Not Found",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: orange,
                                  fontSize: width*0.04,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Positioned(
                    top: height * 0.4,
                    right: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 5.0, 0.0, 1.0),
                      child: Container(
                        width: width * 0.3,
                        child: Center(
                          child: Text(
                            _fetchedData[index]["publishedAt"].substring(0, 10),
                            style: TextStyle(
                              color: orange,
                              fontSize: width*0.04,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    child: Container(
                      width: width,
                      height: height * 0.15,
                      color: orange,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _fetchedData[(index + 1) % _fetchedData.length]
                                ["title"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: darkPurple,
                              fontSize: width*0.045,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
            itemCount: _fetchedData == null ? 0 : _fetchedData.length,
          ),
          Positioned(
            top: 30.0,
            left: 10.0,
            child: CircleAvatar(
              radius: 20.0,
              backgroundColor: orange,
              child: Center(
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: darkPurple,
                  onPressed: (){Navigator.pop(context);},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
