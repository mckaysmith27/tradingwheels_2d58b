import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_nodataapijsonfail') != null) {
        try {
          _nodataapijsonfail = jsonDecode(
              await secureStorage.getString('ff_nodataapijsonfail') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _isUserAuthorized = await secureStorage.getBool('ff_isUserAuthorized') ??
          _isUserAuthorized;
    });
    await _safeInitAsync(() async {
      _uidStr = await secureStorage.getString('ff_uidStr') ?? _uidStr;
    });
    await _safeInitAsync(() async {
      _usersDocRef = (await secureStorage.getString('ff_usersDocRef'))?.ref ??
          _usersDocRef;
    });
    await _safeInitAsync(() async {
      _emptyList =
          await secureStorage.getStringList('ff_emptyList') ?? _emptyList;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_BalsDicts') != null) {
        try {
          _BalsDicts =
              jsonDecode(await secureStorage.getString('ff_BalsDicts') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _mathStrsLs =
          await secureStorage.getStringList('ff_mathStrsLs') ?? _mathStrsLs;
    });
    await _safeInitAsync(() async {
      _currBal = await secureStorage.getDouble('ff_currBal') ?? _currBal;
    });
    await _safeInitAsync(() async {
      _dlyBal = await secureStorage.getDouble('ff_dlyBal') ?? _dlyBal;
    });
    await _safeInitAsync(() async {
      _origBal = await secureStorage.getDouble('ff_origBal') ?? _origBal;
    });
    await _safeInitAsync(() async {
      _sizeUnits = await secureStorage.getInt('ff_sizeUnits') ?? _sizeUnits;
    });
    await _safeInitAsync(() async {
      _instrument =
          await secureStorage.getString('ff_instrument') ?? _instrument;
    });
    await _safeInitAsync(() async {
      _instruments =
          await secureStorage.getStringList('ff_instruments') ?? _instruments;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_OrderSettingsJsonBackUp') != null) {
        try {
          _OrderSettingsJsonBackUp = jsonDecode(
              await secureStorage.getString('ff_OrderSettingsJsonBackUp') ??
                  '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _BoolCurrBal =
          await secureStorage.getBool('ff_BoolCurrBal') ?? _BoolCurrBal;
    });
    await _safeInitAsync(() async {
      _BoolSzUnits =
          await secureStorage.getBool('ff_BoolSzUnits') ?? _BoolSzUnits;
    });
    await _safeInitAsync(() async {
      _BoolDlyBal = await secureStorage.getBool('ff_BoolDlyBal') ?? _BoolDlyBal;
    });
    await _safeInitAsync(() async {
      _boolOrigBal =
          await secureStorage.getBool('ff_boolOrigBal') ?? _boolOrigBal;
    });
    await _safeInitAsync(() async {
      _boolBroker = await secureStorage.getBool('ff_boolBroker') ?? _boolBroker;
    });
    await _safeInitAsync(() async {
      _boolType = await secureStorage.getString('ff_boolType') ?? _boolType;
    });
    await _safeInitAsync(() async {
      _currBalManual =
          await secureStorage.getDouble('ff_currBalManual') ?? _currBalManual;
    });
    await _safeInitAsync(() async {
      _dlyBalManual =
          await secureStorage.getDouble('ff_dlyBalManual') ?? _dlyBalManual;
    });
    await _safeInitAsync(() async {
      _origBalManual =
          await secureStorage.getDouble('ff_origBalManual') ?? _origBalManual;
    });
    await _safeInitAsync(() async {
      _sizeUnitsManual =
          await secureStorage.getInt('ff_sizeUnitsManual') ?? _sizeUnitsManual;
    });
    await _safeInitAsync(() async {
      _ListofDictObjs =
          (await secureStorage.getStringList('ff_ListofDictObjs'))?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _ListofDictObjs;
    });
    await _safeInitAsync(() async {
      _BoolListofDictObjs =
          await secureStorage.getBool('ff_BoolListofDictObjs') ??
              _BoolListofDictObjs;
    });
    await _safeInitAsync(() async {
      _showChartBool =
          await secureStorage.getBool('ff_showChartBool') ?? _showChartBool;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _MC = '';
  String get MC => _MC;
  set MC(String value) {
    _MC = value;
  }

  String _prevMC = '';
  String get prevMC => _prevMC;
  set prevMC(String value) {
    _prevMC = value;
  }

  String _nextMC = '';
  String get nextMC => _nextMC;
  set nextMC(String value) {
    _nextMC = value;
  }

  bool _quickcharts = false;
  bool get quickcharts => _quickcharts;
  set quickcharts(bool value) {
    _quickcharts = value;
  }

  dynamic _nodataapijsonfail = jsonDecode(
      '{\"no_data_bc_api_cond_fail\":\"again, no_data_bc_api_cond_fail\"}');
  dynamic get nodataapijsonfail => _nodataapijsonfail;
  set nodataapijsonfail(dynamic value) {
    _nodataapijsonfail = value;
    secureStorage.setString('ff_nodataapijsonfail', jsonEncode(value));
  }

  void deleteNodataapijsonfail() {
    secureStorage.delete(key: 'ff_nodataapijsonfail');
  }

  String _phaseTypeIntervention = 'intervention';
  String get phaseTypeIntervention => _phaseTypeIntervention;
  set phaseTypeIntervention(String value) {
    _phaseTypeIntervention = value;
  }

  String _phaseTypeRoutine = 'routine';
  String get phaseTypeRoutine => _phaseTypeRoutine;
  set phaseTypeRoutine(String value) {
    _phaseTypeRoutine = value;
  }

  dynamic _phaseTypes =
      jsonDecode('{\"phase_types\":[\"routine\",\"intervention\"]}');
  dynamic get phaseTypes => _phaseTypes;
  set phaseTypes(dynamic value) {
    _phaseTypes = value;
  }

  String _rtdbUID = '';
  String get rtdbUID => _rtdbUID;
  set rtdbUID(String value) {
    _rtdbUID = value;
  }

  bool _isUserAuthorized = false;
  bool get isUserAuthorized => _isUserAuthorized;
  set isUserAuthorized(bool value) {
    _isUserAuthorized = value;
    secureStorage.setBool('ff_isUserAuthorized', value);
  }

  void deleteIsUserAuthorized() {
    secureStorage.delete(key: 'ff_isUserAuthorized');
  }

  String _uidStr = '';
  String get uidStr => _uidStr;
  set uidStr(String value) {
    _uidStr = value;
    secureStorage.setString('ff_uidStr', value);
  }

  void deleteUidStr() {
    secureStorage.delete(key: 'ff_uidStr');
  }

  DocumentReference? _usersDocRef;
  DocumentReference? get usersDocRef => _usersDocRef;
  set usersDocRef(DocumentReference? value) {
    _usersDocRef = value;
    value != null
        ? secureStorage.setString('ff_usersDocRef', value.path)
        : secureStorage.remove('ff_usersDocRef');
  }

  void deleteUsersDocRef() {
    secureStorage.delete(key: 'ff_usersDocRef');
  }

  List<String> _emptyList = [];
  List<String> get emptyList => _emptyList;
  set emptyList(List<String> value) {
    _emptyList = value;
    secureStorage.setStringList('ff_emptyList', value);
  }

  void deleteEmptyList() {
    secureStorage.delete(key: 'ff_emptyList');
  }

  void addToEmptyList(String value) {
    emptyList.add(value);
    secureStorage.setStringList('ff_emptyList', _emptyList);
  }

  void removeFromEmptyList(String value) {
    emptyList.remove(value);
    secureStorage.setStringList('ff_emptyList', _emptyList);
  }

  void removeAtIndexFromEmptyList(int index) {
    emptyList.removeAt(index);
    secureStorage.setStringList('ff_emptyList', _emptyList);
  }

  void updateEmptyListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    emptyList[index] = updateFn(_emptyList[index]);
    secureStorage.setStringList('ff_emptyList', _emptyList);
  }

  void insertAtIndexInEmptyList(int index, String value) {
    emptyList.insert(index, value);
    secureStorage.setStringList('ff_emptyList', _emptyList);
  }

  String _batchid = '';
  String get batchid => _batchid;
  set batchid(String value) {
    _batchid = value;
  }

  int _index = 0;
  int get index => _index;
  set index(int value) {
    _index = value;
  }

  String _originalObjRef = '';
  String get originalObjRef => _originalObjRef;
  set originalObjRef(String value) {
    _originalObjRef = value;
  }

  String _ObjRef = '';
  String get ObjRef => _ObjRef;
  set ObjRef(String value) {
    _ObjRef = value;
  }

  dynamic _postUserInputData;
  dynamic get postUserInputData => _postUserInputData;
  set postUserInputData(dynamic value) {
    _postUserInputData = value;
  }

  dynamic _jsonHolder;
  dynamic get jsonHolder => _jsonHolder;
  set jsonHolder(dynamic value) {
    _jsonHolder = value;
  }

  String _type = '';
  String get type => _type;
  set type(String value) {
    _type = value;
  }

  bool _showColumn = false;
  bool get showColumn => _showColumn;
  set showColumn(bool value) {
    _showColumn = value;
  }

  String _selectedKey = '';
  String get selectedKey => _selectedKey;
  set selectedKey(String value) {
    _selectedKey = value;
  }

  String _selectedValue = '';
  String get selectedValue => _selectedValue;
  set selectedValue(String value) {
    _selectedValue = value;
  }

  List<String> _UploadedCsvTimestampStrs = [];
  List<String> get UploadedCsvTimestampStrs => _UploadedCsvTimestampStrs;
  set UploadedCsvTimestampStrs(List<String> value) {
    _UploadedCsvTimestampStrs = value;
  }

  void addToUploadedCsvTimestampStrs(String value) {
    UploadedCsvTimestampStrs.add(value);
  }

  void removeFromUploadedCsvTimestampStrs(String value) {
    UploadedCsvTimestampStrs.remove(value);
  }

  void removeAtIndexFromUploadedCsvTimestampStrs(int index) {
    UploadedCsvTimestampStrs.removeAt(index);
  }

  void updateUploadedCsvTimestampStrsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    UploadedCsvTimestampStrs[index] =
        updateFn(_UploadedCsvTimestampStrs[index]);
  }

  void insertAtIndexInUploadedCsvTimestampStrs(int index, String value) {
    UploadedCsvTimestampStrs.insert(index, value);
  }

  List<String> _UploadedCsvDocStrs = [];
  List<String> get UploadedCsvDocStrs => _UploadedCsvDocStrs;
  set UploadedCsvDocStrs(List<String> value) {
    _UploadedCsvDocStrs = value;
  }

  void addToUploadedCsvDocStrs(String value) {
    UploadedCsvDocStrs.add(value);
  }

  void removeFromUploadedCsvDocStrs(String value) {
    UploadedCsvDocStrs.remove(value);
  }

  void removeAtIndexFromUploadedCsvDocStrs(int index) {
    UploadedCsvDocStrs.removeAt(index);
  }

  void updateUploadedCsvDocStrsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    UploadedCsvDocStrs[index] = updateFn(_UploadedCsvDocStrs[index]);
  }

  void insertAtIndexInUploadedCsvDocStrs(int index, String value) {
    UploadedCsvDocStrs.insert(index, value);
  }

  List<DocumentReference> _selectedDocuments = [];
  List<DocumentReference> get selectedDocuments => _selectedDocuments;
  set selectedDocuments(List<DocumentReference> value) {
    _selectedDocuments = value;
  }

  void addToSelectedDocuments(DocumentReference value) {
    selectedDocuments.add(value);
  }

  void removeFromSelectedDocuments(DocumentReference value) {
    selectedDocuments.remove(value);
  }

  void removeAtIndexFromSelectedDocuments(int index) {
    selectedDocuments.removeAt(index);
  }

  void updateSelectedDocumentsAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    selectedDocuments[index] = updateFn(_selectedDocuments[index]);
  }

  void insertAtIndexInSelectedDocuments(int index, DocumentReference value) {
    selectedDocuments.insert(index, value);
  }

  String _csvContent = 'NA';
  String get csvContent => _csvContent;
  set csvContent(String value) {
    _csvContent = value;
  }

  dynamic _jsonContent = jsonDecode('{}');
  dynamic get jsonContent => _jsonContent;
  set jsonContent(dynamic value) {
    _jsonContent = value;
  }

  bool _displayTags = false;
  bool get displayTags => _displayTags;
  set displayTags(bool value) {
    _displayTags = value;
  }

  bool _displayLogs = false;
  bool get displayLogs => _displayLogs;
  set displayLogs(bool value) {
    _displayLogs = value;
  }

  String _dbKey = '';
  String get dbKey => _dbKey;
  set dbKey(String value) {
    _dbKey = value;
  }

  String _dbValStr = '';
  String get dbValStr => _dbValStr;
  set dbValStr(String value) {
    _dbValStr = value;
  }

  List<String> _dbValStrLs = [];
  List<String> get dbValStrLs => _dbValStrLs;
  set dbValStrLs(List<String> value) {
    _dbValStrLs = value;
  }

  void addToDbValStrLs(String value) {
    dbValStrLs.add(value);
  }

  void removeFromDbValStrLs(String value) {
    dbValStrLs.remove(value);
  }

  void removeAtIndexFromDbValStrLs(int index) {
    dbValStrLs.removeAt(index);
  }

  void updateDbValStrLsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    dbValStrLs[index] = updateFn(_dbValStrLs[index]);
  }

  void insertAtIndexInDbValStrLs(int index, String value) {
    dbValStrLs.insert(index, value);
  }

  double _dbValFloat = 0.0;
  double get dbValFloat => _dbValFloat;
  set dbValFloat(double value) {
    _dbValFloat = value;
  }

  List<double> _dbValFloatLs = [];
  List<double> get dbValFloatLs => _dbValFloatLs;
  set dbValFloatLs(List<double> value) {
    _dbValFloatLs = value;
  }

  void addToDbValFloatLs(double value) {
    dbValFloatLs.add(value);
  }

  void removeFromDbValFloatLs(double value) {
    dbValFloatLs.remove(value);
  }

  void removeAtIndexFromDbValFloatLs(int index) {
    dbValFloatLs.removeAt(index);
  }

  void updateDbValFloatLsAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    dbValFloatLs[index] = updateFn(_dbValFloatLs[index]);
  }

  void insertAtIndexInDbValFloatLs(int index, double value) {
    dbValFloatLs.insert(index, value);
  }

  int _dbValInt = 0;
  int get dbValInt => _dbValInt;
  set dbValInt(int value) {
    _dbValInt = value;
  }

  List<int> _dbValIntLs = [];
  List<int> get dbValIntLs => _dbValIntLs;
  set dbValIntLs(List<int> value) {
    _dbValIntLs = value;
  }

  void addToDbValIntLs(int value) {
    dbValIntLs.add(value);
  }

  void removeFromDbValIntLs(int value) {
    dbValIntLs.remove(value);
  }

  void removeAtIndexFromDbValIntLs(int index) {
    dbValIntLs.removeAt(index);
  }

  void updateDbValIntLsAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    dbValIntLs[index] = updateFn(_dbValIntLs[index]);
  }

  void insertAtIndexInDbValIntLs(int index, int value) {
    dbValIntLs.insert(index, value);
  }

  bool _dbValBol = false;
  bool get dbValBol => _dbValBol;
  set dbValBol(bool value) {
    _dbValBol = value;
  }

  List<bool> _dbValBolLs = [];
  List<bool> get dbValBolLs => _dbValBolLs;
  set dbValBolLs(List<bool> value) {
    _dbValBolLs = value;
  }

  void addToDbValBolLs(bool value) {
    dbValBolLs.add(value);
  }

  void removeFromDbValBolLs(bool value) {
    dbValBolLs.remove(value);
  }

  void removeAtIndexFromDbValBolLs(int index) {
    dbValBolLs.removeAt(index);
  }

  void updateDbValBolLsAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    dbValBolLs[index] = updateFn(_dbValBolLs[index]);
  }

  void insertAtIndexInDbValBolLs(int index, bool value) {
    dbValBolLs.insert(index, value);
  }

  bool _KeyValAdderDropDownSet = false;
  bool get KeyValAdderDropDownSet => _KeyValAdderDropDownSet;
  set KeyValAdderDropDownSet(bool value) {
    _KeyValAdderDropDownSet = value;
  }

  bool _AddNewKeyVal = false;
  bool get AddNewKeyVal => _AddNewKeyVal;
  set AddNewKeyVal(bool value) {
    _AddNewKeyVal = value;
  }

  dynamic _BalsDicts;
  dynamic get BalsDicts => _BalsDicts;
  set BalsDicts(dynamic value) {
    _BalsDicts = value;
    secureStorage.setString('ff_BalsDicts', jsonEncode(value));
  }

  void deleteBalsDicts() {
    secureStorage.delete(key: 'ff_BalsDicts');
  }

  List<String> _mathStrsLs = [];
  List<String> get mathStrsLs => _mathStrsLs;
  set mathStrsLs(List<String> value) {
    _mathStrsLs = value;
    secureStorage.setStringList('ff_mathStrsLs', value);
  }

  void deleteMathStrsLs() {
    secureStorage.delete(key: 'ff_mathStrsLs');
  }

  void addToMathStrsLs(String value) {
    mathStrsLs.add(value);
    secureStorage.setStringList('ff_mathStrsLs', _mathStrsLs);
  }

  void removeFromMathStrsLs(String value) {
    mathStrsLs.remove(value);
    secureStorage.setStringList('ff_mathStrsLs', _mathStrsLs);
  }

  void removeAtIndexFromMathStrsLs(int index) {
    mathStrsLs.removeAt(index);
    secureStorage.setStringList('ff_mathStrsLs', _mathStrsLs);
  }

  void updateMathStrsLsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    mathStrsLs[index] = updateFn(_mathStrsLs[index]);
    secureStorage.setStringList('ff_mathStrsLs', _mathStrsLs);
  }

  void insertAtIndexInMathStrsLs(int index, String value) {
    mathStrsLs.insert(index, value);
    secureStorage.setStringList('ff_mathStrsLs', _mathStrsLs);
  }

  double _currBal = 0.0;
  double get currBal => _currBal;
  set currBal(double value) {
    _currBal = value;
    secureStorage.setDouble('ff_currBal', value);
  }

  void deleteCurrBal() {
    secureStorage.delete(key: 'ff_currBal');
  }

  double _dlyBal = 0.0;
  double get dlyBal => _dlyBal;
  set dlyBal(double value) {
    _dlyBal = value;
    secureStorage.setDouble('ff_dlyBal', value);
  }

  void deleteDlyBal() {
    secureStorage.delete(key: 'ff_dlyBal');
  }

  double _origBal = 0.0;
  double get origBal => _origBal;
  set origBal(double value) {
    _origBal = value;
    secureStorage.setDouble('ff_origBal', value);
  }

  void deleteOrigBal() {
    secureStorage.delete(key: 'ff_origBal');
  }

  int _sizeUnits = 0;
  int get sizeUnits => _sizeUnits;
  set sizeUnits(int value) {
    _sizeUnits = value;
    secureStorage.setInt('ff_sizeUnits', value);
  }

  void deleteSizeUnits() {
    secureStorage.delete(key: 'ff_sizeUnits');
  }

  String _instrument = '';
  String get instrument => _instrument;
  set instrument(String value) {
    _instrument = value;
    secureStorage.setString('ff_instrument', value);
  }

  void deleteInstrument() {
    secureStorage.delete(key: 'ff_instrument');
  }

  List<String> _instruments = [];
  List<String> get instruments => _instruments;
  set instruments(List<String> value) {
    _instruments = value;
    secureStorage.setStringList('ff_instruments', value);
  }

  void deleteInstruments() {
    secureStorage.delete(key: 'ff_instruments');
  }

  void addToInstruments(String value) {
    instruments.add(value);
    secureStorage.setStringList('ff_instruments', _instruments);
  }

  void removeFromInstruments(String value) {
    instruments.remove(value);
    secureStorage.setStringList('ff_instruments', _instruments);
  }

  void removeAtIndexFromInstruments(int index) {
    instruments.removeAt(index);
    secureStorage.setStringList('ff_instruments', _instruments);
  }

  void updateInstrumentsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    instruments[index] = updateFn(_instruments[index]);
    secureStorage.setStringList('ff_instruments', _instruments);
  }

  void insertAtIndexInInstruments(int index, String value) {
    instruments.insert(index, value);
    secureStorage.setStringList('ff_instruments', _instruments);
  }

  dynamic _OrderSettingsJsonBackUp;
  dynamic get OrderSettingsJsonBackUp => _OrderSettingsJsonBackUp;
  set OrderSettingsJsonBackUp(dynamic value) {
    _OrderSettingsJsonBackUp = value;
    secureStorage.setString('ff_OrderSettingsJsonBackUp', jsonEncode(value));
  }

  void deleteOrderSettingsJsonBackUp() {
    secureStorage.delete(key: 'ff_OrderSettingsJsonBackUp');
  }

  dynamic _OrderSettingsJsonCurrent;
  dynamic get OrderSettingsJsonCurrent => _OrderSettingsJsonCurrent;
  set OrderSettingsJsonCurrent(dynamic value) {
    _OrderSettingsJsonCurrent = value;
  }

  dynamic _OrderSettingsJson;
  dynamic get OrderSettingsJson => _OrderSettingsJson;
  set OrderSettingsJson(dynamic value) {
    _OrderSettingsJson = value;
  }

  dynamic _OrderSettingsJsonPgLoad;
  dynamic get OrderSettingsJsonPgLoad => _OrderSettingsJsonPgLoad;
  set OrderSettingsJsonPgLoad(dynamic value) {
    _OrderSettingsJsonPgLoad = value;
  }

  bool _ValueFalse = false;
  bool get ValueFalse => _ValueFalse;
  set ValueFalse(bool value) {
    _ValueFalse = value;
  }

  bool _BoolCurrBal = false;
  bool get BoolCurrBal => _BoolCurrBal;
  set BoolCurrBal(bool value) {
    _BoolCurrBal = value;
    secureStorage.setBool('ff_BoolCurrBal', value);
  }

  void deleteBoolCurrBal() {
    secureStorage.delete(key: 'ff_BoolCurrBal');
  }

  bool _BoolSzUnits = false;
  bool get BoolSzUnits => _BoolSzUnits;
  set BoolSzUnits(bool value) {
    _BoolSzUnits = value;
    secureStorage.setBool('ff_BoolSzUnits', value);
  }

  void deleteBoolSzUnits() {
    secureStorage.delete(key: 'ff_BoolSzUnits');
  }

  bool _BoolDlyBal = false;
  bool get BoolDlyBal => _BoolDlyBal;
  set BoolDlyBal(bool value) {
    _BoolDlyBal = value;
    secureStorage.setBool('ff_BoolDlyBal', value);
  }

  void deleteBoolDlyBal() {
    secureStorage.delete(key: 'ff_BoolDlyBal');
  }

  bool _boolOrigBal = false;
  bool get boolOrigBal => _boolOrigBal;
  set boolOrigBal(bool value) {
    _boolOrigBal = value;
    secureStorage.setBool('ff_boolOrigBal', value);
  }

  void deleteBoolOrigBal() {
    secureStorage.delete(key: 'ff_boolOrigBal');
  }

  bool _boolBroker = false;
  bool get boolBroker => _boolBroker;
  set boolBroker(bool value) {
    _boolBroker = value;
    secureStorage.setBool('ff_boolBroker', value);
  }

  void deleteBoolBroker() {
    secureStorage.delete(key: 'ff_boolBroker');
  }

  String _boolType = '';
  String get boolType => _boolType;
  set boolType(String value) {
    _boolType = value;
    secureStorage.setString('ff_boolType', value);
  }

  void deleteBoolType() {
    secureStorage.delete(key: 'ff_boolType');
  }

  bool _BoolShowOrderPanel = false;
  bool get BoolShowOrderPanel => _BoolShowOrderPanel;
  set BoolShowOrderPanel(bool value) {
    _BoolShowOrderPanel = value;
  }

  double _currBalAuto = 0.0;
  double get currBalAuto => _currBalAuto;
  set currBalAuto(double value) {
    _currBalAuto = value;
  }

  double _currBalManual = 0.0;
  double get currBalManual => _currBalManual;
  set currBalManual(double value) {
    _currBalManual = value;
    secureStorage.setDouble('ff_currBalManual', value);
  }

  void deleteCurrBalManual() {
    secureStorage.delete(key: 'ff_currBalManual');
  }

  double _dlyBalAuto = 0.0;
  double get dlyBalAuto => _dlyBalAuto;
  set dlyBalAuto(double value) {
    _dlyBalAuto = value;
  }

  double _dlyBalManual = 0.0;
  double get dlyBalManual => _dlyBalManual;
  set dlyBalManual(double value) {
    _dlyBalManual = value;
    secureStorage.setDouble('ff_dlyBalManual', value);
  }

  void deleteDlyBalManual() {
    secureStorage.delete(key: 'ff_dlyBalManual');
  }

  double _origBalAuto = 0.0;
  double get origBalAuto => _origBalAuto;
  set origBalAuto(double value) {
    _origBalAuto = value;
  }

  double _origBalManual = 0.0;
  double get origBalManual => _origBalManual;
  set origBalManual(double value) {
    _origBalManual = value;
    secureStorage.setDouble('ff_origBalManual', value);
  }

  void deleteOrigBalManual() {
    secureStorage.delete(key: 'ff_origBalManual');
  }

  int _sizeUnitsAuto = 0;
  int get sizeUnitsAuto => _sizeUnitsAuto;
  set sizeUnitsAuto(int value) {
    _sizeUnitsAuto = value;
  }

  int _sizeUnitsManual = 0;
  int get sizeUnitsManual => _sizeUnitsManual;
  set sizeUnitsManual(int value) {
    _sizeUnitsManual = value;
    secureStorage.setInt('ff_sizeUnitsManual', value);
  }

  void deleteSizeUnitsManual() {
    secureStorage.delete(key: 'ff_sizeUnitsManual');
  }

  bool _BoolBalsSet = false;
  bool get BoolBalsSet => _BoolBalsSet;
  set BoolBalsSet(bool value) {
    _BoolBalsSet = value;
  }

  List<dynamic> _ListofDictObjs = [];
  List<dynamic> get ListofDictObjs => _ListofDictObjs;
  set ListofDictObjs(List<dynamic> value) {
    _ListofDictObjs = value;
    secureStorage.setStringList(
        'ff_ListofDictObjs', value.map((x) => jsonEncode(x)).toList());
  }

  void deleteListofDictObjs() {
    secureStorage.delete(key: 'ff_ListofDictObjs');
  }

  void addToListofDictObjs(dynamic value) {
    ListofDictObjs.add(value);
    secureStorage.setStringList('ff_ListofDictObjs',
        _ListofDictObjs.map((x) => jsonEncode(x)).toList());
  }

  void removeFromListofDictObjs(dynamic value) {
    ListofDictObjs.remove(value);
    secureStorage.setStringList('ff_ListofDictObjs',
        _ListofDictObjs.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromListofDictObjs(int index) {
    ListofDictObjs.removeAt(index);
    secureStorage.setStringList('ff_ListofDictObjs',
        _ListofDictObjs.map((x) => jsonEncode(x)).toList());
  }

  void updateListofDictObjsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    ListofDictObjs[index] = updateFn(_ListofDictObjs[index]);
    secureStorage.setStringList('ff_ListofDictObjs',
        _ListofDictObjs.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInListofDictObjs(int index, dynamic value) {
    ListofDictObjs.insert(index, value);
    secureStorage.setStringList('ff_ListofDictObjs',
        _ListofDictObjs.map((x) => jsonEncode(x)).toList());
  }

  bool _BoolListofDictObjs = false;
  bool get BoolListofDictObjs => _BoolListofDictObjs;
  set BoolListofDictObjs(bool value) {
    _BoolListofDictObjs = value;
    secureStorage.setBool('ff_BoolListofDictObjs', value);
  }

  void deleteBoolListofDictObjs() {
    secureStorage.delete(key: 'ff_BoolListofDictObjs');
  }

  bool _showChartBool = false;
  bool get showChartBool => _showChartBool;
  set showChartBool(bool value) {
    _showChartBool = value;
    secureStorage.setBool('ff_showChartBool', value);
  }

  void deleteShowChartBool() {
    secureStorage.delete(key: 'ff_showChartBool');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
