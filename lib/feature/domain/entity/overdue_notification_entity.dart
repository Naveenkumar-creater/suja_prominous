import 'package:equatable/equatable.dart';

class OverdueNotificationEntity extends Equatable {
  final int? responseCode;
  final ResponseData responseData;
  final int wsReqId;
  final String responseMsg;

  const OverdueNotificationEntity({
    required this.responseCode,
    required this.responseData,
    required this.wsReqId,
    required this.responseMsg,
  });

  @override
  List<Object?> get props => [responseCode, responseData, wsReqId, responseMsg];
}

class ResponseData {
  final List<OverdueNotificationDataEntity> overdueNotificationDataEntity;

  ResponseData({
    required this.overdueNotificationDataEntity,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    final assetListJson = json['asset_list_for_checklist']; // Updated key name
    // ignore: avoid_print
    print('Asset list JSON: $assetListJson'); // Print the assetListJson

    if (assetListJson == null) {
      throw Exception(
          'Asset list is null.'); // Throw an exception if asset list is null
    }

    final overdueNotificationData = (assetListJson as List)
        .map((item) => OverdueNotificationDataEntity.fromJson(item))
        .toList();

    return ResponseData(
      overdueNotificationDataEntity: overdueNotificationData,
    );
  }
}

class OverdueNotificationDataEntity {
  final String assetname;
  final String acmphtemplatename;
  final String locname;
  final String acrpinspectiondate;
  final int acrpinspectionstatus;

  OverdueNotificationDataEntity({
    required this.assetname,
    required this.acmphtemplatename,
    required this.locname,
    required this.acrpinspectiondate,
    required this.acrpinspectionstatus,
  });

  factory OverdueNotificationDataEntity.fromJson(Map<String, dynamic> json) {
    return OverdueNotificationDataEntity(
      assetname: json['asset_name'],
      acmphtemplatename: json['acmph_template_name'],
      locname: json['loc_name'],
      acrpinspectiondate: json['acrp_inspection_date'],
      acrpinspectionstatus: json['acrp_inspection_status'],
    );
  }
}
