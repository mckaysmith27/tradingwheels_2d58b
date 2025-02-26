import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CsvRecord extends FirestoreRecord {
  CsvRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uploaded_time" field.
  String? _uploadedTime;
  String get uploadedTime => _uploadedTime ?? '';
  bool hasUploadedTime() => _uploadedTime != null;

  // "creator" field.
  DocumentReference? _creator;
  DocumentReference? get creator => _creator;
  bool hasCreator() => _creator != null;

  // "file_name" field.
  String? _fileName;
  String get fileName => _fileName ?? '';
  bool hasFileName() => _fileName != null;

  // "batch_id" field.
  String? _batchId;
  String get batchId => _batchId ?? '';
  bool hasBatchId() => _batchId != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  bool hasIndex() => _index != null;

  // "quick_name" field.
  String? _quickName;
  String get quickName => _quickName ?? '';
  bool hasQuickName() => _quickName != null;

  // "csv_content" field.
  String? _csvContent;
  String get csvContent => _csvContent ?? '';
  bool hasCsvContent() => _csvContent != null;

  // "json_content" field.
  String? _jsonContent;
  String get jsonContent => _jsonContent ?? '';
  bool hasJsonContent() => _jsonContent != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  void _initializeFields() {
    _uploadedTime = snapshotData['uploaded_time'] as String?;
    _creator = snapshotData['creator'] as DocumentReference?;
    _fileName = snapshotData['file_name'] as String?;
    _batchId = snapshotData['batch_id'] as String?;
    _type = snapshotData['type'] as String?;
    _index = castToType<int>(snapshotData['index']);
    _quickName = snapshotData['quick_name'] as String?;
    _csvContent = snapshotData['csv_content'] as String?;
    _jsonContent = snapshotData['json_content'] as String?;
    _content = snapshotData['content'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('csv');

  static Stream<CsvRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CsvRecord.fromSnapshot(s));

  static Future<CsvRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CsvRecord.fromSnapshot(s));

  static CsvRecord fromSnapshot(DocumentSnapshot snapshot) => CsvRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CsvRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CsvRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CsvRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CsvRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCsvRecordData({
  String? uploadedTime,
  DocumentReference? creator,
  String? fileName,
  String? batchId,
  String? type,
  int? index,
  String? quickName,
  String? csvContent,
  String? jsonContent,
  String? content,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uploaded_time': uploadedTime,
      'creator': creator,
      'file_name': fileName,
      'batch_id': batchId,
      'type': type,
      'index': index,
      'quick_name': quickName,
      'csv_content': csvContent,
      'json_content': jsonContent,
      'content': content,
    }.withoutNulls,
  );

  return firestoreData;
}

class CsvRecordDocumentEquality implements Equality<CsvRecord> {
  const CsvRecordDocumentEquality();

  @override
  bool equals(CsvRecord? e1, CsvRecord? e2) {
    return e1?.uploadedTime == e2?.uploadedTime &&
        e1?.creator == e2?.creator &&
        e1?.fileName == e2?.fileName &&
        e1?.batchId == e2?.batchId &&
        e1?.type == e2?.type &&
        e1?.index == e2?.index &&
        e1?.quickName == e2?.quickName &&
        e1?.csvContent == e2?.csvContent &&
        e1?.jsonContent == e2?.jsonContent &&
        e1?.content == e2?.content;
  }

  @override
  int hash(CsvRecord? e) => const ListEquality().hash([
        e?.uploadedTime,
        e?.creator,
        e?.fileName,
        e?.batchId,
        e?.type,
        e?.index,
        e?.quickName,
        e?.csvContent,
        e?.jsonContent,
        e?.content
      ]);

  @override
  bool isValidKey(Object? o) => o is CsvRecord;
}
