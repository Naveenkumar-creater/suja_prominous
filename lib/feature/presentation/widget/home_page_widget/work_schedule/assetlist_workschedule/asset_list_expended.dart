import 'package:flutter/cupertino.dart';

import '../../../../../../constant/utils/theme_styles.dart';
import 'asset_staus_color.dart';
import 'checklist_status_card.dart';

// Pass the instance of your AssetStatusColor
class ChecklistWidget extends StatelessWidget {
  final List checklist; // Replace with your data model
  final String title;
  final int assetId; // The dynamic title you want to show

  const ChecklistWidget({super.key, 
    required this.checklist,
    required this.title,
     required this.assetId,

  });

  @override
  Widget build(BuildContext context) {
    AssetStatusColor assetStatusColor = AssetStatusColor();

    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: defaultPadding / 2),
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: checklist.length,
              itemBuilder: (context, index) {
                final asset = checklist[index];
                final statusText = assetStatusColor.getStatusText(asset.checkliststatus, asset.inspectiondate);
                final statusColor = assetStatusColor.getStatusColor(asset.checkliststatus, asset.inspectiondate);

                return ChecklistCard(
                  statusColor: statusColor,
                  checklistName: asset.checklistname,
                  statusText: statusText,
                  inspectionDate: asset.inspectiondate,
                  checklistStatus: asset.checkliststatus,
                  planId: asset.planid,
                  barcode: asset.assetbarcode,
                  assetId:  assetId
                
                


                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
