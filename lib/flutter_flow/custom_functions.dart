import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

bool? indexChecker(
  int? index,
  int? lengthoflist,
) {
  if (index != null && lengthoflist != null) {
    return index < lengthoflist;
  }
  return null;
}

List<dynamic> listMessagesToListJSON(List<MessagesRecord>? messages) {
  messages ??= [];
  //Reverse the List
  final reversedMessages = messages.reversed.toList();

  final List<Map<String, dynamic>> jsonList = reversedMessages.map((message) {
    return {
      'role': message.role.toString().split('.').last,
      'content': message.content,
    };
  }).toList();

  return jsonList;
}
