// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HoldsVariousDataTypesStruct extends FFFirebaseStruct {
  HoldsVariousDataTypesStruct({
    String? valStr,
    List<String>? valStrLs,
    int? valInt,
    List<int>? valIntLs,
    double? valFloat,
    List<double>? valFloatLs,
    bool? valBol,
    List<bool>? valBolLs,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _valStr = valStr,
        _valStrLs = valStrLs,
        _valInt = valInt,
        _valIntLs = valIntLs,
        _valFloat = valFloat,
        _valFloatLs = valFloatLs,
        _valBol = valBol,
        _valBolLs = valBolLs,
        super(firestoreUtilData);

  // "ValStr" field.
  String? _valStr;
  String get valStr => _valStr ?? '';
  set valStr(String? val) => _valStr = val;

  bool hasValStr() => _valStr != null;

  // "ValStrLs" field.
  List<String>? _valStrLs;
  List<String> get valStrLs => _valStrLs ?? const [];
  set valStrLs(List<String>? val) => _valStrLs = val;

  void updateValStrLs(Function(List<String>) updateFn) {
    updateFn(_valStrLs ??= []);
  }

  bool hasValStrLs() => _valStrLs != null;

  // "ValInt" field.
  int? _valInt;
  int get valInt => _valInt ?? 0;
  set valInt(int? val) => _valInt = val;

  void incrementValInt(int amount) => valInt = valInt + amount;

  bool hasValInt() => _valInt != null;

  // "ValIntLs" field.
  List<int>? _valIntLs;
  List<int> get valIntLs => _valIntLs ?? const [];
  set valIntLs(List<int>? val) => _valIntLs = val;

  void updateValIntLs(Function(List<int>) updateFn) {
    updateFn(_valIntLs ??= []);
  }

  bool hasValIntLs() => _valIntLs != null;

  // "ValFloat" field.
  double? _valFloat;
  double get valFloat => _valFloat ?? 0.0;
  set valFloat(double? val) => _valFloat = val;

  void incrementValFloat(double amount) => valFloat = valFloat + amount;

  bool hasValFloat() => _valFloat != null;

  // "ValFloatLs" field.
  List<double>? _valFloatLs;
  List<double> get valFloatLs => _valFloatLs ?? const [];
  set valFloatLs(List<double>? val) => _valFloatLs = val;

  void updateValFloatLs(Function(List<double>) updateFn) {
    updateFn(_valFloatLs ??= []);
  }

  bool hasValFloatLs() => _valFloatLs != null;

  // "ValBol" field.
  bool? _valBol;
  bool get valBol => _valBol ?? false;
  set valBol(bool? val) => _valBol = val;

  bool hasValBol() => _valBol != null;

  // "ValBolLs" field.
  List<bool>? _valBolLs;
  List<bool> get valBolLs => _valBolLs ?? const [];
  set valBolLs(List<bool>? val) => _valBolLs = val;

  void updateValBolLs(Function(List<bool>) updateFn) {
    updateFn(_valBolLs ??= []);
  }

  bool hasValBolLs() => _valBolLs != null;

  static HoldsVariousDataTypesStruct fromMap(Map<String, dynamic> data) =>
      HoldsVariousDataTypesStruct(
        valStr: data['ValStr'] as String?,
        valStrLs: getDataList(data['ValStrLs']),
        valInt: castToType<int>(data['ValInt']),
        valIntLs: getDataList(data['ValIntLs']),
        valFloat: castToType<double>(data['ValFloat']),
        valFloatLs: getDataList(data['ValFloatLs']),
        valBol: data['ValBol'] as bool?,
        valBolLs: getDataList(data['ValBolLs']),
      );

  static HoldsVariousDataTypesStruct? maybeFromMap(dynamic data) => data is Map
      ? HoldsVariousDataTypesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ValStr': _valStr,
        'ValStrLs': _valStrLs,
        'ValInt': _valInt,
        'ValIntLs': _valIntLs,
        'ValFloat': _valFloat,
        'ValFloatLs': _valFloatLs,
        'ValBol': _valBol,
        'ValBolLs': _valBolLs,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ValStr': serializeParam(
          _valStr,
          ParamType.String,
        ),
        'ValStrLs': serializeParam(
          _valStrLs,
          ParamType.String,
          isList: true,
        ),
        'ValInt': serializeParam(
          _valInt,
          ParamType.int,
        ),
        'ValIntLs': serializeParam(
          _valIntLs,
          ParamType.int,
          isList: true,
        ),
        'ValFloat': serializeParam(
          _valFloat,
          ParamType.double,
        ),
        'ValFloatLs': serializeParam(
          _valFloatLs,
          ParamType.double,
          isList: true,
        ),
        'ValBol': serializeParam(
          _valBol,
          ParamType.bool,
        ),
        'ValBolLs': serializeParam(
          _valBolLs,
          ParamType.bool,
          isList: true,
        ),
      }.withoutNulls;

  static HoldsVariousDataTypesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      HoldsVariousDataTypesStruct(
        valStr: deserializeParam(
          data['ValStr'],
          ParamType.String,
          false,
        ),
        valStrLs: deserializeParam<String>(
          data['ValStrLs'],
          ParamType.String,
          true,
        ),
        valInt: deserializeParam(
          data['ValInt'],
          ParamType.int,
          false,
        ),
        valIntLs: deserializeParam<int>(
          data['ValIntLs'],
          ParamType.int,
          true,
        ),
        valFloat: deserializeParam(
          data['ValFloat'],
          ParamType.double,
          false,
        ),
        valFloatLs: deserializeParam<double>(
          data['ValFloatLs'],
          ParamType.double,
          true,
        ),
        valBol: deserializeParam(
          data['ValBol'],
          ParamType.bool,
          false,
        ),
        valBolLs: deserializeParam<bool>(
          data['ValBolLs'],
          ParamType.bool,
          true,
        ),
      );

  @override
  String toString() => 'HoldsVariousDataTypesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is HoldsVariousDataTypesStruct &&
        valStr == other.valStr &&
        listEquality.equals(valStrLs, other.valStrLs) &&
        valInt == other.valInt &&
        listEquality.equals(valIntLs, other.valIntLs) &&
        valFloat == other.valFloat &&
        listEquality.equals(valFloatLs, other.valFloatLs) &&
        valBol == other.valBol &&
        listEquality.equals(valBolLs, other.valBolLs);
  }

  @override
  int get hashCode => const ListEquality().hash([
        valStr,
        valStrLs,
        valInt,
        valIntLs,
        valFloat,
        valFloatLs,
        valBol,
        valBolLs
      ]);
}

HoldsVariousDataTypesStruct createHoldsVariousDataTypesStruct({
  String? valStr,
  int? valInt,
  double? valFloat,
  bool? valBol,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HoldsVariousDataTypesStruct(
      valStr: valStr,
      valInt: valInt,
      valFloat: valFloat,
      valBol: valBol,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HoldsVariousDataTypesStruct? updateHoldsVariousDataTypesStruct(
  HoldsVariousDataTypesStruct? holdsVariousDataTypes, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    holdsVariousDataTypes
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHoldsVariousDataTypesStructData(
  Map<String, dynamic> firestoreData,
  HoldsVariousDataTypesStruct? holdsVariousDataTypes,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (holdsVariousDataTypes == null) {
    return;
  }
  if (holdsVariousDataTypes.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      holdsVariousDataTypes.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final holdsVariousDataTypesData = getHoldsVariousDataTypesFirestoreData(
      holdsVariousDataTypes, forFieldValue);
  final nestedData =
      holdsVariousDataTypesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      holdsVariousDataTypes.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHoldsVariousDataTypesFirestoreData(
  HoldsVariousDataTypesStruct? holdsVariousDataTypes, [
  bool forFieldValue = false,
]) {
  if (holdsVariousDataTypes == null) {
    return {};
  }
  final firestoreData = mapToFirestore(holdsVariousDataTypes.toMap());

  // Add any Firestore field values
  holdsVariousDataTypes.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHoldsVariousDataTypesListFirestoreData(
  List<HoldsVariousDataTypesStruct>? holdsVariousDataTypess,
) =>
    holdsVariousDataTypess
        ?.map((e) => getHoldsVariousDataTypesFirestoreData(e, true))
        .toList() ??
    [];
