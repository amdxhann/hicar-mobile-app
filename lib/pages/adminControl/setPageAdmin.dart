import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/users/auth.dart';
import '../../routes/routes_name.dart';
import 'entity/User/userList.dart';
import 'entity/cars/cars.dart';
import 'setPageAdmin.dart';
import 'dashboard.dart';
import 'header_drawer.dart';

class adminControl extends StatefulWidget {
  @override
  _adminControlState createState() => _adminControlState();
}

class _adminControlState extends State<adminControl> {
  var currentPage = DrawerSections.cars;
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = dashboard();
    } else if (currentPage == DrawerSections.users) {
      container = Users();
    } else if (currentPage == DrawerSections.cars) {
      container = Cars();
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // leadingWidth: 20,
        toolbarHeight: 90,
        backgroundColor: Color.fromARGB(255, 4, 28, 50),
        title: Text(
          "Hicar",
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                header_drawer(),
                MyDrawerList(),
                ActionChip(
                    label: Text("Logout"),
                    onPressed: () {
                      authC.logout(context);
                      Get.toNamed(RouteName.loginScreen);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Users", Icons.people_alt_outlined,
              currentPage == DrawerSections.users ? true : false),
          menuItem(3, "Cars", Icons.event,
              currentPage == DrawerSections.cars ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.users;
            } else if (id == 3) {
              currentPage = DrawerSections.cars;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  cars,
  users,
}
