import 'package:corona_media/chat_screen.dart';
import 'package:corona_media/model/corona_provinsi.dart';
import 'package:corona_media/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pie_chart/pie_chart.dart';

import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Data Corona di Indonesia'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.chat,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ChatScreen()));
            },
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ProfileScreen()));
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return _ListLayout();
          } else if (constraints.maxWidth <= 900) {
            return _GridLayout(
              gridCount: 4,
            );
          } else {
            return _GridLayout(
              gridCount: 6,
            );
          }
        },
      ),
    );
  }
}

class _GridLayout extends StatelessWidget {
  final int gridCount;

  const _GridLayout({Key key, @required this.gridCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: ListView(
        children: [
          Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 550,
                        child: _IndonesiaWidget(),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Text(
                    "Provinsi",
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Flexible(
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 0.5),
                  borderRadius: BorderRadius.all(Radius.circular(14.0)),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.only(left: 14.0),
                        child: TextField(
                          style: TextStyle(fontSize: 15.0),
                          decoration: InputDecoration.collapsed(
                            hintText: 'Cari Provinsi',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    Material(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        child: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () => {},
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: gridCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: dataProvinsi.asMap().entries.map((entry) {
                  int index = entry.key;
                  CoronaProvinsi coronaProvinsi = entry.value;
                  return Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => DetailScreen(
                                      coronaProvinsi: coronaProvinsi,
                                      index: index,
                                    )));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Flexible(
                            child: Hero(
                              tag: 'logo$index',
                              child: Image.network(
                                coronaProvinsi.logo,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              coronaProvinsi.provinsi,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, bottom: 8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add_circle,
                                  color: Colors.red,
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  formatter(coronaProvinsi.positif),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ListLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: ListView(
        children: [
          Column(
            children: <Widget>[
              _IndonesiaWidget(),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Text(
                    "Provinsi",
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Flexible(
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 0.5),
                  borderRadius: BorderRadius.all(Radius.circular(14.0)),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.only(left: 14.0),
                        child: TextField(
                          style: TextStyle(fontSize: 15.0),
                          decoration: InputDecoration.collapsed(
                            hintText: 'Cari Provinsi',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    Material(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        child: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () => {},
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: dataProvinsi.length,
                itemBuilder: (BuildContext context, int index) {
                  final CoronaProvinsi coronaProvinsi = dataProvinsi[index];
                  return Container(
                    height: 100,
                    child: Card(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      DetailScreen(
                                        coronaProvinsi: coronaProvinsi,
                                        index: index,
                                      )));
                        },
                        child: Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Hero(
                                    tag: "logo$index",
                                    child: Image.network(
                                      coronaProvinsi.logo,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      coronaProvinsi.provinsi,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.add_circle,
                                          color: Colors.red,
                                          size: 16,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          formatter(coronaProvinsi.positif),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _IndonesiaWidget extends StatelessWidget {
  final Map<String, double> dataMap = {
    "Positif": 1791221,
    "Negatif": 1645263,
  };

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Indonesia",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 165,
                      child: Row(
                        children: [
                          Icon(
                            Icons.add_circle,
                            color: Colors.red,
                            size: 20,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("Positif"),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "1,791,221",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 165,
                      child: Row(
                        children: [
                          Icon(
                            Icons.remove_circle,
                            color: Colors.green,
                            size: 20,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("Negatif"),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "1,645,263",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 165,
                      child: Row(
                        children: [
                          Icon(
                            Icons.dangerous,
                            color: Colors.black,
                            size: 20,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("Meniggal"),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "49,771",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 165,
                      child: Row(
                        children: [
                          Icon(
                            Icons.medical_services,
                            color: Colors.orange,
                            size: 20,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("Dirawat"),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "96,187",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 24,
                ),
                Container(
                  height: 120,
                  child: PieChart(
                    dataMap: dataMap,
                    showChartValuesOutside: false,
                    animationDuration: Duration(milliseconds: 800),
                    chartLegendSpacing: 32,
                    chartRadius: 120,
                    colorList: [
                      Colors.red,
                      Colors.green,
                    ],
                    showLegends: false,
                    chartValueStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
