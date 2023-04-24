import 'package:examflutteradvanced/screen/modal/home_modal.dart';
import 'package:flutter/material.dart';

import '../../ulitis/api_helper.dart';

class CovidProvider extends ChangeNotifier{
  ApiHelper apiHelper = ApiHelper();
  CovidModal covidModal = CovidModal();
  TextEditingController countryc = TextEditingController();
  String country = "india";

  Future<void> coronaApiGet() async {
    var response = await apiHelper.coronaApiCall(country);
    covidModal = response!;
    notifyListeners();
  }

  void search() {
    country = countryc.text;
    notifyListeners();
  }
}

