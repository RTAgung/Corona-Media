import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:pie_chart/pie_chart.dart';
import "package:latlong/latlong.dart" as latLng;

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jakarta"),
        actions: [
          BookmarkButton(),
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
                "DKI Jakarta",
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
                tag: "logo1",
                child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Coat_of_arms_of_Jakarta.svg/1200px-Coat_of_arms_of_Jakarta.svg.png",
                  height: 150,
                ),
              ),
              SizedBox(
                height: 18,
              ),
              DataDetail(),
              Text(
                "Location",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 12,
              ),
              MapDetail(),
            ],
          ),
        ),
      ),
    );
  }
}

class BookmarkButton extends StatefulWidget {
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
      icon: Icon(isBookmark ? Icons.bookmark : Icons.bookmark_border),
    );
  }
}

class DataDetail extends StatelessWidget {
  final Map<String, double> dataMap = {
    "Positif": 1791221,
    "Negatif": 1645263,
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
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
              SizedBox(
                height: 8,
              ),
              Row(
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
              SizedBox(
                height: 8,
              ),
              Row(
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
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
        Expanded(
          child: PieChart(
            dataMap: dataMap,
            showChartValuesOutside: false,
            animationDuration: Duration(milliseconds: 800),
            chartLegendSpacing: 32,
            chartRadius: MediaQuery.of(context).size.width / 3.2,
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
    );
  }
}

class MapDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: FlutterMap(
        options: MapOptions(
          center: latLng.LatLng(4.225081892093782, 96.90952274776174),
          zoom: 6,
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
                point: latLng.LatLng(4.225081892093782, 96.90952274776174),
                builder: (ctx) => Container(
                  child: Icon(Icons.location_pin),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
