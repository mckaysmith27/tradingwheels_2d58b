import '/flutter_flow/flutter_flow_util.dart';
import 'package_selection_widget.dart' show PackageSelectionWidget;
import 'package:flutter/material.dart';

class PackageSelectionModel extends FlutterFlowModel<PackageSelectionWidget> {
  ///  Local state fields for this page.

  String? challengeSelectionType = 'None';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future updateNewChall(BuildContext context) async {
    challengeSelectionType = 'FriendlyCollab';
  }
}
