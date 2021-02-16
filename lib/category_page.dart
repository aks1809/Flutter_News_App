import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'news.dart';
import 'categories.dart';
import 'category_list.dart';
import 'constants.dart';

List<Category> _categories;

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  double xoffset = 0, yoffset = 0, scaleFactor = 1;
  bool isOpen = false;

  @override
  void initState() {
    super.initState();
    _categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xoffset, yoffset, 0)
        ..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: orange,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.0),
          topLeft: Radius.circular(20.0),
        ),
      ),
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar(
            forceElevated: true,
            elevation: 15.0,
            shadowColor: ligthPurple,
            backgroundColor: ligthPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
              ),
            ),
            leading: isOpen
                ? IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      setState(() {
                        xoffset = 0;
                        yoffset = 0;
                        scaleFactor = 1;
                        isOpen = false;
                      });
                    })
                : IconButton(
                    onPressed: () {
                      setState(() {
                        xoffset = MediaQuery.of(context).size.width * 0.5;
                        yoffset = MediaQuery.of(context).size.height * 0.1;
                        scaleFactor = 0.8;
                        isOpen = true;
                      });
                    },
                    icon: Icon(Icons.menu_open_rounded),
                  ),
            expandedHeight: 200.0,
            pinned: true,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "News Category",
                style: TextStyle(
                  fontSize: 22.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
              background: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  "images/appbar.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            sliver: SliverFixedExtentList(
              itemExtent: 130.0,
              delegate: SliverChildBuilderDelegate(
                (builder, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyNews(
                            category: _categories[index].title.toLowerCase()),
                      ),
                    );
                  },
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Positioned(
                        left: 35.0,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 100.0,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: ligthPurple.withOpacity(0.6),
                                spreadRadius: 3,
                                blurRadius: 3,
                                offset:
                                    Offset(3, 3),
                              ),
                            ],
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            color: darkPurple,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10.0,
                        left: 10.0,
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage(_categories[index].imageUrl),
                          radius: 40.0,
                        ),
                      ),
                      Positioned(
                        left: 90.0,
                        top: 15.0,
                        child: Column(
                          children: [
                            Text(
                              _categories[index].title + " News",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              _categories[index].description,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.0,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                childCount: _categories == null ? 0 : _categories.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
