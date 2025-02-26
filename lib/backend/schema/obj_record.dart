import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ObjRecord extends FirestoreRecord {
  ObjRecord._(
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

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  // "upload_time" field.
  String? _uploadTime;
  String get uploadTime => _uploadTime ?? '';
  bool hasUploadTime() => _uploadTime != null;

  void _initializeFields() {
    _creator = snapshotData['creator'] as DocumentReference?;
    _batchId = snapshotData['batch_id'] as String?;
    _headerRow = getDataList(snapshotData['header_row']);
    _name = snapshotData['name'] as String?;
    _note = snapshotData['note'] as String?;
    _uploadTime = snapshotData['upload_time'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('obj');

  static Stream<ObjRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ObjRecord.fromSnapshot(s));

  static Future<ObjRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ObjRecord.fromSnapshot(s));

  static ObjRecord fromSnapshot(DocumentSnapshot snapshot) => ObjRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ObjRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ObjRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ObjRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ObjRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createObjRecordData({
  DocumentReference? creator,
  String? batchId,
  String? name,
  String? note,
  String? uploadTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'creator': creator,
      'batch_id': batchId,
      'name': name,
      'note': note,
      'upload_time': uploadTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class ObjRecordDocumentEquality implements Equality<ObjRecord> {
  const ObjRecordDocumentEquality();

  @override
  bool equals(ObjRecord? e1, ObjRecord? e2) {
    const listEquality = ListEquality();
    return e1?.creator == e2?.creator &&
        e1?.batchId == e2?.batchId &&
        listEquality.equals(e1?.headerRow, e2?.headerRow) &&
        e1?.name == e2?.name &&
        e1?.note == e2?.note &&
        e1?.uploadTime == e2?.uploadTime;
  }

  @override
  int hash(ObjRecord? e) => const ListEquality().hash(
      [e?.creator, e?.batchId, e?.headerRow, e?.name, e?.note, e?.uploadTime]);

  @override
  bool isValidKey(Object? o) => o is ObjRecord;
}
