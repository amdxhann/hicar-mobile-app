import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentcar/routes/routes_name.dart';
import '../controllers/users/auth.dart';
import '../controllers/users/editUser.dart';

class Homepage extends StatelessWidget {
  static const nameroute = '/HomePage';
  final authC = Get.find<AuthController>();
  final editUserC = Get.put(editUserController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    final editUserC = Get.find<editUserController>();
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          toolbarHeight: 90,
          leading: Container(),
          centerTitle: true,
          title: Text(
            "HiCar",
            style: TextStyle(
                fontSize: 35,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold),
          ),
          actions: [
            Container(
              margin: EdgeInsets.all(5),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person,
                    size: 40.0,
                  )),
            ),
          ],
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            // color: Colors.white,
            child: CarouselSlider(
              options: CarouselOptions(
                // scrollDirection: Axis.vertical,
                height: 200.0,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(seconds: 1),
                initialPage: 3,
                viewportFraction: 0.8,
                enlargeCenterPage: true,
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(),
                        child: Image.asset(
                          "images/$i.jpeg",
                          fit: BoxFit.cover,
                        ));
                  },
                );
              }).toList(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                50,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: new InputDecoration.collapsed(
                          hintText: 'Search for car name'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 20,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: Image.asset(
                        'images/search.png',
                        height: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular Cars",
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                    onPressed: () {
                      Get.toNamed(RouteName.explore);
                    },
                    child: Text("More cars >>",
                        style: TextStyle(color: Colors.white)))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            // color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10, right: 10, left: 10),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 150,
                              height: 100,
                              child: Image.asset(
                                "images/3.jpeg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "BMW Mayuko",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10, right: 10, left: 10),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 150,
                              height: 100,
                              child: Image.asset(
                                "images/2.jpeg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "BMW Mayuko",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular Brands",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10, right: 10, left: 10),
            height: 175,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 6, 70, 99),
                            borderRadius: BorderRadius.circular(25)),
                        padding: EdgeInsetsDirectional.all(5.0),
                        height: 150,
                        child: Column(
                          children: [
                            Image.asset(
                              'images/maserati.png',
                              height: 100,
                              width: 100,
                            ),
                            Text(
                              "Maserati",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Mulish', color: Colors.white),
                            ),
                            Text("+5",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Mulish',
                                    color: Color.fromARGB(255, 0, 123, 255)))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 6, 70, 99),
                            borderRadius: BorderRadius.circular(25)),
                        padding: EdgeInsetsDirectional.all(5.0),
                        height: 150,
                        child: Column(
                          children: [
                            Image.asset(
                              'images/bmw.png',
                              height: 100,
                              width: 100,
                            ),
                            Text(
                              "Maserati ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Mulish', color: Colors.white),
                            ),
                            Text("+5",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Mulish',
                                    color: Color.fromARGB(255, 0, 123, 255)))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 6, 70, 99),
                            borderRadius: BorderRadius.circular(25)),
                        padding: EdgeInsetsDirectional.all(5.0),
                        height: 150,
                        child: Column(
                          children: [
                            Image.asset(
                              'images/marcedes.png',
                              height: 100,
                              width: 100,
                            ),
                            Text(
                              "Maserati ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Mulish', color: Colors.white),
                            ),
                            Text("+5",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Mulish',
                                    color: Color.fromARGB(255, 0, 123, 255)))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 6, 70, 99),
                            borderRadius: BorderRadius.circular(25)),
                        padding: EdgeInsetsDirectional.all(5.0),
                        height: 150,
                        child: Column(
                          children: [
                            Image.asset(
                              'images/porsce.png',
                              height: 100,
                              width: 100,
                            ),
                            Text(
                              "Maserati ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Mulish', color: Colors.white),
                            ),
                            Text("+5",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Mulish',
                                    color: Color.fromARGB(255, 0, 123, 255)))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 6, 70, 99),
                            borderRadius: BorderRadius.circular(25)),
                        padding: EdgeInsetsDirectional.all(5.0),
                        height: 150,
                        child: Column(
                          children: [
                            Image.asset(
                              'images/tog.png',
                              height: 100,
                              width: 100,
                            ),
                            Text(
                              "Maserati ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Mulish', color: Colors.white),
                            ),
                            Text("+5",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Mulish',
                                    color: Color.fromARGB(255, 0, 123, 255)))
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ]))
      ],
    );
  }
}
