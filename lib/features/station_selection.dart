import 'package:flutter/material.dart';
import 'package:pricelocq/features/search_station/models/station.dart';

class StationSelection extends StatelessWidget {
  const StationSelection({required this.station});

  final Station station;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(station.name, style: const TextStyle(fontWeight: FontWeight.w600),),
              const SizedBox(height: 4,),
              Text('${station.dealerId}'),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.circle_outlined),
        )],);
  }
}
