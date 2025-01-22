import 'package:flutter/material.dart';

class OrphanageNoticeViewModel extends ChangeNotifier {
  bool isTaxBenefitChecked = false;
  bool isDonationChecked = false;
  bool isPersonalInfoChecked = false;
  bool isContactInfoChecked = false;

  bool get isAllChecked =>
      isTaxBenefitChecked &&
          isDonationChecked &&
          isPersonalInfoChecked &&
          isContactInfoChecked;

  void updateTaxBenefitChecked(bool value) {
    isTaxBenefitChecked = value;
    notifyListeners();
  }

  void updateDonationChecked(bool value) {
    isDonationChecked = value;
    notifyListeners();
  }

  void updatePersonalInfoChecked(bool value) {
    isPersonalInfoChecked = value;
    notifyListeners();
  }

  void updateContactInfoChecked(bool value) {
    isContactInfoChecked = value;
    notifyListeners();
  }
}
