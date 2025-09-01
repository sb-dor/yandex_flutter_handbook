import 'package:flutter/material.dart';
import 'package:yandex_flutter_handbook/exception_handling/main_exh.dart';
import 'package:yandex_flutter_handbook/exception_handling/src/bloc/exception_handling_test_bloc.dart';

class ExceptionHandlingWidget extends StatefulWidget {
  const ExceptionHandlingWidget({super.key});

  @override
  State<ExceptionHandlingWidget> createState() => _ExceptionHandlingWidgetState();
}

class _ExceptionHandlingWidgetState extends State<ExceptionHandlingWidget> {
  late final ExceptionHandlingTestBloc _exceptionHandlingTestBloc;

  @override
  void initState() {
    super.initState();
    _exceptionHandlingTestBloc = ExceptionHandlingTestBloc(
      iExceptionHandlingRepository: exceptionHandlingRepository(),
    );
    _exceptionHandlingTestBloc.add(ExceptionHandlingTestEvent.requestData());
  }

  @override
  void dispose() {
    _exceptionHandlingTestBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _ExceptionHandlerWidget();
  }
}

class _ExceptionHandlerWidget extends StatelessWidget {
  const _ExceptionHandlerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Test")));
  }
}
