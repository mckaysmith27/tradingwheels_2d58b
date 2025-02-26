import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TradesRecord extends FirestoreRecord {
  TradesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "trade_id" field.
  int? _tradeId;
  int get tradeId => _tradeId ?? 0;
  bool hasTradeId() => _tradeId != null;

  // "daily_trade_num" field.
  int? _dailyTradeNum;
  int get dailyTradeNum => _dailyTradeNum ?? 0;
  bool hasDailyTradeNum() => _dailyTradeNum != null;

  // "screenshot_1" field.
  String? _screenshot1;
  String get screenshot1 => _screenshot1 ?? '';
  bool hasScreenshot1() => _screenshot1 != null;

  // "screenshot_2" field.
  String? _screenshot2;
  String get screenshot2 => _screenshot2 ?? '';
  bool hasScreenshot2() => _screenshot2 != null;

  // "screenshot_3" field.
  String? _screenshot3;
  String get screenshot3 => _screenshot3 ?? '';
  bool hasScreenshot3() => _screenshot3 != null;

  // "pre_trade_acct_bal" field.
  int? _preTradeAcctBal;
  int get preTradeAcctBal => _preTradeAcctBal ?? 0;
  bool hasPreTradeAcctBal() => _preTradeAcctBal != null;

  // "post_trade_acct_bal" field.
  int? _postTradeAcctBal;
  int get postTradeAcctBal => _postTradeAcctBal ?? 0;
  bool hasPostTradeAcctBal() => _postTradeAcctBal != null;

  void _initializeFields() {
    _tradeId = castToType<int>(snapshotData['trade_id']);
    _dailyTradeNum = castToType<int>(snapshotData['daily_trade_num']);
    _screenshot1 = snapshotData['screenshot_1'] as String?;
    _screenshot2 = snapshotData['screenshot_2'] as String?;
    _screenshot3 = snapshotData['screenshot_3'] as String?;
    _preTradeAcctBal = castToType<int>(snapshotData['pre_trade_acct_bal']);
    _postTradeAcctBal = castToType<int>(snapshotData['post_trade_acct_bal']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('trades');

  static Stream<TradesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TradesRecord.fromSnapshot(s));

  static Future<TradesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TradesRecord.fromSnapshot(s));

  static TradesRecord fromSnapshot(DocumentSnapshot snapshot) => TradesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TradesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TradesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TradesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TradesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTradesRecordData({
  int? tradeId,
  int? dailyTradeNum,
  String? screenshot1,
  String? screenshot2,
  String? screenshot3,
  int? preTradeAcctBal,
  int? postTradeAcctBal,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'trade_id': tradeId,
      'daily_trade_num': dailyTradeNum,
      'screenshot_1': screenshot1,
      'screenshot_2': screenshot2,
      'screenshot_3': screenshot3,
      'pre_trade_acct_bal': preTradeAcctBal,
      'post_trade_acct_bal': postTradeAcctBal,
    }.withoutNulls,
  );

  return firestoreData;
}

class TradesRecordDocumentEquality implements Equality<TradesRecord> {
  const TradesRecordDocumentEquality();

  @override
  bool equals(TradesRecord? e1, TradesRecord? e2) {
    return e1?.tradeId == e2?.tradeId &&
        e1?.dailyTradeNum == e2?.dailyTradeNum &&
        e1?.screenshot1 == e2?.screenshot1 &&
        e1?.screenshot2 == e2?.screenshot2 &&
        e1?.screenshot3 == e2?.screenshot3 &&
        e1?.preTradeAcctBal == e2?.preTradeAcctBal &&
        e1?.postTradeAcctBal == e2?.postTradeAcctBal;
  }

  @override
  int hash(TradesRecord? e) => const ListEquality().hash([
        e?.tradeId,
        e?.dailyTradeNum,
        e?.screenshot1,
        e?.screenshot2,
        e?.screenshot3,
        e?.preTradeAcctBal,
        e?.postTradeAcctBal
      ]);

  @override
  bool isValidKey(Object? o) => o is TradesRecord;
}
