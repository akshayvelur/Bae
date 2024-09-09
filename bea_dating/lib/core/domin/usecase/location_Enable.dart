import 'package:location/location.dart';

locationEnable()async{
          
  Location location= new Location();
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
  return _locationData;
}