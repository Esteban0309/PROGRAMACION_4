import 'package:flutter/foundation.dart';

class AppState extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void inc() { _count++; notifyListeners(); }
  void reset() { _count = 0; notifyListeners(); }
}