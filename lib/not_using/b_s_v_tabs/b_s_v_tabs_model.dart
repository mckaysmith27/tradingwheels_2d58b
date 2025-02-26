import '/flutter_flow/flutter_flow_util.dart';
import '/is_using/tags_labels/tags_labels_widget.dart';
import 'b_s_v_tabs_widget.dart' show BSVTabsWidget;
import 'package:flutter/material.dart';

class BSVTabsModel extends FlutterFlowModel<BSVTabsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for TagsLabels component.
  late TagsLabelsModel tagsLabelsModel;

  @override
  void initState(BuildContext context) {
    tagsLabelsModel = createModel(context, () => TagsLabelsModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    tagsLabelsModel.dispose();
  }
}
