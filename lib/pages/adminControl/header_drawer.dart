import 'package:flutter/material.dart';

class header_drawer extends StatefulWidget {
  @override
  _header_drawerState createState() => _header_drawerState();
}

class _header_drawerState extends State<header_drawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 4, 28, 50),
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(
                      "https://w7.pngwing.com/pngs/304/275/png-transparent-user-profile-computer-icons-profile-miscellaneous-logo-monochrome-thumbnail.png")
                  // image: AssetImage('images/eth.png'),
                  ),
            ),
          ),
          Text(
            "ADMIN",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            "admin@gmail.com",
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
