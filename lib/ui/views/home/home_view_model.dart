import 'package:flutter/material.dart';
import 'package:flutter_starter/core/config/router.router.dart';
import 'package:flutter_starter/ui/views/home/home_controls.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:reactive_forms/reactive_forms.dart' as rf;

class HomeViewModel extends BaseViewModel{

  final NavigationService _navigationService = GetIt.I.get();
  int counter = 0;
  HomeViewModel();

  List<String> dropdownItems = ['', 'Female'];

  void incrementCounter() {
    counter++;
    notifyListeners();
  }

  void goForm(){
    _navigationService.navigateTo(Routes.sampleFormView);
  }

  void init() async {}
  
  final formGroup = rf.FormGroup({
    HomeFormControls.name : rf.FormControl<String>(validators: [rf.Validators.required]),
    HomeFormControls.dateOfBirth: rf.FormControl<DateTime>(),
    HomeFormControls.gender: rf.FormControl<String>(),
    HomeFormControls.phoneNumber: rf.FormControl<String>(validators: [rf.Validators.required]),
    HomeFormControls.email: rf.FormControl<String>(validators: [rf.Validators.required]),
  });

  void selectDate(BuildContext context) async {
    DateTime? date = DateTime(1900);
    FocusScope.of(context).requestFocus(FocusNode());

    date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    debugPrint(date!.toIso8601String());
    formGroup.control(HomeFormControls.dateOfBirth).value = date;
  }

}