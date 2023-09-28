class ChecklistDataPoint {
  final int amdpDatapointId;
  final int acrdpId;
  final String amdpDatapointDescription;
  final String acrdpDatapointValue;

  ChecklistDataPoint({
    required this.amdpDatapointId,
    required this.acrdpId,
    required this.amdpDatapointDescription,
    required this.acrdpDatapointValue,
  });

  Map<String, dynamic> toJson() {
    return {
      'amdp_datapoint_id': amdpDatapointId,
      'acrdp_id': acrdpId,
      'amdp_datapoint_description': amdpDatapointDescription,
      'acrdp_datapoint_value': acrdpDatapointValue,
    };
  }
}

// class AdditionalData {
//   final int amdpDatapointId;
//   final int acrdpId;
//   final String amdpDatapointDescription;
//   final String acrdpDatapointValue;

//   AdditionalData({
//     required this.amdpDatapointId,
//     required this.acrdpId,
//     required this.amdpDatapointDescription,
//     required this.acrdpDatapointValue,
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       'amdp_datapoint_id': amdpDatapointId,
//       'acrdp_id': acrdpId,
//       'amdp_datapoint_description': amdpDatapointDescription,
//       'acrdp_datapoint_value': acrdpDatapointValue,
//     };
//   }
// }

class ChecklistCheckpoint {
  final int acrdId;
  final String acrdCheckpointNotes;
  final int acrdCheckpointStatus;
  final List<String> images;
  final List<ChecklistDataPoint> datapoints;
  // final List<AdditionalData> additionalData;
  ChecklistCheckpoint({
    required this.acrdId,
    required this.acrdCheckpointNotes,
    required this.acrdCheckpointStatus,
    required this.images,
    required this.datapoints,
    // required this.additionalData,
  });

  Map<String, dynamic> toJson() {
    return {
      'acrd_id': acrdId,
      'acrd_checkpoint_notes': acrdCheckpointNotes,
      'acrd_checkpoint_inspection_result': acrdCheckpointStatus,
      'images': images,
      'datapoints': datapoints.map((dataPoint) => dataPoint.toJson()).toList(),
      // 'additionalData':
      //     additionalData.map((dataPoint) => dataPoint.toJson()).toList(),
    };
  }
}

class ChecklistRequest {
  final String clientAuthToken;
  final int operatorId;
  final String apiFor;
  final String toDateTime;
  final String fromDateTime;
  final String clientId;
  final int statusId;
  final int acrhAcmphId;
  final int acrhid;
  final int planid;
  final List<String> headerimage;
  final List<ChecklistCheckpoint> checkPoints;

  ChecklistRequest(
      {required this.clientAuthToken,
      required this.operatorId,
      required this.toDateTime,
      required this.headerimage,
      required this.apiFor,
      required this.clientId,
      required this.acrhAcmphId,
      required this.checkPoints,
      required this.fromDateTime,
      required this.statusId,
      required this.acrhid,
      required this.planid});

  Map<String, dynamic> toJson() {
    return {
      'client_aut_token': clientAuthToken,
      "header_image": headerimage,
      'operator_id': operatorId,
      'api_for': apiFor,
      'from_date_time': fromDateTime,
      'to_date_time': toDateTime,
      'client_id': clientId,
      'status_id': statusId,
      'acrh_acmph_id': acrhAcmphId,
      'acrh_id': acrhid,
      'acrp_id': planid,
      'check_points':
          checkPoints.map((checkpoint) => checkpoint.toJson()).toList(),
    };
  }
}
