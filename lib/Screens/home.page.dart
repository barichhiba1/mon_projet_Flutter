import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Home Page",
          style: TextStyle(color: Colors.white, fontSize: 40),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                children: [
                  CircleAvatar(
                      backgroundImage: AssetImage("image/avatar.png"),
                      radius: 30),
                  Text(
                    "Hiba Barich",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text("Hiba.Barich@emsi.ma",
                      style: TextStyle(fontSize: 20, color: Colors.white))
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.deepOrange),
              title: Text("Covid Tracker"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.chat, color: Colors.deepOrange),
              title: Text("Emsi chatbot"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle, color: Colors.deepOrange),
              title: Text("Profile"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.deepOrange),
              title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.deepOrange),
              title: Text("Logout"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
          child: Text(
        textAlign: TextAlign.center,
        "welcome to the home page ",
        style: TextStyle(color: Colors.blueGrey, fontSize: 50),
      )),
    );
  }
}
