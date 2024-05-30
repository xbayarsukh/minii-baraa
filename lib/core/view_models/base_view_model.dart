import 'package:flutter/material.dart';

enum ViewState { idle, busy, error, done }

class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  String? _message;
  String? get message => _message;
  void setMessage(String message) {
    _message = message;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
