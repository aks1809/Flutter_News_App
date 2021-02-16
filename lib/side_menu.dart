import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'constants.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      color: darkPurple,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Akshay",
                  style: TextStyle(
                    color: orange,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(r"https://i.pinimg.com/564x/f7/f6/60/f7f66062e1fbd1adf17da8e045af7caa.jpg"),
                  radius: 15.0,
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
              width: 120.0,
              child: Divider(
                color: orange,
              ),
            ),
            Text(
              "User profiles",
              style: TextStyle(
                color: orange,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 120.0,
              child: Divider(
                color: orange,
              ),
            ),
            Text(
              "Liked Posts",
              style: TextStyle(
                color: orange,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 120.0,
              child: Divider(
                color: orange,
              ),
            ),
            Text(
              "Settings",
              style: TextStyle(
                color: orange,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
