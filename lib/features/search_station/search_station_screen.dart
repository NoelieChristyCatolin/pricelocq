import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchStationScreen extends StatefulWidget {
  const SearchStationScreen({Key? key}) : super(key: key);

  @override
  State<SearchStationScreen> createState() => _SearchStationScreenState();
}

class _SearchStationScreenState extends State<SearchStationScreen> {

  late GoogleMapController _controller;
  late Position _position;
  //todo: Fix initial position
  late CameraPosition _cameraPosition = const CameraPosition(
    target: LatLng(-15.4630239974464, 28.363397732282127),
    zoom: 14,
  );

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Station"),
        backgroundColor: Colors.deepPurple,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.deepPurple,
              child: const Center(child: Text('Which Pricelocq station will you likely visit?'))
            ),
            Expanded(child: GoogleMap(
              myLocationEnabled: true,
              mapType: MapType.normal,
              initialCameraPosition: _cameraPosition,
              onMapCreated: (GoogleMapController controller) async {
                _controller = controller;
                _position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
                _cameraPosition = CameraPosition(target: LatLng(_position.latitude, _position.longitude), zoom: 20,);
                _controller.animateCamera(
                  CameraUpdate.newCameraPosition(_cameraPosition),
                );
              },))
          ],
        ),
      ),
      bottomSheet: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
        ),
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Nearby Stations', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                    Text('Done', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.grey))],),
              ),
              const SizedBox(height: 10,),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                    itemBuilder: (context, index) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('SEAOIL PACO - MANILA', style: TextStyle(fontWeight: FontWeight.w600),),
                              SizedBox(height: 4,),
                              Text('1 km away from you'),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.circle_outlined),
                        )],)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
