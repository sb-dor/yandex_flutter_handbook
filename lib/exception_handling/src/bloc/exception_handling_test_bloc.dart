import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_flutter_handbook/exception_handling/common/exceptions/rest_client_exception.dart';
import 'package:yandex_flutter_handbook/exception_handling/src/data/exception_handling_repository.dart';

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

  const factory ExceptionHandlingTestState.error() = ExceptionHandlingTestError;

  const factory ExceptionHandlingTestState.loaded(String data) = ExceptionHandlingTestLoaded;
}

final class ExceptionHandlingTestInitial extends ExceptionHandlingTestState {
  const ExceptionHandlingTestInitial();
}

final class ExceptionHandlingTestLoading extends ExceptionHandlingTestState {
  const ExceptionHandlingTestLoading();
}

final class ExceptionHandlingTestError extends ExceptionHandlingTestState {
  const ExceptionHandlingTestError();
}

final class ExceptionHandlingTestLoaded extends ExceptionHandlingTestState {
  const ExceptionHandlingTestLoaded(this.data);

  final String data;
}

class ExceptionHandlingTestBloc
    extends Bloc<ExceptionHandlingTestEvent, ExceptionHandlingTestState> {
  ExceptionHandlingTestBloc({required IExceptionHandlingRepository iExceptionHandlingRepository})
    : _iExceptionHandlingRepository = iExceptionHandlingRepository,
      super(ExceptionHandlingTestState.initial()) {
    //
    on<ExceptionHandlingTestEvent>(
      (event, emit) => switch (event) {
        final _RequestDataEvent event => _requestDataEvent(event, emit),
      },
    );
  }

  final IExceptionHandlingRepository _iExceptionHandlingRepository;

  void _requestDataEvent(_RequestDataEvent event, Emitter<ExceptionHandlingTestState> emit) async {
    try {
      emit(ExceptionHandlingTestState.loading());

      final test = await _iExceptionHandlingRepository.test();

      emit(ExceptionHandlingTestState.loaded("test"));
    } on UnAuthenticatedException {
      emit(ExceptionHandlingTestState.initial());
    } catch (error, stackTrace) {
      emit(ExceptionHandlingTestState.error());
      addError(error, stackTrace);
    }
  }
}
