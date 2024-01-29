import 'package:flutter/material.dart';
import 'package:get/get.dart';

class aboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 40,
              ),
            ),
            centerTitle: true,
            pinned: true,
            toolbarHeight: 90,
            automaticallyImplyLeading: false,
            // centerTitle: true,
            title: Text(
              "About Us",
              style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              height: 250,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topRight,
                      colors: [Color.fromARGB(255, 4, 28, 50), Colors.white])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                      child: Image.asset(
                    'images/asraf.jpeg',
                    width: 300,
                    height: 150,
                  )),
                  Text(
                    "ASRAF AYYASI PUTRA",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "082111633032",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Container(
              height: 250,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topRight,
                      colors: [Color.fromARGB(255, 4, 28, 50), Colors.white])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                      child: Image.asset(
                    'images/rayhan.jpeg',
                    width: 300,
                    height: 150,
                  )),
                  Text(
                    "AHMAD RAYHAN",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "082111633084",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }
}
