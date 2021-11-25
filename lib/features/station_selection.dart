import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricelocq/features/search_station/bloc/search_station_cubit.dart';
import 'package:pricelocq/features/search_station/models/station.dart';

class StationSelection extends StatelessWidget {
  const StationSelection({required this.station, required this.groupValue, required this.onChanged});

  final Station station;
  final int groupValue;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    int distance = context.read<SearchStationCubit>().convertDistance(station.distance!);
    return InkWell(
      onTap: onChanged(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(station.name, style: const TextStyle(fontWeight: FontWeight.w600), maxLines: 2, overflow: TextOverflow.ellipsis,),
                const SizedBox(height: 4,),
                Text('$distance km away from you'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                color: Colors.red,
                child: const Icon(Icons.radio_button_off)),
          )],),
    );
  }
}
