
import 'package:flutter/material.dart';

class AssetStatusColor  {

String getStatusText(int checklistStatus, String inspection) {
  DateTime now = DateTime.now();
  
  // Parse the inspection string into a DateTime object
  DateTime inspectionDate = DateTime.parse(inspection);
  
  // Extract the date part as a string in "yyyy-MM-dd" format
  String inspectionDateStr = "${inspectionDate.year}-${inspectionDate.month.toString().padLeft(2, '0')}-${inspectionDate.day.toString().padLeft(2, '0')}";
  String nowDateStr = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

  // Compare checklistStatus and the inspection date
  if (checklistStatus == 1 && inspectionDateStr == nowDateStr) {
    return "Open";
  } else if (checklistStatus == 2 ) {
    return "In Progress";
  } else if (checklistStatus == 3||checklistStatus == 4 ) {
    return "Complete";
  } 
  else if (checklistStatus == 5 ) {
    return "Rejected";
  }else  {
    return "Overdue";
  }
}


  Color getStatusColor(int checklistStatus, String inspection) {
 DateTime now = DateTime.now();
  
  // Parse the inspection string into a DateTime object
  DateTime inspectionDate = DateTime.parse(inspection);
  
  // Extract the date part as a string in "yyyy-MM-dd" format
  String inspectionDateStr = "${inspectionDate.year}-${inspectionDate.month.toString().padLeft(2, '0')}-${inspectionDate.day.toString().padLeft(2, '0')}";
  String nowDateStr = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

  // Compare checklistStatus and the inspection date
  if (checklistStatus == 1 && inspectionDateStr == nowDateStr) {
     return Colors.blue;
  } else if (checklistStatus == 2 ) {
     return Colors.orange;
  } else if (checklistStatus == 3||checklistStatus == 4 ) {
    return Colors.green;
  } 
  
  else if (checklistStatus == 5 ) {
    return Colors.black;
  }else 
  {
  return Colors.red;
  } 
}


}