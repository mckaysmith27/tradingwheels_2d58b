import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataTableRecord extends FirestoreRecord {
  DataTableRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "parentTable" field.
  List<DocumentReference>? _parentTable;
  List<DocumentReference> get parentTable => _parentTable ?? const [];
  bool hasParentTable() => _parentTable != null;

  // "childTable" field.
  List<DocumentReference>? _childTable;
  List<DocumentReference> get childTable => _childTable ?? const [];
  bool hasChildTable() => _childTable != null;

  void _initializeFields() {
    _parentTable = getDataList(snapshotData['parentTable']);
    _childTable = getDataList(snapshotData['childTable']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dataTable');

  static Stream<DataTableRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DataTableRecord.fromSnapshot(s));

  static Future<DataTableRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DataTableRecord.fromSnapshot(s));

  static DataTableRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DataTableRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DataTableRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DataTableRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DataTableRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DataTableRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDataTableRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class DataTableRecordDocumentEquality implements Equality<DataTableRecord> {
  const DataTableRecordDocumentEquality();

  @override
  bool equals(DataTableRecord? e1, DataTableRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.parentTable, e2?.parentTable) &&
        listEquality.equals(e1?.childTable, e2?.childTable);
  }

  @override
  int hash(DataTableRecord? e) =>
      const ListEquality().hash([e?.parentTable, e?.childTable]);

  @override
  bool isValidKey(Object? o) => o is DataTableRecord;
}
