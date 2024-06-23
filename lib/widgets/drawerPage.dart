import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike_shop/main.dart';
import 'package:nike_shop/pages/commuPage.dart';
import 'package:nike_shop/pages/massagePage.dart';

class drawerPage extends StatefulWidget {
  const drawerPage({super.key});

  @override
  State<drawerPage> createState() => _drawerPageState();
}

class _drawerPageState extends State<drawerPage> {
  TextStyle thaiFont = GoogleFonts.kanit();

  String pageName = "หน้าแรก";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration:
                BoxDecoration(color: const Color.fromARGB(255, 255, 255, 255)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 40,
                  child: Icon(
                    Icons.people,
                    size: 35,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  fullName,
                  style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('หน้าแรก', style: thaiFont),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('เลือกซื้อ', style: thaiFont),
            onTap: () {
              Navigator.pushNamed(context, '/buyPage');
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_month),
            title: Text('กิจกรรม', style: thaiFont),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.gif_box),
            title: Text('คำสั่งซื้อ', style: thaiFont),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.heart_broken),
            title: Text('รายการโปรด', style: thaiFont),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.mail),
            trailing: CircleAvatar(
              radius: 13,
              backgroundColor: Colors.black,
              child: Text(
                "9+",
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text('กล่องข้อความ', style: thaiFont),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => massagePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('การตั้งค่า', style: thaiFont),
            onTap: () {},
          ),
          ListTile(
              leading: Icon(Icons.chat),
              title: Text(
                "ชุมชน",
                style: thaiFont,
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => commuPage()))),
        ],
      ),
    );
  }
}
