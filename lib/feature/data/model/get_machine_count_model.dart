import '../../domain/entity/get_machine_count_entity.dart';



class GetmachineCountModel extends GetMachineCountEntity {
  const GetmachineCountModel(
      {required int acrpInspectionStatusCount, required int acrpAssetIdCount})
      : super(
            acrpInspectionStatusCount: acrpInspectionStatusCount,
            acrpAssetIdCount: acrpAssetIdCount);

  factory GetmachineCountModel.fromJson(Map<String, dynamic> json) {
    final machineStatus = json['response_data']['Machine_Status'];
    return GetmachineCountModel(
        acrpInspectionStatusCount:
            machineStatus['acrp_inspection_status_count'],
        acrpAssetIdCount: machineStatus['acrp_asset_id_count']);
  }
}
