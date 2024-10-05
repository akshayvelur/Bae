
import 'dart:developer';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

locationEnable()async{
          
  Location location= await new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranded;
  LocationData _locationData;
  _serviceEnabled=await location.serviceEnabled();
  if(!_serviceEnabled){
    _serviceEnabled=await location.requestService();
  }if(!_serviceEnabled){
    return;
  }
  _permissionGranded=await location.hasPermission();
  if(_permissionGranded==PermissionStatus.denied){
    _permissionGranded= await location.requestPermission();
  }if(_permissionGranded!=PermissionStatus.granted){
    return;
  }
  _locationData=await location.getLocation();
  print("mylocation>>>>>>>>>>>>>>?${_locationData}");
  Map<String,String>loc={};
  loc['latitude'] =_locationData.latitude.toString();
  loc['longitude']=_locationData.longitude.toString();
  return loc;
}

// location checking
locationEnableOrNot()async{
     
  Location location= await new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranded;
  LocationData _locationData;
  _serviceEnabled=await location.serviceEnabled();
  if(!_serviceEnabled){
    log("request enabled");
    _serviceEnabled=await location.requestService();
  }if(!_serviceEnabled){
    return;
  }
  _permissionGranded=await location.hasPermission();
  if(_permissionGranded==PermissionStatus.denied){
    log("=PermissionStatus.denied");
    _permissionGranded= await location.requestPermission();
  }if(_permissionGranded!=PermissionStatus.granted){
    log("=PermissionStatus.grander");
    return;
  }
  _locationData=await location.getLocation();
  print("mylocation>>>>>>>>>>>>>>?${_locationData}");
  return _locationData;
  
} 


//shared preff

 locationToSharedPref({required String longitude,required String latitude})async{
  try{
SharedPreferences pref=await SharedPreferences.getInstance();
pref.setString("longitude",longitude);
pref.setString("latitude", latitude);
  }catch(e){
    log("location shared preff error:${e}");
  }
    }


//      print("hii");
//  Location location= await new Location();
//   bool _serviceEnabled;
//   PermissionStatus _permissionGranded;
//   LocationData _locationData;
//   _serviceEnabled=await location.serviceEnabled();
//   if(!_serviceEnabled){
//     _serviceEnabled=await location.requestService();
//   }if(!_serviceEnabled){
    
//     return;
//   }
//   _permissionGranded=await location.hasPermission();
//   if(_permissionGranded==PermissionStatus.denied){
//     log("not enabled");
//     return false;
//   //  _permissionGranded= await location.requestPermission();
//   }if(_permissionGranded!=PermissionStatus.grantedLimited){
//        log("enabled");
//     return true;
//   } 
//   // else{
//   //   return false;
//   // }
    