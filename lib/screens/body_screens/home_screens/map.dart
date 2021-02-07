import 'dart:async';
import 'package:bible_bot/models/style_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';


class Map extends StatefulWidget {
  @override
  MapState createState() => MapState();
}

class MapState extends State<Map> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }
  double zoomVal=10.0;
  @override

  Widget build(BuildContext context) {
    StyleModel styleModel=Provider.of<StyleModel>(context);
    return Scaffold(
      backgroundColor: styleModel.getBackgroundColor()['backgroundColorLevel1'],
      appBar: AppBar(
        elevation: 1,
        iconTheme: IconThemeData(
            color: styleModel.getBackgroundColor()['reversalColorLevel1']),
        backgroundColor:
        styleModel.getBackgroundColor()['backgroundColorLevel1'],
        title: Text(
          '제휴업체 ',
          style: styleModel.getTextStyle()['appBarTextStyle'],
        ),
      ),
      body:Column(
        children: <Widget>[
          Flexible(
            flex: 1,
          child: Center(
            child: Text('업데이트 예정입니다 :)',style: styleModel.getTextStyle()['appBarTextStyle'],),
          ),),
          Flexible(
            flex: 16,child: Stack(
            children: <Widget>[
              _buildGoogleMap(context),
              _zoomminusfunction(),
              _zoomplusfunction(),
              //_buildContainer(),
            ],
          ),),
        ],
      ),
      
    );
  }
  Widget _zoomminusfunction() {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          icon: Icon(Icons.expand_more,color:Color(0xff6200ee)),
          onPressed: () {
            zoomVal--;
            _minus( zoomVal);
          }),
    );
  }
  Widget _zoomplusfunction() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: Icon(Icons.expand_less,color:Color(0xff6200ee)),
          onPressed: () {
            zoomVal++;
            _plus(zoomVal);
          }),
    );
  }
  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(37.64871447942806, 127.06436281430499), zoom: zoomVal)));
  }
  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(37.64871447942806, 127.06436281430499), zoom: zoomVal)));
  }


  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                 'https://lh5.googleusercontent.com/p/AF1QipNopffaAfF7r1uYKiDWyTUf16FPOwJ3TTmOJ6Ou=w408-h306-k-no', 37.65078009057755, 127.06205199833731
                  ,"국시집(시장풍경)"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipNa5fnaH0U3_dOReY2stJ5beeIas8rW7CzRmplN=w408-h306-k-no",
                  37.65017499904077, 127.06218171139746
                  ,"밀알 생돈까스"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipOtHBl7SK7ab-gdTG5GHRkIQDOT5Q8gM-PgcCD2=w426-h240-k-no",
                  37.65007633934943, 127.06125358321037
                  ,"우거지 품은 순대국"),
            ),
            SizedBox(width: 10.0),
            Padding(padding: const EdgeInsets.all(8.0),
              child:_boxes("https://lh5.googleusercontent.com/p/AF1QipPKQtr1KB6-Bt2cieeCZmeoO80AqMpaOSgtl7t3=w156-h96-p-k-no", 37.65010347859033, 127.06188964982374
                  , "하이포크 "),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat,double long,String restaurantName) {
    return  GestureDetector(
      onTap: () {
        _gotoLocation(lat,long);
      },
      child:Container(
        child: new FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(_image),
                      ),
                    ),),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myDetailsContainer1(restaurantName),
                    ),
                  ),
                ],),
          ),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String restaurantName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(restaurantName,
                style: TextStyle(
                    color: Color(0xff6200ee),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              )),
        ),
        SizedBox(height:5.0),
        Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    child: Text(
                      "4.1",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18.0,
                      ),
                    )),
                Container(
                  child: Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                    child: Text(
                      "(946)",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18.0,
                      ),
                    )),
              ],
            )),
        SizedBox(height:5.0),
        Container(
            child: Text(
              "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
        SizedBox(height:5.0),
        Container(
            child: Text(
              "Closed \u00B7 Opens 17:00 Thu",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:  CameraPosition(target: LatLng(37.64871447942806, 127.06436281430499), zoom: 16.2),//37.64871447942806, 127.06436281430499
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          KBUMarker,GuGkMarker,MatMarker,MuMarker,noone1Marker,noone2Marker,noone3Marker,noone4Marker,noone5Marker,noone6Marker
          ,noone7Marker,noone8Marker,noone9Marker,noone10Marker
        },
      ),
    );
  }
  Future<void> _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 20,tilt: 50.0,
      bearing: 45.0,)));
  }
}

Marker KBUMarker=Marker(
  markerId: MarkerId('한국성서대'),
  position: LatLng(37.64871447942806,127.06436281430499),
  infoWindow: InfoWindow(title:'한국성서대'),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
);

Marker GuGkMarker = Marker(
  markerId: MarkerId('국시집(시장풍경)'),
  position: LatLng(37.65078009057755, 127.06205199833731),
  infoWindow: InfoWindow(title: '국시집(시장풍경)'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker MatMarker = Marker(
  markerId: MarkerId('맷돌 순두부'),
  position: LatLng(37.649511187086, 127.06232741281177),
  infoWindow: InfoWindow(title: '맷돌 순두부'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker MuMarker = Marker(
  markerId: MarkerId('명동칼국수'),
  position: LatLng(37.64901083170704, 127.06199876741636),
  infoWindow: InfoWindow(title: '명동칼국수'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker noone1Marker = Marker(
  markerId: MarkerId('미쳐버린파닭'),
  position: LatLng(37.66174648303247, 127.06663869713246),
  infoWindow: InfoWindow(title: '미쳐버린파닭'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker noone2Marker = Marker(
  markerId: MarkerId('밀알 생돈까스'),
  position: LatLng(37.65017499904077, 127.06218171139746),
  infoWindow: InfoWindow(title: '밀알 생돈까스'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker noone3Marker = Marker(
  markerId: MarkerId('베스킨라빈스 '),
  position: LatLng(37.64865446006624, 127.06201908440859),
  infoWindow: InfoWindow(title: '베스킨라빈스 '),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker noone4Marker = Marker(
  markerId: MarkerId('수유리우동'),
  position: LatLng(37.650430880416, 127.06153101110037
  ),
  infoWindow: InfoWindow(title: '수유리우동'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker noone5Marker = Marker(
  markerId: MarkerId('신화쭈꾸미'),
  position: LatLng(37.64973867755217, 127.06070576722144
  ),
  infoWindow: InfoWindow(title: '신화쭈꾸미'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker noone6Marker = Marker(
  markerId: MarkerId('와플대학'),
  position: LatLng( 37.65346081954191, 127.06050169876909),
  infoWindow: InfoWindow(title: '와플대학'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker noone7Marker = Marker(
  markerId: MarkerId('우거지 품은 순대국'),
  position: LatLng(37.65007633934943, 127.06125358321037
  ),
  infoWindow: InfoWindow(title: '우거지 품은 순대국'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker noone8Marker = Marker(
  markerId: MarkerId('피자팩트'),
  position: LatLng(37.657299391758215, 127.06985575508864),
  infoWindow: InfoWindow(title: '피자팩트'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker noone9Marker = Marker(
  markerId: MarkerId('하이포크'),
  position: LatLng(37.65010347859033,127.06188964982374
  ),
  infoWindow: InfoWindow(title: '하이포크'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker noone10Marker = Marker(
  markerId: MarkerId('호밀호두 '),
  position: LatLng(37.649660489291676, 127.06217035372705),
  infoWindow: InfoWindow(title: '호밀호두 '),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
