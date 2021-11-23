import 'package:flutter/material.dart';

class StationSelection extends StatelessWidget {
  const StationSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
        )],);
  }
}
