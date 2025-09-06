import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:yandex_flutter_handbook/exception_handling/common/bloc_observer.dart';
import 'package:yandex_flutter_handbook/exception_handling/common/http_client.dart';
import 'package:yandex_flutter_handbook/exception_handling/src/data/exception_handling_datasource.dart';
import 'package:yandex_flutter_handbook/exception_handling/src/data/exception_handling_repository.dart';
import 'package:yandex_flutter_handbook/exception_handling/src/widget/exception_handling_widget.dart';
import 'package:yandex_flutter_handbook/simple_service_locator.dart';

// hell no
ServiceLocator getIt = ServiceLocator();

void main() async {
  final logger = Logger();
  getIt.register(logger);
  await runZonedGuarded(
    () async {
      FlutterError.onError = (error) {
        logger.e("Flutter error:", error: error, stackTrace: error.stack);
      };

      PlatformDispatcher.instance.onError = (error, stackTrace) {
        logger.e("Platform error:", error: error, stackTrace: stackTrace);
        return true;
      };
      //
      Bloc.observer = BlocObserverManager(logger: logger);
      runApp(MaterialApp(home: ExceptionHandlingWidget()));
    },
    (error, stackTrace) {
      logger.e("Error zone", error: error, stackTrace: stackTrace);
    },
  );
}

IExceptionHandlingRepository exceptionHandlingRepository() {
  final IExceptionHandlingDatasource datasource = ExceptionHandlingDatasourceImpl(
    baseHttpClient: HttpClient(),
  );

  final IExceptionHandlingRepository repository = ExceptionHandlingRepositoryImpl(
    iExceptionHandlingDatasource: datasource,
  );

  return repository;
}
