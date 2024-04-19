import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'app.dart';

void main() {
  // Todo: Initialize Authentication Login and Register
  // Todo: Init Payment Methods
  // Todo: Add Widgets Binding
  // Todo: Init Local Storage
  // Todo: Add Widgets Binding

  // Todo: Initialize Firebase
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Load all the Material Design / Themes / Localizations / Bindings
// Delay for 2 seconds and then continue with runApp()
  Future.delayed(const Duration(seconds: 1), () {
    // FlutterNativeSplash.remove();
    runApp(const App());
  });
}
