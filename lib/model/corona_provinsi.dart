import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class CoronaProvinsi {
  String provinsi;
  double positif;
  double sembuh;
  double meninggal;
  double latitude;
  double longitude;
  String logo;

  CoronaProvinsi({
    @required this.provinsi,
    @required this.positif,
    @required this.sembuh,
    @required this.meninggal,
    @required this.latitude,
    @required this.longitude,
    @required this.logo,
  });
}

var dataProvinsi = [
  CoronaProvinsi(
      provinsi: "Aceh",
      positif: 10814,
      sembuh: 9367,
      meninggal: 432,
      latitude: 4.225081892093782,
      longitude: 96.90952274776174,
      logo:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Coat_of_arms_of_Aceh.svg/1200px-Coat_of_arms_of_Aceh.svg.png"),
  CoronaProvinsi(
      provinsi: "Sumatera Utara",
      positif: 29198,
      sembuh: 25952,
      meninggal: 965,
      latitude: 2.1847792149105123,
      longitude: 99.05788784892918,
      logo:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Coat_of_arms_of_North_Sumatra.svg/1200px-Coat_of_arms_of_North_Sumatra.svg.png"),
  CoronaProvinsi(
      provinsi: "Sumatera Barat",
      positif: 36268,
      sembuh: 33058,
      meninggal: 783,
      latitude: -0.8519143477257053,
      longitude: 100.46680503029917,
      logo:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Coat_of_arms_of_West_Sumatra.svg/1200px-Coat_of_arms_of_West_Sumatra.svg.png"),
  CoronaProvinsi(
      provinsi: "Riau",
      positif: 42698,
      sembuh: 37374,
      meninggal: 1050,
      latitude: 0.5105258491811052,
      longitude: 101.81289195391142,
      logo:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Coat_of_arms_of_Riau.svg/1200px-Coat_of_arms_of_Riau.svg.png"),
  CoronaProvinsi(
      provinsi: "Jambi",
      positif: 7407,
      sembuh: 5987,
      meninggal: 108,
      latitude: -1.6177499996423312,
      longitude: 103.59931999973587,
      logo:
          "http://jambiprov.go.id/jambiprov-zxcvbnm/editor/gambar/Image/Logo%20Provinsi%20Jambi%20-%20[agus91]%20(1).png"),
  CoronaProvinsi(
      provinsi: "Sumatera Selatan",
      positif: 20068,
      sembuh: 17712,
      meninggal: 979,
      latitude: -3.213346821849744,
      longitude: 104.17041944464856,
      logo:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Coat_of_arms_of_South_Sumatra.svg/1200px-Coat_of_arms_of_South_Sumatra.svg.png"),
  CoronaProvinsi(
    provinsi: "Bengkulu",
    positif: 6630,
    sembuh: 5743,
    meninggal: 172,
    latitude: -3.7911599999922694,
    longitude: 102.26311999971767,
    logo:
        "https://upload.wikimedia.org/wikipedia/commons/7/7d/Coat_of_arms_of_Bengkulu.png",
  ),
  CoronaProvinsi(
    provinsi: "Bangka Belitung",
    positif: 12822,
    sembuh: 11272,
    meninggal: 201,
    latitude: -2.2529564111524327,
    longitude: 105.98694808180811,
    logo:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Coat_of_arms_of_Bangka_Belitung_Islands.svg/1200px-Coat_of_arms_of_Bangka_Belitung_Islands.svg.png",
  ),
  CoronaProvinsi(
    provinsi: "Lampung",
    positif: 10838,
    sembuh: 9581,
    meninggal: 253,
    latitude: -4.918073087438925,
    longitude: 105.01831305094686,
    logo:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Coat_of_arms_of_Lampung.svg/1200px-Coat_of_arms_of_Lampung.svg.png",
  ),
  CoronaProvinsi(
    provinsi: "Kepulauan Riau",
    positif: 9381,
    sembuh: 8801,
    meninggal: 230,
    latitude: 3.9159472411462137,
    longitude: 108.20222888881389,
    logo:
        "http://3.bp.blogspot.com/-n0DywO58iAU/U_gtLPlj-NI/AAAAAAAAAUE/MQCm9cmOWhE/s1600/logo%2Bprovisi%2Bkepri.png",
  ),
  CoronaProvinsi(
    provinsi: "DKI Jakarta",
    positif: 406205,
    sembuh: 393166,
    meninggal: 6625,
    latitude: -6.171480000380943,
    longitude: 106.82648999970596,
    logo:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Coat_of_arms_of_Jakarta.svg/1200px-Coat_of_arms_of_Jakarta.svg.png",
  ),
  CoronaProvinsi(
    provinsi: "Jawa Barat",
    positif: 277553,
    sembuh: 243650,
    meninggal: 3678,
    latitude: -6.919980215676874,
    longitude: 107.60280789771438,
    logo:
        "https://upload.wikimedia.org/wikipedia/commons/0/07/West_Java_coa.png",
  ),
  CoronaProvinsi(
    provinsi: "Jawa Tengah",
    positif: 183027,
    sembuh: 162823,
    meninggal: 8001,
    latitude: -7.258970382933987,
    longitude: 110.20111252917499,
    logo:
        "https://infojateng.id/wp-content/uploads/2020/09/441-4415833_logo-jawa-tengah-png-lambang-daerah-jawa-tengah.png",
  ),
  CoronaProvinsi(
    provinsi: "Daerah Istimewa Yogyakarta",
    positif: 38703,
    sembuh: 33636,
    meninggal: 948,
    latitude: -7.895013815160975,
    longitude: 110.44536697110821,
    logo:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Coat_of_arms_of_Yogyakarta.svg/1200px-Coat_of_arms_of_Yogyakarta.svg.png",
  ),
  CoronaProvinsi(
    provinsi: "Jawa Timur",
    positif: 146808,
    sembuh: 134525,
    meninggal: 10600,
    latitude: -7.720113018739566,
    longitude: 112.73367880118164,
    logo:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Coat_of_arms_of_East_Java.svg/220px-Coat_of_arms_of_East_Java.svg.png",
  ),
  CoronaProvinsi(
    provinsi: "Banten",
    positif: 47101,
    sembuh: 43892,
    meninggal: 1200,
    latitude: -6.456181598923129,
    longitude: 106.10919706896232,
    logo:
        "https://bantenprov.go.id/uploads/images/c08b0859e4a37d885196f79cddc8880951d87500.png",
  ),
];

String formatter(double number) {
  var format = NumberFormat('#,###,000');
  var result = format.format(number);
  return result.toString();
}
