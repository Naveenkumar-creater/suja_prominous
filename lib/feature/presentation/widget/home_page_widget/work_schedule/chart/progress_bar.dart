import 'package:flutter/material.dart';
import 'package:suja_shoie_app/constant/utils/font_styles.dart';

import '../../../../../../constant/utils/theme_styles.dart';
import '../../../../providers/theme_providers.dart';
import 'progress_bar/circular_progress_bar.dart';
import '../dropdown_code/workorder_widget/dropdown_circularbar.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.themeState,
  });

  final ThemeProvider themeState;

  @override
  Widget build(BuildContext context) {
    return Card(elevation: 5,
    shadowColor: Colors.black,
      child: Container(
        decoration: BoxDecoration(
           
          color: themeState.isDarkTheme
              ? const Color(0xFF424242)
              : Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        height: 248,
    
        child:const SizedBox(width: double.infinity,
          child:  Column(children: [
            DropdownMenuCircular(
              option: Text('Option Widget'),
              inProgress: Text('In Progress Widget'),
              complete: Text('Complete Widget'),
              overdue: Text('Overdue Widget'),
              widgetOptions: [
                CompleteProgressBar(),
                Text('Overdue Widget'),
                CompleteProgressBar(),
                Text('Overdue Widget'),
        
              ],
    
            ),SizedBox(height: 74),
            Headings(text: "Machine",)
          
          ]),
        ), // Include DropdownMenuExample widget here
      ),
    );
  }
}


class CompleteProgressBar extends StatefulWidget {
  const CompleteProgressBar({
    super.key,
  });

  @override
  State<CompleteProgressBar> createState() => _CompleteProgressBarState();
}

class _CompleteProgressBarState extends State<CompleteProgressBar>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        foregroundPainter: CircularProgressBar(),
        child: const Column(
          children: [SizedBox(height: defaultPadding/2,),
            Center(
                child: Text(
              '0/0',
              style: TextStyle(fontSize: 30),
            )),
          ],
        ));
  }
}
