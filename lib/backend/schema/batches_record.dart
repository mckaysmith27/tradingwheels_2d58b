import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BatchesRecord extends FirestoreRecord {
  BatchesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "json_str" field.
  String? _jsonStr;
  String get jsonStr => _jsonStr ?? '';
  bool hasJsonStr() => _jsonStr != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "created" field.
  DateTime? _created;
  DateTime? get created => _created;
  bool hasCreated() => _created != null;

  // "creator" field.
  DocumentReference? _creator;
  DocumentReference? get creator => _creator;
  bool hasCreator() => _creator != null;

  // "quick_nm" field.
  String? _quickNm;
  String get quickNm => _quickNm ?? '';
  bool hasQuickNm() => _quickNm != null;

  // "batch_id" field.
  String? _batchId;
  String get batchId => _batchId ?? '';
  bool hasBatchId() => _batchId != null;

  void _initializeFields() {
    _jsonStr = snapshotData['json_str'] as String?;
    _type = snapshotData['type'] as String?;
    _created = snapshotData['created'] as DateTime?;
    _creator = snapshotData['creator'] as DocumentReference?;
    _quickNm = snapshotData['quick_nm'] as String?;
    _batchId = snapshotData['batch_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('batches');

  static Stream<BatchesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BatchesRecord.fromSnapshot(s));

  static Future<BatchesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BatchesRecord.fromSnapshot(s));

  static BatchesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BatchesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BatchesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BatchesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BatchesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BatchesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBatchesRecordData({
  String? jsonStr,
  String? type,
  DateTime? created,
  DocumentReference? creator,
  String? quickNm,
  String? batchId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'json_str': jsonStr,
      'type': type,
      'created': created,
      'creator': creator,
      'quick_nm': quickNm,
      'batch_id': batchId,
    }.withoutNulls,
  );

  return firestoreData;
}

class BatchesRecordDocumentEquality implements Equality<BatchesRecord> {
  const BatchesRecordDocumentEquality();

  @override
  bool equals(BatchesRecord? e1, BatchesRecord? e2) {
    return e1?.jsonStr == e2?.jsonStr &&
        e1?.type == e2?.type &&
        e1?.created == e2?.created &&
        e1?.creator == e2?.creator &&
        e1?.quickNm == e2?.quickNm &&
        e1?.batchId == e2?.batchId;
  }

  @override
  int hash(BatchesRecord? e) => const ListEquality().hash(
      [e?.jsonStr, e?.type, e?.created, e?.creator, e?.quickNm, e?.batchId]);

  @override
  bool isValidKey(Object? o) => o is BatchesRecord;
}
