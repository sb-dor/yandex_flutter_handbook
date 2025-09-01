import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocProvider.value(value: _exceptionHandlingTestBloc, child: _ExceptionHandlerWidget());
  }
}

class _ExceptionHandlerWidget extends StatelessWidget {
  const _ExceptionHandlerWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test")),
      body: CustomScrollView(
        slivers: [
          BlocBuilder<ExceptionHandlingTestBloc, ExceptionHandlingTestState>(
            builder: (context, state) {
              switch (state) {
                case ExceptionHandlingTestInitial():
                  return SliverFillRemaining(child: Center(child: Text("Initial state")));
                case ExceptionHandlingTestLoading():
                  return SliverFillRemaining(child: Center(child: CircularProgressIndicator()));
                case ExceptionHandlingTestError():
                  return SliverFillRemaining(child: Center(child: Text("Error stat")));
                case ExceptionHandlingTestLoaded():
                  return SliverFillRemaining(child: Center(child: Text(state.data)));
              }
            },
          ),
        ],
      ),
    );
  }
}
