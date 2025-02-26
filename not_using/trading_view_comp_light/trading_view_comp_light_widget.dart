import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'trading_view_comp_light_model.dart';
export 'trading_view_comp_light_model.dart';

class TradingViewCompLightWidget extends StatefulWidget {
  const TradingViewCompLightWidget({super.key});

  @override
  State<TradingViewCompLightWidget> createState() =>
      _TradingViewCompLightWidgetState();
}

class _TradingViewCompLightWidgetState
    extends State<TradingViewCompLightWidget> {
  late TradingViewCompLightModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TradingViewCompLightModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterFlowWebView(
          content:
              '<!-- TradingView Widget BEGIN -->\n<div class=\"tradingview-widget-container\" style=\"height:100%;width:100%\">\n  <script type=\"text/javascript\" src=\"https://s3.tradingview.com/tv.js\"></script>\n  <script type=\"text/javascript\">\n  new TradingView.widget(\n  {\n  \"autosize\": true,\n  \"symbol\": \"OANDA:EURUSD\",\n  \"timezone\": \"Etc/UTC\",\n  \"theme\": \"light\",\n  \"style\": \"1\",\n  \"locale\": \"en\",\n  \"enable_publishing\": true,\n  \"backgroundColor\": \"rgba(255, 255, 255, 1)\",\n  \"gridColor\": \"rgba(255, 255, 255, 1)\",\n  \"withdateranges\": true,\n  \"range\": \"1D\",\n  \"hide_side_toolbar\": false,\n  \"allow_symbol_change\": true,\n  \"watchlist\": [\n    \"OANDA:EURUSD\",\n    \"OANDA:USDJPY\",\n    \"OANDA:GBPUSD\",\n    \"OANDA:USDCHF\",\n    \"OANDA:AUDUSD\",\n    \"OANDA:USDCAD\",\n    \"OANDA:NZDUSD\",\n    \"OANDA:EURGBP\",\n    \"OANDA:EURAUD\",\n    \"OANDA:EURJPY\",\n    \"OANDA:GBPJPY\",\n    \"OANDA:AUDJPY\",\n    \"OANDA:NZDJPY\",\n    \"OANDA:GBPAUD\",\n    \"OANDA:EURNZD\",\n    \"OANDA:AUDNZD\",\n    \"OANDA:USDMXN\"\n  ],\n  \"details\": true,\n  \"hotlist\": true,\n  \"calendar\": true,\n  \"studies\": [\n    \"STD;Average_True_Range\",\n    \"STD;EMA\",\n  ],\n  \"show_popup_button\": true,\n  \"popup_width\": \"1000\",\n  \"popup_height\": \"650\",\n  \"container_id\": \"tradingview_8914c\"\n}\n  );\n  </script>\n</div>\n<!-- TradingView Widget END -->',
          height: 616.0,
          verticalScroll: false,
          horizontalScroll: false,
          html: true,
        ),
      ],
    );
  }
}
