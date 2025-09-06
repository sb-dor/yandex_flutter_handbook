import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
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

class _ExceptionHandlerWidget extends StatefulWidget {
  const _ExceptionHandlerWidget();

  @override
  State<_ExceptionHandlerWidget> createState() => _ExceptionHandlerWidgetState();
}

class _ExceptionHandlerWidgetState extends State<_ExceptionHandlerWidget> {
  late final Logger _logger;

  @override
  void initState() {
    super.initState();
    _logger = getIt.get<Logger>();
    _logger.log(Level.debug, "getting logger from getIt (hell no)");
  }

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
                  return SliverFillRemaining(
                    child: Center(
                      child: Text(
                        "Initial state: ${state.data != null ? "with message: ${state.data}" : ""}",
                      ),
                    ),
                  );
                case ExceptionHandlingTestLoading():
                  return SliverFillRemaining(child: Center(child: CircularProgressIndicator()));
                case ExceptionHandlingTestError():
                  return SliverFillRemaining(child: Center(child: Text("Error stat")));
                case ExceptionHandlingTestLoaded():
                  return SliverFillRemaining(
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          context.read<ExceptionHandlingTestBloc>().add(
                            ExceptionHandlingTestEvent.simpleFuncException(),
                          );
                        },
                        child: Text(state.data),
                      ),
                    ),
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}
