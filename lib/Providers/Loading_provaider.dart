import 'package:flutter/material.dart';
import 'package:myeventlyapp/core/utils/UI_Utils.dart';

class LoadingProvaider extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;
  List<String> _data = [];

  bool get isLoading => _isLoading;
  String? get error => _error;
  List<String> get data => _data;

  Future<void> fetchData() async {
    _isLoading = true;
    _error = null;
    notifyListeners(); // Notify listeners that loading has started

    try {
      // Simulate a network request or data loading
      await Future.delayed(Duration(seconds: 2));
      _data = ['Item 1', 'Item 2', 'Item 3']; // Replace with actual data
      _error = null;
    } catch (e) {
      _error = e.toString();
      _data = [];
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners that loading has finished
    }
  }
}
