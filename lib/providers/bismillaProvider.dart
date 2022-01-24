import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BismillaProvider with ChangeNotifier {
  SharedPreferences? _sanjay;

  // Keys
  static const String bismillaCountKey = "bismillaSanjay";
  static const String jadooCountKey = "jadooSanjay";

  // Variable Declaration
  int _bismilla = 0;
  int _jadoo = 0;

  // getters
  int get bismillaCount => _bismilla;
  int get jadooCount => _jadoo;

  void bismilla() {
    _bismilla++;
    _saveBismillaPrefs(bismilla: _bismilla);
  }
  void jadoo() {
    _jadoo++;
    _saveJadooPrefs(jadoo: _jadoo);
  }

  void reset() {
    _jadoo = 0;
    _bismilla = 0;
    _saveBismillaPrefs(bismilla: _bismilla);
    _saveJadooPrefs(jadoo: _jadoo);
  }

  void loadAll() {
    _loadBismillaPrefs();
  }

  _initPrefs() async {
    if (_sanjay == null) {
      _sanjay = await SharedPreferences.getInstance();
    }
  }
  _loadBismillaPrefs() async {
    await _initPrefs();
    _bismilla = _sanjay?.getInt(bismillaCountKey) ?? 0;
    _jadoo = _sanjay?.getInt(jadooCountKey) ?? 0;
    notifyListeners();
  }
  _saveBismillaPrefs({required int bismilla}) async {
    await _initPrefs();
    _sanjay?.setInt(bismillaCountKey, bismilla);
    await _loadBismillaPrefs();
    notifyListeners();
  }
  _saveJadooPrefs({required int jadoo}) async {
    await _initPrefs();
    _sanjay?.setInt(jadooCountKey, jadoo);
    await _loadBismillaPrefs();
    notifyListeners();
  }
}