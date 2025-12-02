import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quickservice/src/core/config/config.dart';
import 'package:quickservice/src/core/constant/loading_state.dart';
import 'package:quickservice/src/features/provider_list_screen/model/provider_model.dart';



final serviceProvider = ChangeNotifierProvider<ProviderController>((ref) {
  return ProviderController(
    ref: ref,
  );
});

class ProviderController extends BaseController {
  final Ref ref;

  ProviderController({required this.ref});

   List<Providers> providersModel = [];
   List<Providers> filteredProviders = [];

   Future<void> loadProviders() async {
     loadingState = LoadingState.loading;
     await Future.delayed(const Duration(seconds: 1));
     providersModel = providers;

      filteredProviders = List.from(providersModel);
      loadingState = LoadingState.idle;
       notifyListeners();
   }

   void filterProviders(String query) {
     final searchQuery = query.toLowerCase();
     if (providersModel.isNotEmpty) {
       filteredProviders = providersModel.where((provider) {
         return provider.name.toLowerCase().contains(searchQuery);
       }).toList();
     } else {
       filteredProviders = [];
     }
     notifyListeners();
   } 
}