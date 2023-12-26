import 'package:flutter/material.dart';
  import 'package:google_maps_flutter/google_maps_flutter.dart';
  import 'package:geolocator/geolocator.dart';

  class LocationFetcherApp extends StatefulWidget {
  @override
  _LocationFetcherAppState createState() => _LocationFetcherAppState();
  }

  class _LocationFetcherAppState extends State<LocationFetcherApp> {
  String _locationMessage = '';
  String currentLocation='';
  _LocationFetcherAppState() : currentLocation = 'Initializing...';

  @override
  void initState() {
    super.initState();
    _fetchLocation();
  }


  late Position position;
  void _getCurrentLocation() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
           currentLocation ="Permission Denied";
        });
      }else{
        var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        setState(() {
          currentLocation ="latitude: ${position.latitude}" + " , " + "Logitude: ${position.longitude}";
        });
      }
    }else{
      var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      setState(() {
        var currentLocation ="latitude: ${position.latitude}" + " , " + "Logitude: ${position.longitude}";
      });
    }
  }
  Future<void> _fetchLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _locationMessage =
        'Latitude: ${position.latitude}\nLongitude: ${position.longitude}';
      });
    } catch (e) {
      setState(() {
        _locationMessage = 'Error fetching location: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title:const Text('DELIVERY STATUS',style:TextStyle(color: Colors.black)),
        backgroundColor: Colors.yellow.shade600,
         ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                      color: Colors.teal[50]
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.location_on),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Location',
                                ),
                                Text(currentLocation),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );

  }
}