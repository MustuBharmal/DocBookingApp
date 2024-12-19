import 'package:get_storage/get_storage.dart';

abstract class StorageUtil {
  static const String _tokenKey = 'token';
  static const String _userDataKey = 'userData';
  static const String _userIdKey = 'userID';
  static GetStorage storage = GetStorage();

  static String? getToken() {
    if (storage.hasData(_tokenKey)) {
      return storage.read(_tokenKey);
    }
    return null;
  }

  static String? getUserData() {
    if (storage.hasData(_userDataKey)) {
      return storage.read(_userDataKey);
    }
    return null;
  }

  static String? getUserId() {
    if (storage.hasData(_userIdKey)) {
      return storage.read(_userIdKey).toString();
    }
    return null;
  }

  static writeUserId(String value) {
    storage.write(_userIdKey, value);
  }

  static writeToken(String value) {
    storage.write(_tokenKey, value);
  }

  static writeUserData(String value) {
    storage.write(_userDataKey, value);
  }

  static deleteUserId() {
    storage.remove(_userIdKey);
  }

  static deleteToken() {
    storage.remove(_tokenKey);
  }

  static deleteUserData() {
    storage.remove(_userDataKey);
  }
}
