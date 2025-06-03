import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

setUpLocator() {
  GetIt.I.registerLazySingleton(ScrollController.new);
}
