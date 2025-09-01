import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:yandex_flutter_handbook/exception_handling/common/bloc_observer.dart';
import 'package:yandex_flutter_handbook/exception_handling/src/data/exception_handling_datasource.dart';
import 'package:yandex_flutter_handbook/exception_handling/src/data/exception_handling_repository.dart';
import 'package:yandex_flutter_handbook/exception_handling/src/widget/exception_handling_widget.dart';

void main() async {
  final logger = Logger();
  await runZonedGuarded(
    () async {
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
  final IExceptionHandlingDatasource datasource = ExceptionHandlingDatasourceImpl();

  final IExceptionHandlingRepository repository = ExceptionHandlingRepositoryImpl(
    iExceptionHandlingDatasource: datasource,
  );

  return repository;
}
