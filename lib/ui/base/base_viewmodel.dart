import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseViewModel extends ChangeNotifier {
  late BuildContext _context;

  BuildContext get context => _context;

  setContext(BuildContext value) {
    _context = value;
  }

  final loadingSubject = BehaviorSubject<bool>.seeded(false);
  bool _isDisposed = false;

  void setLoading(bool loading) {
    if (_isDisposed) return;
    loadingSubject.add(loading);
  }

  bool get isLoading => loadingSubject.valueOrNull ?? false;

  @override
  void dispose() {
    _isDisposed = true;
    loadingSubject.close();
    super.dispose();
  }
}
