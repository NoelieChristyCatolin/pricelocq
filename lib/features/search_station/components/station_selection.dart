import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricelocq/features/search_station/bloc/search_station_cubit.dart';
import 'package:pricelocq/features/search_station/models/station.dart';

class StationSelection extends StatelessWidget {
  StationSelection({required this.index, required this.station, required this.groupValue, required this.onChanged});

  final int index;
  final Station station;
  final int groupValue;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    int distance = context.read<SearchStationCubit>().convertDistance(station.distance!);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(station.name, style: const TextStyle(fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis,),
                Text('$distance km away from you'),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Radio<int>(
              value: index,
              groupValue: groupValue,
              onChanged: (value) => onChanged(value)),
        ),
      ],
    );
  }
}
