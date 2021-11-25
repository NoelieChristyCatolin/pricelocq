import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pricelocq/features/search_station/bloc/search_station_cubit.dart';
import 'package:pricelocq/features/search_station/bloc/search_station_state.dart';
import 'package:pricelocq/features/search_station/components/icon_label.dart';
import 'package:pricelocq/features/search_station/models/station.dart';
import 'package:pricelocq/features/search_station/search_station_list_screen.dart';
import 'package:pricelocq/features/search_station/components/station_selection.dart';

class SearchStationMapScreen extends StatefulWidget {
  const SearchStationMapScreen({Key? key}) : super(key: key);

  @override
  State<SearchStationMapScreen> createState() => _SearchStationMapScreenState();
}

class _SearchStationMapScreenState extends State<SearchStationMapScreen> {

  late GoogleMapController _controller;
  late Position _currentPosition;
  //todo: Fix initial position
  late CameraPosition _cameraPosition = const CameraPosition(
    target: LatLng(14.5772522,121.0391382),
    zoom: 14,
  );

  int groupValue = -1;
  bool hasStationSelected = false;
  bool isBottomSheetDisplayed = true;
  Station? selectedStation;

  @override
  void initState() {
    super.initState();
    context.read<SearchStationCubit>().getStationList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchStationCubit, SearchStationState>(
      builder: (context,state) => Scaffold(
        appBar: AppBar(
          title: const Text("Search Station"),
          backgroundColor: Colors.deepPurple,
          actions:  [
            InkWell(
             onTap: () => _navigateToSearchStationListScreen(context),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.search),
              ),
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
                child: const Center(child: Text('Which Pricelocq station will you likely visit?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)),
              ),
              Expanded(child: GoogleMap(
                myLocationEnabled: true,
                mapType: MapType.normal,
                initialCameraPosition: _cameraPosition,
                onMapCreated: (GoogleMapController controller) async {
                  _controller = controller;
                  _currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
                  _updateMapCamera(_currentPosition.latitude, _currentPosition.longitude);
                },)),

            ],
          ),
        ),
        bottomSheet: Visibility(
          visible: isBottomSheetDisplayed,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
            ),
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        hasStationSelected ?
                          InkWell(
                              child:  const Text('Back to list',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.lightBlue),),
                                onTap: () => _resetSelection(),
                          )
                          : const Text('Nearby Stations', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                           InkWell(
                               child: Text('Done',
                                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: hasStationSelected ? Colors.lightBlue : Colors.grey)),
                                  onTap: hasStationSelected ? () => _onDismissedBottomSheet()  : (){},
                           ),
                      ],),
                  ),
                  const SizedBox(height: 10,),
                  hasStationSelected ?
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text(selectedStation!.name, style: const TextStyle(fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis,),
                            Text(selectedStation!.address, ),
                            Row(children: [Text(selectedStation!.city,),Text(selectedStation!.area,)],),
                            const SizedBox(height: 30,),
                            Row(children: [
                              IconLabel(icon: const Icon(Icons.car_repair), label: '${convertDistance(selectedStation!)} km away'),
                              const SizedBox(width: 20,),
                              const IconLabel(icon: Icon(Icons.access_time), label: 'Open 24 hrs'),
                            ],)
                          ],
                        ),
                      )
                      : Expanded(
                        child: ListView.builder(
                          itemCount: state.stations.length,
                            itemBuilder: (context, index) => StationSelection(
                              index: index,
                              station: state.stations[index],
                              groupValue: groupValue,
                              onChanged: (value) =>_handleRadioValueChange(value, state.stations[index])))
                      )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _onDismissedBottomSheet(){
    print('_onDismissedBottomSheet');
    setState(() {
      isBottomSheetDisplayed = false;
    });
  }

  _navigateToSearchStationListScreen(BuildContext context) async {
    final List<Object> result = await Navigator.push(context, MaterialPageRoute(builder: (context)=> const SearchStationListScreen()));
    Station selectedStation = result[0] as Station;
    int selectedIndex = result[1] as int;
    _handleRadioValueChange(selectedIndex, selectedStation);
    isBottomSheetDisplayed = true;
  }

  _handleRadioValueChange(int value, Station station) {
    setState(() {
      groupValue = value;
      hasStationSelected = true;
      selectedStation = station;

      double lat = double.parse(station.lat);
      double lng = double.parse(station.lng);
      _updateMapCamera(lat, lng);
    });
  }

  _updateMapCamera(double lat, double lng){
    _cameraPosition = CameraPosition(target: LatLng(lat, lng), zoom: 20,);
    _controller.animateCamera(
      CameraUpdate.newCameraPosition(_cameraPosition),
    );
  }

  _resetSelection(){
    print('resetSelection');
    setState(() {
      // groupValue = -1;
      hasStationSelected = false;
      // selectedStation = null;
    });
  }

  int convertDistance(Station station){
    return context.read<SearchStationCubit>().convertDistance(station.distance!);
  }
}
