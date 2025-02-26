import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';

Future bOappstate(BuildContext context) async {}

Future tTCappstate(BuildContext context) async {}

Future tCappstate(BuildContext context) async {}

Future wTappstate(BuildContext context) async {}

Future rAappstate(BuildContext context) async {}

Future logout(BuildContext context) async {
  context.pushNamed(UserSignInWidget.routeName);
}

Future createUserAndAuth(BuildContext context) async {
  ApiCallResponse? apiResults1z;

  apiResults1z = await SendInputGetResponseCall.call(
    phase: 'add_new_user_data_rtdb',
    intent: 'new_user',
    username: currentUserUid,
    userInput: 'FF App Action Block createUserAndAuth',
  );

  if ((apiResults1z.succeeded ?? true)) {
    context.pushNamed(HomeWidget.routeName);
  } else {
    context.pushNamed(PackageSelectionWidget.routeName);
  }
}

Future initialPageLoad(BuildContext context) async {
  ApiCallResponse? apiResultAppBlockinitialDataLoad;

  apiResultAppBlockinitialDataLoad = await SendInputGetResponseCall.call(
    intent: 'get',
    username: currentUserUid,
    phase: 'welcome',
    userInput: 'App Level Action Block initialDataLoad Executed',
  );

  if ((apiResultAppBlockinitialDataLoad.succeeded ?? true)) {
    return;
  }

  return;
}
