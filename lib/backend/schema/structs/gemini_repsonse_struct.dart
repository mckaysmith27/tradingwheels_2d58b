// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class GeminiRepsonseStruct extends FFFirebaseStruct {
  GeminiRepsonseStruct({
    String? messages,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _messages = messages,
        super(firestoreUtilData);

  // "messages" field.
  String? _messages;
  String get messages => _messages ?? '';
  set messages(String? val) => _messages = val;

  bool hasMessages() => _messages != null;

  static GeminiRepsonseStruct fromMap(Map<String, dynamic> data) =>
      GeminiRepsonseStruct(
        messages: data['messages'] as String?,
      );

  static GeminiRepsonseStruct? maybeFromMap(dynamic data) => data is Map
      ? GeminiRepsonseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'messages': _messages,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'messages': serializeParam(
          _messages,
          ParamType.String,
        ),
      }.withoutNulls;

  static GeminiRepsonseStruct fromSerializableMap(Map<String, dynamic> data) =>
      GeminiRepsonseStruct(
        messages: deserializeParam(
          data['messages'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GeminiRepsonseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GeminiRepsonseStruct && messages == other.messages;
  }

  @override
  int get hashCode => const ListEquality().hash([messages]);
}

GeminiRepsonseStruct createGeminiRepsonseStruct({
  String? messages,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GeminiRepsonseStruct(
      messages: messages,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GeminiRepsonseStruct? updateGeminiRepsonseStruct(
  GeminiRepsonseStruct? geminiRepsonse, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    geminiRepsonse
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGeminiRepsonseStructData(
  Map<String, dynamic> firestoreData,
  GeminiRepsonseStruct? geminiRepsonse,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (geminiRepsonse == null) {
    return;
  }
  if (geminiRepsonse.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && geminiRepsonse.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final geminiRepsonseData =
      getGeminiRepsonseFirestoreData(geminiRepsonse, forFieldValue);
  final nestedData =
      geminiRepsonseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = geminiRepsonse.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGeminiRepsonseFirestoreData(
  GeminiRepsonseStruct? geminiRepsonse, [
  bool forFieldValue = false,
]) {
  if (geminiRepsonse == null) {
    return {};
  }
  final firestoreData = mapToFirestore(geminiRepsonse.toMap());

  // Add any Firestore field values
  geminiRepsonse.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGeminiRepsonseListFirestoreData(
  List<GeminiRepsonseStruct>? geminiRepsonses,
) =>
    geminiRepsonses
        ?.map((e) => getGeminiRepsonseFirestoreData(e, true))
        .toList() ??
    [];
