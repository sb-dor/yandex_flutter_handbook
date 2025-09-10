import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yandex_flutter_handbook/graphql_test/models/graphql_user_test.dart';
import 'package:yandex_flutter_handbook/graphql_test/repository/graphql_repository.dart';

part 'graphql_bloc.freezed.dart';

@freezed
sealed class GraphqlEvent with _$GraphqlEvent {
  const factory GraphqlEvent.getUsers() = _Graphql$GetUsersEvent;
}

@freezed
sealed class GraphqlState with _$GraphqlState {
  const factory GraphqlState.initial() = Graphql$IntialState;

  const factory GraphqlState.inProgress() = Graphql$InProgressState;

  const factory GraphqlState.error() = Graphql$ErrorState;

  const factory GraphqlState.completed(final List<GraphqlUserTest> user) = Graphql$CompletedState;
}

class GraphqlBloc extends Bloc<GraphqlEvent, GraphqlState> {
  GraphqlBloc({required IGraphqlRepository iGraphqlRepository, GraphqlState? initialState})
    : _iGraphqlRepository = iGraphqlRepository,
      super(initialState ?? const GraphqlState.initial()) {
    //
    on<GraphqlEvent>(
      (event, emit) => switch (event) {
        final _Graphql$GetUsersEvent event => _graphql$GetUsersEvent(event, emit),
      },
    );
  }

  final IGraphqlRepository _iGraphqlRepository;

  void _graphql$GetUsersEvent(_Graphql$GetUsersEvent event, Emitter<GraphqlState> emit) async {
    try {
      emit(GraphqlState.inProgress());

      final users = await _iGraphqlRepository.users();

      emit(GraphqlState.completed(users));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
      log("error: $error | trace: $stackTrace");
    }
  }
}
