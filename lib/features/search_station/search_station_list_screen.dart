import 'package:flutter/material.dart';
import 'package:pricelocq/features/station_selection.dart';

class SearchStationListScreen extends StatelessWidget {
  const SearchStationListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  children: const [
                    Center(child: Text('Which Pricelocq station will you likely visit?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)),
                    SizedBox(height: 10,),
                    TextField(
                      decoration: InputDecoration(
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
                    ),
                  ],
                ),
              )
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => const StationSelection()),
          )
        ],
      ),
    );
  }
}
