import '../model/request_data_model.dart';
import 'api_constant.dart';

class OverdueNotificationClient {
  dynamic getOverdueNotification(int count, String token) async {
    ApiRequestDataModel requestData = ApiRequestDataModel(
      clientAuthToken: token,
      apiFor: "overduenotification",
      inspectionstatus: count,
    );
    // final Map<String, dynamic> requestData = {
    //   "client_aut_token": token,
    //   "api_for": "asset_list_for_checklist",
    //   "checklist_status": statusCount,
    //   "from_date_time": "2023-08-01 10:00:00",
    //   "to_date_time": toDate,
    //   "client_id": "admin"
    // };
    final apiConstant = ApiConstant();
    final headers = {
      'Content-Type': 'application/json',
    };

    return await apiConstant.makeApiRequest(
      url: ApiConstant.baseUrl,
      headers: headers,
      requestBody: requestData,
    );
  }
}
