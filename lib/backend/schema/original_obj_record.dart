import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OriginalObjRecord extends FirestoreRecord {
  OriginalObjRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "creator" field.
  DocumentReference? _creator;
  DocumentReference? get creator => _creator;
  bool hasCreator() => _creator != null;

  // "batch_id" field.
  String? _batchId;
  String get batchId => _batchId ?? '';
  bool hasBatchId() => _batchId != null;

  // "header_row" field.
  List<String>? _headerRow;
  List<String> get headerRow => _headerRow ?? const [];
  bool hasHeaderRow() => _headerRow != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "upload_time" field.
  String? _uploadTime;
  String get uploadTime => _uploadTime ?? '';
  bool hasUploadTime() => _uploadTime != null;

  void _initializeFields() {
    _creator = snapshotData['creator'] as DocumentReference?;
    _batchId = snapshotData['batch_id'] as String?;
    _headerRow = getDataList(snapshotData['header_row']);
    _note = snapshotData['note'] as String?;
    _name = snapshotData['name'] as String?;
    _uploadTime = snapshotData['upload_time'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('original_obj');

  static Stream<OriginalObjRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OriginalObjRecord.fromSnapshot(s));

  static Future<OriginalObjRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OriginalObjRecord.fromSnapshot(s));

  static OriginalObjRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OriginalObjRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OriginalObjRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OriginalObjRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OriginalObjRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OriginalObjRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOriginalObjRecordData({
  DocumentReference? creator,
  String? batchId,
  String? note,
  String? name,
  String? uploadTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'creator': creator,
      'batch_id': batchId,
      'note': note,
      'name': name,
      'upload_time': uploadTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class OriginalObjRecordDocumentEquality implements Equality<OriginalObjRecord> {
  const OriginalObjRecordDocumentEquality();

  @override
  bool equals(OriginalObjRecord? e1, OriginalObjRecord? e2) {
    const listEquality = ListEquality();
    return e1?.creator == e2?.creator &&
        e1?.batchId == e2?.batchId &&
        listEquality.equals(e1?.headerRow, e2?.headerRow) &&
        e1?.note == e2?.note &&
        e1?.name == e2?.name &&
        e1?.uploadTime == e2?.uploadTime;
  }

  @override
  int hash(OriginalObjRecord? e) => const ListEquality().hash(
      [e?.creator, e?.batchId, e?.headerRow, e?.note, e?.name, e?.uploadTime]);

  @override
  bool isValidKey(Object? o) => o is OriginalObjRecord;
}
