import 'package:get_it/get_it.dart';
import 'feature/expenses/models/category_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => CategoryService());
}
