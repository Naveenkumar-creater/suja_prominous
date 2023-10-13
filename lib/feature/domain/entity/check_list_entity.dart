import 'package:equatable/equatable.dart';

class CheckListEntity extends Equatable {
  final int? responseCode;
  final CheckListData responseData;
  final int wsReqId;
  final String responseMsg;

  const CheckListEntity({
    required this.responseCode,
    required this.responseData,
    required this.wsReqId,
    required this.responseMsg,
  });

  @override
  List<Object?> get props => [responseCode, responseData, wsReqId, responseMsg];
}

class CheckListData {
  final List<CheckListDataEntity> checklist;

  CheckListData({
    required this.checklist,
  });

  factory CheckListData.fromJson(Map<String, dynamic> json) {
    final checkListJson = json['check_list']; // Updated key name
    // ignore: avoid_print
    print('check list JSON: $checkListJson'); // Print the checkListJson

    if (checkListJson == null) {
      throw Exception(
          'Asset list is null.'); // Throw an exception if asset list is null
    }

    final checkListData = (checkListJson as List)
        .map((item) => CheckListDataEntity.fromJson(item))
        .toList();

    return CheckListData(
      checklist: checkListData,
    );
  }
}


class CheckListDataEntity {
  final String checklistname;
  final String maintenancetypename;
  final String assetname;
  final int registerid;
  final int checkliststatus;
  final String assetbarcode;
  final int checklistfrequency;
  final String inspectiondate;
  final int planid;
  // ignore: prefer_typing_uninitialized_variables
  final acrpassetId;
  //  final int acrpinspectionstatus;

  final String acpinspectionDate;
  CheckListDataEntity(
      {required this.checklistname,
      required this.maintenancetypename,
      required this.assetname,
      required this.registerid,
      required this.checkliststatus,
      required this.assetbarcode,
      required this.checklistfrequency,
      required this.inspectiondate,
      required this.planid,
      required this .acrpassetId,
      required this.acpinspectionDate
      // required this.acrpinspectionstatus,
      });

  factory CheckListDataEntity.fromJson(Map<String, dynamic> json) {
    return CheckListDataEntity(
      checklistname: json['check_list_name'],

      maintenancetypename: json['maintenance_type_name']
      ,
      assetbarcode: json['asset_bar_code'],

      assetname: json['asset_name'],

      registerid: json['registerid'],

      checkliststatus: json['acrp_inspection_status'],
      checklistfrequency: json['checklist_frequency'],

      inspectiondate: json['inspection_date'],
      planid: json['plan_id'],
     acrpassetId :json['acrp_asset_id'],
     acpinspectionDate:json['acrp_actual_inspection_to_time']
      // acrpinspectionstatus:json['acrp_inspection_status'],
    );
  }
}




