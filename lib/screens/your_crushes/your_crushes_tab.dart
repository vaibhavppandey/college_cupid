import 'package:college_cupid/shared/styles.dart';
import 'package:college_cupid/widgets/your_crushes/crush_info.dart';
import 'package:flutter/material.dart';

import '../../shared/colors.dart';

class YourCrushesTab extends StatefulWidget {
  const YourCrushesTab({super.key});

  @override
  State<YourCrushesTab> createState() => _YourCrushesTabState();
}

class _YourCrushesTabState extends State<YourCrushesTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left:30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 11),
            child:  Text('Your Crushes', 
              style: CupidStyles.headingStyle.copyWith(color: CupidColors.titleColor)
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child:  const Text('You can select a maximum of 5 crushes at a time.', 
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.5, 
              color: CupidColors.grayColor, fontFamily: 'Sk-Modernist')),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return const CrushInfo();
              }
            )
          ),
        ],
      ),
    );
  }
}
