import 'package:get_it/get_it.dart';
import 'package:myportfolio/services/page_controller.dart';

setUpLocator() {
  GetIt.I.registerLazySingleton(ViewPageController.new);
}
