import 'package:flutter/widgets.dart';

class ArchitectureProvider extends ChangeNotifier {
  int _displayCount = 0;

  int get displayCount => _displayCount;

  void increment() {
    _displayCount++;
    notifyListeners();
  }

  int _selectCount = 0;

  int get selectCount => _selectCount;

  void selectIncrease() {
    _selectCount++;
    notifyListeners();
  }

}
