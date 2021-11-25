import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricelocq/features/search_station/bloc/search_station_cubit.dart';
import 'package:pricelocq/features/search_station/bloc/search_station_state.dart';
import 'package:pricelocq/features/search_station/components/station_selection.dart';
import 'package:pricelocq/features/search_station/models/station.dart';

class SearchStationListScreen extends StatefulWidget {
  const SearchStationListScreen({Key? key}) : super(key: key);

  @override
  State<SearchStationListScreen> createState() => _SearchStationListScreenState();
}

class _SearchStationListScreenState extends State<SearchStationListScreen> {
  int groupValue = -1;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<SearchStationCubit>().getStationList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchStationCubit, SearchStationState>(builder: (context, state) => Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Search Station"),
        backgroundColor: Colors.deepPurple,
        actions:  [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.close),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
              height: 150,
              width: double.infinity,
              color: Colors.deepPurple,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children:  [
                    const Center(child: Text('Which Pricelocq station will you likely visit?',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)),
                    const SizedBox(height: 10,),
                    TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 5.0),
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0)), //
                          )
                      ),
                      onChanged: (value) => _searchStation(value),
                    ),
                  ],
                ),
              )
          ),
          Expanded(
            child: ListView.builder(
                itemCount: state.stations.length,
                itemBuilder: (context, index) =>  StationSelection(
                    index: index,
                    station: state.stations[index],
                    groupValue: groupValue,
                    onChanged: (value) =>_handleRadioValueChange(value, state.stations[index])))
          )
        ],
      ),
    ));
  }

  _searchStation(String searchKey){
    context.read<SearchStationCubit>().searchStation(searchKey);
  }

  _handleRadioValueChange(int value, Station station){
    setState(() {
      groupValue = value;
    });
    Navigator.pop(context, [station, value]);
  }
}
