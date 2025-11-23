import 'package:quickservice/src/core/constant/loading_state.dart';
import 'package:flutter/material.dart';

class BaseController extends ChangeNotifier {
 
  BaseController();

  LoadingState _loadingState = LoadingState.idle;
  LoadingState get loadingState => _loadingState;
  set loadingState(LoadingState state) {
    _loadingState = state;
    notifyListeners();
  }
}