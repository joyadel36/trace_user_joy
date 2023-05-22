import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'finish.dart';

bool enable = false;

double distance = 0;
//alert dialog
Future<bool?> showdialogwhenpop(context) async
{
  return showDialog(context:context,builder: (context)=>AlertDialog(
      icon: Icon(Icons.warning_amber,color: Colors.yellow,size: 30,),
      content: Text("Do you want to leave ?",textAlign: TextAlign.center,),
      elevation:5,
      actions:[
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
          InkWell(onTap: (){
            return Navigator.pop(context,false);
          },
            child: Text("Continue",style: TextStyle(color: Colors.blue),),),

          InkWell(onTap: (){
            enable=false;
            distance=0;
            return Navigator.pop(context,true);
          },
            child: Text("Leave",style: TextStyle(color: Colors.red),),),
        ],)

      ],
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30))),


  ),
  );
}
//draw route function
drawroute(List<GeoPoint> route, controller) async {
  if (route.length == 0 || route.first == route.last) {
    debugPrint("can't draw the same point ");
  } else {
    await controller.drawRoadManually(
        route,
        RoadOption(
          roadWidth: 10,
          roadColor: Colors.lightBlueAccent,
          roadBorderWidth: 5,
          roadBorderColor: Colors.indigo[900],
          zoomInto: true,
        ));
  }
}

//zoom button
InkWell zoom_button(String zoom, MapController controller) {
  return InkWell(
    onTap: () async {
      if (zoom == "min") {
        await controller.zoomOut();
      } else {
        await controller.zoomIn();
      }
    },
    child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 50,
        decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.8),
            border: Border.all(color: Colors.grey, width: 1),
            shape: BoxShape.circle),
        child: (zoom == "min")
            ? const Icon(
                Icons.horizontal_rule,
                color: Colors.white,
              )
            : const Icon(
                Icons.add,
                color: Colors.white,
              )),
  );
}

ListView showlistview(BuildContext context, List<String> options,
    List<GeoPoint> route, MapController controller) {
  return ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 10),
      scrollDirection: Axis.horizontal,
      itemCount: options.length,
      itemBuilder: (context, index) =>
          items_container(index, options, route, controller, context));
}

InkWell items_container(int index, List<String> options, List<GeoPoint> route,
    MapController controller, BuildContext context) {
  return InkWell(
    onTap: () async {
      if (index == 0) {
        debugPrint("get location");
        await controller.currentLocation();
      } else if (index == 1) {
        enable = true;
        await controller.currentLocation();
        await controller.enableTracking();
        debugPrint("${route}");
      } else if (index == 2) {
        await controller.disabledTracking();
        route.clear();
        enable = false;
        debugPrint("${distance}");
        debugPrint("${route}");
      }else if (index == 3) {
        await controller.clearAllRoads();
      } else {
        enable = false;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Finish()));

      }
    },
    child: Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      width: 100,
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.7),
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        "${options[index]} ",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 10),
      ),
    ),
  );
}
