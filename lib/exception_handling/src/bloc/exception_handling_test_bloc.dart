import 'package:flutter_bloc/flutter_bloc.dart';

sealed class ExceptionHandlingTestEvent {
  const ExceptionHandlingTestEvent();

  const factory ExceptionHandlingTestEvent.requestData() = _RequestDataEvent;
}

final class _RequestDataEvent extends ExceptionHandlingTestEvent {
  const _RequestDataEvent();
}

sealed class ExceptionHandlingTestState {
  const ExceptionHandlingTestState();

  const factory ExceptionHandlingTestState.initial() = ExceptionHandlingTestInitial;

  const factory ExceptionHandlingTestState.loading() = ExceptionHandlingTestLoading;

  const factory ExceptionHandlingTestState.loaded(String data) = ExceptionHandlingTestLoaded;
}

final class ExceptionHandlingTestInitial extends ExceptionHandlingTestState {
  const ExceptionHandlingTestInitial();
}

final class ExceptionHandlingTestLoading extends ExceptionHandlingTestState {
  const ExceptionHandlingTestLoading();
}

final class ExceptionHandlingTestLoaded extends ExceptionHandlingTestState {
  const ExceptionHandlingTestLoaded(this.data);

  final String data;
}

class ExceptionHandlingTestBloc
    extends Bloc<ExceptionHandlingTestEvent, ExceptionHandlingTestState> {
  ExceptionHandlingTestBloc() : super(ExceptionHandlingTestState.initial()) {
    //
    on<ExceptionHandlingTestEvent>(
      (event, emit) => switch (event) {
        final _RequestDataEvent event => _requestDataEvent(event, emit),
      },
    );
  }

  void _requestDataEvent(_RequestDataEvent event, Emitter<ExceptionHandlingTestState> emit) async {}
}
