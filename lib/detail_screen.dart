import 'package:corona_media/model/corona_provinsi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:pie_chart/pie_chart.dart';
import "package:latlong/latlong.dart" as latLng;

class DetailScreen extends StatelessWidget {
  final CoronaProvinsi coronaProvinsi;
  final int index;

  const DetailScreen(
      {Key key, @required this.coronaProvinsi, @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 610) {
          return _MobileLayout(
            coronaProvinsi: coronaProvinsi,
            index: index,
          );
        } else {
          return _WebLayout(
            coronaProvinsi: coronaProvinsi,
            index: index,
          );
        }
      },
    );
  }
}

class _WebLayout extends StatelessWidget {
  final CoronaProvinsi coronaProvinsi;
  final int index;

  const _WebLayout(
      {Key key, @required this.coronaProvinsi, @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 600,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back_rounded,
                              color: Colors.green,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          BookmarkButton(
                            isWeb: true,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Card(
                        elevation: 8,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Hero(
                                tag: "logo$index",
                                child: Image.network(
                                  coronaProvinsi.logo,
                                  height: 150,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    coronaProvinsi.provinsi,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  DataDetail(
                                    sembuh: coronaProvinsi.sembuh,
                                    meninggal: coronaProvinsi.meninggal,
                                    positif: coronaProvinsi.positif,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Location",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      MapDetail(
                        lat: coronaProvinsi.latitude,
                        long: coronaProvinsi.longitude,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MobileLayout extends StatelessWidget {
  final CoronaProvinsi coronaProvinsi;
  final int index;

  const _MobileLayout(
      {Key key, @required this.coronaProvinsi, @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coronaProvinsi.provinsi),
        actions: [
          BookmarkButton(
            isWeb: false,
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                coronaProvinsi.provinsi,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Hero(
                tag: "logo$index",
                child: Image.network(
                  coronaProvinsi.logo,
                  height: 150,
                ),
              ),
              SizedBox(
                height: 18,
              ),
              DataDetail(
                sembuh: coronaProvinsi.sembuh,
                meninggal: coronaProvinsi.meninggal,
                positif: coronaProvinsi.positif,
              ),
              Text(
                "Location",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 12,
              ),
              MapDetail(
                lat: coronaProvinsi.latitude,
                long: coronaProvinsi.longitude,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookmarkButton extends StatefulWidget {
  final bool isWeb;

  const BookmarkButton({Key key, @required this.isWeb}) : super(key: key);

  @override
  _BookmarkButtonState createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  bool isBookmark = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isBookmark = !isBookmark;
        });
      },
      icon: Icon(
        isBookmark ? Icons.bookmark : Icons.bookmark_border,
        color: widget.isWeb ? Colors.green : Colors.white,
      ),
    );
  }
}

class DataDetail extends StatelessWidget {
  final double sembuh;
  final double meninggal;
  final double positif;

  const DataDetail(
      {Key key,
      @required this.sembuh,
      @required this.meninggal,
      @required this.positif})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, double> dataMap = {
      "Sembuh": sembuh,
      "Meninggal": meninggal,
    };

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 155,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                        formatter(positif),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  width: 155,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.add_box,
                        color: Colors.green,
                        size: 20,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text("Sembuh"),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        formatter(sembuh),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  width: 155,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                        formatter(meninggal),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: PieChart(
                    dataMap: dataMap,
                    showChartValuesOutside: false,
                    animationDuration: Duration(milliseconds: 800),
                    chartLegendSpacing: 32,
                    chartRadius: 100,
                    colorList: [
                      Colors.green,
                      Colors.black,
                    ],
                    showLegends: false,
                    chartValueStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MapDetail extends StatelessWidget {
  final double lat;
  final double long;

  const MapDetail({Key key, @required this.lat, @required this.long})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: FlutterMap(
        options: MapOptions(
          center: latLng.LatLng(lat, long),
          zoom: 7,
        ),
        layers: [
          TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 10.0,
                height: 10.0,
                point: latLng.LatLng(lat, long),
                builder: (ctx) => Container(
                  child: Icon(
                    Icons.location_pin,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
