import 'package:corona_media/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pageWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Image.asset(
                    "images/profile.jpg",
                    width: pageWidth,
                    height: pageWidth + 50,
                    fit: BoxFit.cover,
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Color.fromRGBO(0, 0, 0, 0.3),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Material(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Color.fromRGBO(0, 0, 0, 0.3),
                            child: PopupMenuButton<String>(
                              icon: Icon(
                                Icons.more_vert,
                                color: Colors.white,
                              ),
                              onSelected: (value) {
                                switch (value) {
                                  case 'Settings':
                                    break;
                                  case 'Logout':
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            LoginScreen(),
                                      ),
                                      (route) => false,
                                    );
                                    break;
                                }
                              },
                              itemBuilder: (BuildContext context) {
                                return {'Settings', 'Logout'}
                                    .map((String choice) {
                                  return PopupMenuItem<String>(
                                    value: choice,
                                    child: Text(choice),
                                  );
                                }).toList();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: pageWidth + 51,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 50,
                          width: pageWidth,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(32)),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Rama Tri Agung",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "ramatriagung91@gmail.com",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 42),
                child: Column(
                  children: [
                    Card(
                      child: InkWell(
                        onTap: () {
                          Clipboard.setData(
                              ClipboardData(text: "081377879966"));
                          Fluttertoast.showToast(
                              msg: "Copy to Clipboard",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIos: 1,
                              backgroundColor: Color.fromRGBO(0, 0, 0, 0.4),
                              textColor: Colors.white,
                              fontSize: 12.0);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.call,
                                color: Colors.green,
                              ),
                              Flexible(
                                child: Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text("081377879966"),
                                ),
                              ),
                              Icon(
                                Icons.copy,
                                color: Colors.green,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: InkWell(
                        onTap: () {
                          _launchURL("https://goo.gl/maps/vg164HgCe885G1c57");
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_pin,
                                color: Colors.green,
                              ),
                              Flexible(
                                child: Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text("Kota Lubuklinggau"),
                                ),
                              ),
                              Icon(
                                Icons.link,
                                color: Colors.green,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: InkWell(
                        onTap: () {
                          _launchURL("http://upnyk.ac.id/");
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.book_fill,
                                color: Colors.green,
                              ),
                              Flexible(
                                child: Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text("UPN Veteran Yogyakarta"),
                                ),
                              ),
                              Icon(
                                Icons.link,
                                color: Colors.green,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: InkWell(
                        onTap: () {
                          _launchURL("https://www.linkedin.com/in/rtagung/");
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.link,
                                color: Colors.green,
                              ),
                              Flexible(
                                child: Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text("linkedin.com/in/rtagung/"),
                                ),
                              ),
                              Icon(
                                Icons.link,
                                color: Colors.green,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

// PopupMenuButton<String>(
// onSelected: (value) {
// switch (value) {
// case 'Settings':
// break;
// case 'Logout':
// Navigator.pushAndRemoveUntil(
// context,
// MaterialPageRoute(
// builder: (BuildContext context) => LoginScreen(),
// ),
// (route) => false,
// );
// break;
// }
// },
// itemBuilder: (BuildContext context) {
// return {'Settings', 'Logout'}.map((String choice) {
// return PopupMenuItem<String>(
// value: choice,
// child: Text(choice),
// );
// }).toList();
// },
// ),
