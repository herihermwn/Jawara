// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../core/service/services.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final servicesModule = _$ServicesModule();
  gh.lazySingleton<AwesomeDialogService>(
      () => servicesModule.awesomeDialogService);
  gh.lazySingleton<ImagePickerService>(() => servicesModule.imagePickerService);
  gh.lazySingleton<NavigatorService>(() => servicesModule.navigatorService);
  return get;
}

class _$ServicesModule extends ServicesModule {
  @override
  AwesomeDialogService get awesomeDialogService => AwesomeDialogService();
  @override
  ImagePickerService get imagePickerService => ImagePickerService();
  @override
  NavigatorService get navigatorService => NavigatorService();
}
