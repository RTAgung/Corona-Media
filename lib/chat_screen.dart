import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Konsultasi"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.video_call),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Flexible(
            child: Container(
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            'Selamat siang pak dokter, saya ingin konsultasi',
                          ),
                          padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                          width: 200.0,
                          decoration: BoxDecoration(
                            color: Colors.green.shade100,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          margin: EdgeInsets.only(right: 10.0),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.end,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "13:20",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          margin: EdgeInsets.all(5.0),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            'Baik, bagaimana?',
                          ),
                          padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                          width: 200.0,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          margin: EdgeInsets.only(left: 10.0),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "13:21",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          margin: EdgeInsets.all(5.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 0.5,
                color: Colors.green.shade700,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Material(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 1.0),
                        child: IconButton(
                          icon: Icon(Icons.attach_file),
                          onPressed: () => {},
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        child: TextField(
                          style: TextStyle(fontSize: 15.0),
                          decoration: InputDecoration.collapsed(
                            hintText: 'Tulis pesan',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    Material(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        child: IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () => {},
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
                width: double.infinity,
                height: 50.0,
                decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.green, width: 0.5),
                    ),
                    color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
