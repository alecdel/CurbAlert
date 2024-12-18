import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _searchQuery = '';
  String get searchQuery => _searchQuery;
  set searchQuery(String value) {
    _searchQuery = value;
  }

  List<String> _categories = [];
  List<String> get categories => _categories;
  set categories(List<String> value) {
    _categories = value;
  }

  void addToCategories(String value) {
    categories.add(value);
  }

  void removeFromCategories(String value) {
    categories.remove(value);
  }

  void removeAtIndexFromCategories(int index) {
    categories.removeAt(index);
  }

  void updateCategoriesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    categories[index] = updateFn(_categories[index]);
  }

  void insertAtIndexInCategories(int index, String value) {
    categories.insert(index, value);
  }

  final _sellitemsManager = StreamRequestManager<List<ItemsRecord>>();
  Stream<List<ItemsRecord>> sellitems({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ItemsRecord>> Function() requestFn,
  }) =>
      _sellitemsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSellitemsCache() => _sellitemsManager.clear();
  void clearSellitemsCacheKey(String? uniqueKey) =>
      _sellitemsManager.clearRequest(uniqueKey);

  final _availableitemsManager = StreamRequestManager<List<ItemsRecord>>();
  Stream<List<ItemsRecord>> availableitems({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ItemsRecord>> Function() requestFn,
  }) =>
      _availableitemsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAvailableitemsCache() => _availableitemsManager.clear();
  void clearAvailableitemsCacheKey(String? uniqueKey) =>
      _availableitemsManager.clearRequest(uniqueKey);
}
