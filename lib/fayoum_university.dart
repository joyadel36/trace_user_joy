import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:trace_user/my_function&widget.dart';

class Fayoum_univercity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Fayoum_univercity_State();
}

class Fayoum_univercity_State extends State<Fayoum_univercity> {

  //list to save rout
  List<GeoPoint> route = [];

  //init controller
 late MapController controller ;
  @override
  void initState() {
    super.initState();
    controller=MapController(
      initMapWithUserPosition: false,
      initPosition: GeoPoint(latitude: 29.32127, longitude: 30.83571),
      areaLimit: BoundingBox(
          east: 30.82493, north: 29.32408, south: 30.84650, west: 29.31847),
    );
  }
  @override
  void dispose() {
    controller.dispose(); // Dispose of the controller
    super.dispose();
  }
  //list of options
  List<String> options = [
    'Get Location',
    'Start Tracing',
    'Stop Tracing',
    'Remove Route',
    'Finish',
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldpop = await showdialogwhenpop(context);
        return shouldpop!;
      },
      child: Scaffold(
        appBar: AppBar(
          title:const Text(
            "Fayoum University",
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: Stack(
          children: [
            Container(
                child: OSMFlutter(
              controller: controller,
              onLocationChanged: (location) async {
                Timer.periodic(Duration(seconds: 3), (Timer timer) async {
                  if (enable == true) {
                    GeoPoint position = await controller.myLocation();
                    if (route.isEmpty || route[route.length-1]!=position) {
                      debugPrint("\n route length ${route.length}\n");
                      if(route.isNotEmpty)
                      {distance += await distance2point(route[route.length-1],position);
                      debugPrint("${distance}");}
                      route.add(position);
                      if (route.length >= 3) {
                        drawroute(route,controller);
                        if (route.length > 15) {
                          route.removeRange(0, 15);
                        }
                      }

                      debugPrint("${route}");
                    } else {
                      debugPrint("no change");
                    }

                  } else {
                    timer.cancel();
                    debugPrint('timer stop ');
                  }
                });
              },
              initZoom: 17,
              minZoomLevel: 8,
              maxZoomLevel: 19,
              stepZoom: 1.0,
              userLocationMarker: UserLocationMaker(
                personMarker:const MarkerIcon(
                  icon: Icon(
                    Icons.location_history,
                    color: Colors.red,
                    size: 48,
                  ),
                ),
                directionArrowMarker:const MarkerIcon(
                  icon: Icon(
                    Icons.location_searching_outlined,
                    color: Colors.red,
                    size: 48,
                  ),
                ),
              ),
            )),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 60,
                child: showlistview(context, options, route, controller),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      zoom_button("min", controller),
                      SizedBox(
                        width: 10,
                      ),
                      zoom_button("max", controller),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
