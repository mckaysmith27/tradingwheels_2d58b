import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MgsRecord extends FirestoreRecord {
  MgsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "prpts" field.
  List<String>? _prpts;
  List<String> get prpts => _prpts ?? const [];
  bool hasPrpts() => _prpts != null;

  // "resps" field.
  List<String>? _resps;
  List<String> get resps => _resps ?? const [];
  bool hasResps() => _resps != null;

  void _initializeFields() {
    _prpts = getDataList(snapshotData['prpts']);
    _resps = getDataList(snapshotData['resps']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mgs');

  static Stream<MgsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MgsRecord.fromSnapshot(s));

  static Future<MgsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MgsRecord.fromSnapshot(s));

  static MgsRecord fromSnapshot(DocumentSnapshot snapshot) => MgsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MgsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MgsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MgsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MgsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMgsRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class MgsRecordDocumentEquality implements Equality<MgsRecord> {
  const MgsRecordDocumentEquality();

  @override
  bool equals(MgsRecord? e1, MgsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.prpts, e2?.prpts) &&
        listEquality.equals(e1?.resps, e2?.resps);
  }

  @override
  int hash(MgsRecord? e) => const ListEquality().hash([e?.prpts, e?.resps]);

  @override
  bool isValidKey(Object? o) => o is MgsRecord;
}
