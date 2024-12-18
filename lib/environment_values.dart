import 'dart:convert';
import 'package:flutter/services.dart';

class FFDevEnvironmentValues {
  static const String currentEnvironment = 'Production';
  static const String environmentValuesPath =
      'assets/environment_values/environment.json';

  static final FFDevEnvironmentValues _instance =
      FFDevEnvironmentValues._internal();

  factory FFDevEnvironmentValues() {
    return _instance;
  }

  FFDevEnvironmentValues._internal();

  Future<void> initialize() async {
    try {
      final String response =
          await rootBundle.loadString(environmentValuesPath);
      final data = await json.decode(response);
      _itemExpiration = data['itemExpiration'];
      _sessionTimeOut = data['sessionTimeOut'];
      _distanceToView = data['distanceToView'];
      _chatLimit = data['chatLimit'];
    } catch (e) {
      print('Error loading environment values: $e');
    }
  }

  int _itemExpiration = 0;
  int get itemExpiration => _itemExpiration;

  double _sessionTimeOut = 0.0;
  double get sessionTimeOut => _sessionTimeOut;

  int _distanceToView = 0;
  int get distanceToView => _distanceToView;

  int _chatLimit = 0;
  int get chatLimit => _chatLimit;
}
