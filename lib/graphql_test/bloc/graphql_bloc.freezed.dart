// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'graphql_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GraphqlEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GraphqlEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GraphqlEvent()';
}


}

/// @nodoc
class $GraphqlEventCopyWith<$Res>  {
$GraphqlEventCopyWith(GraphqlEvent _, $Res Function(GraphqlEvent) __);
}


/// Adds pattern-matching-related methods to [GraphqlEvent].
extension GraphqlEventPatterns on GraphqlEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Graphql$GetUsersEvent value)?  getUsers,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Graphql$GetUsersEvent() when getUsers != null:
return getUsers(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Graphql$GetUsersEvent value)  getUsers,}){
final _that = this;
switch (_that) {
case _Graphql$GetUsersEvent():
return getUsers(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Graphql$GetUsersEvent value)?  getUsers,}){
final _that = this;
switch (_that) {
case _Graphql$GetUsersEvent() when getUsers != null:
return getUsers(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getUsers,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Graphql$GetUsersEvent() when getUsers != null:
return getUsers();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getUsers,}) {final _that = this;
switch (_that) {
case _Graphql$GetUsersEvent():
return getUsers();}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getUsers,}) {final _that = this;
switch (_that) {
case _Graphql$GetUsersEvent() when getUsers != null:
return getUsers();case _:
  return null;

}
}

}

/// @nodoc


class _Graphql$GetUsersEvent implements GraphqlEvent {
  const _Graphql$GetUsersEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Graphql$GetUsersEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GraphqlEvent.getUsers()';
}


}




/// @nodoc
mixin _$GraphqlState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GraphqlState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GraphqlState()';
}


}

/// @nodoc
class $GraphqlStateCopyWith<$Res>  {
$GraphqlStateCopyWith(GraphqlState _, $Res Function(GraphqlState) __);
}


/// Adds pattern-matching-related methods to [GraphqlState].
extension GraphqlStatePatterns on GraphqlState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Graphql$IntialState value)?  initial,TResult Function( Graphql$InProgressState value)?  inProgress,TResult Function( Graphql$ErrorState value)?  error,TResult Function( Graphql$CompletedState value)?  completed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Graphql$IntialState() when initial != null:
return initial(_that);case Graphql$InProgressState() when inProgress != null:
return inProgress(_that);case Graphql$ErrorState() when error != null:
return error(_that);case Graphql$CompletedState() when completed != null:
return completed(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Graphql$IntialState value)  initial,required TResult Function( Graphql$InProgressState value)  inProgress,required TResult Function( Graphql$ErrorState value)  error,required TResult Function( Graphql$CompletedState value)  completed,}){
final _that = this;
switch (_that) {
case Graphql$IntialState():
return initial(_that);case Graphql$InProgressState():
return inProgress(_that);case Graphql$ErrorState():
return error(_that);case Graphql$CompletedState():
return completed(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Graphql$IntialState value)?  initial,TResult? Function( Graphql$InProgressState value)?  inProgress,TResult? Function( Graphql$ErrorState value)?  error,TResult? Function( Graphql$CompletedState value)?  completed,}){
final _that = this;
switch (_that) {
case Graphql$IntialState() when initial != null:
return initial(_that);case Graphql$InProgressState() when inProgress != null:
return inProgress(_that);case Graphql$ErrorState() when error != null:
return error(_that);case Graphql$CompletedState() when completed != null:
return completed(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  inProgress,TResult Function()?  error,TResult Function( List<GraphqlUserTest> user)?  completed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Graphql$IntialState() when initial != null:
return initial();case Graphql$InProgressState() when inProgress != null:
return inProgress();case Graphql$ErrorState() when error != null:
return error();case Graphql$CompletedState() when completed != null:
return completed(_that.user);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  inProgress,required TResult Function()  error,required TResult Function( List<GraphqlUserTest> user)  completed,}) {final _that = this;
switch (_that) {
case Graphql$IntialState():
return initial();case Graphql$InProgressState():
return inProgress();case Graphql$ErrorState():
return error();case Graphql$CompletedState():
return completed(_that.user);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  inProgress,TResult? Function()?  error,TResult? Function( List<GraphqlUserTest> user)?  completed,}) {final _that = this;
switch (_that) {
case Graphql$IntialState() when initial != null:
return initial();case Graphql$InProgressState() when inProgress != null:
return inProgress();case Graphql$ErrorState() when error != null:
return error();case Graphql$CompletedState() when completed != null:
return completed(_that.user);case _:
  return null;

}
}

}

/// @nodoc


class Graphql$IntialState implements GraphqlState {
  const Graphql$IntialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Graphql$IntialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GraphqlState.initial()';
}


}




/// @nodoc


class Graphql$InProgressState implements GraphqlState {
  const Graphql$InProgressState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Graphql$InProgressState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GraphqlState.inProgress()';
}


}




/// @nodoc


class Graphql$ErrorState implements GraphqlState {
  const Graphql$ErrorState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Graphql$ErrorState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GraphqlState.error()';
}


}




/// @nodoc


class Graphql$CompletedState implements GraphqlState {
  const Graphql$CompletedState(final  List<GraphqlUserTest> user): _user = user;
  

 final  List<GraphqlUserTest> _user;
 List<GraphqlUserTest> get user {
  if (_user is EqualUnmodifiableListView) return _user;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_user);
}


/// Create a copy of GraphqlState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Graphql$CompletedStateCopyWith<Graphql$CompletedState> get copyWith => _$Graphql$CompletedStateCopyWithImpl<Graphql$CompletedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Graphql$CompletedState&&const DeepCollectionEquality().equals(other._user, _user));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_user));

@override
String toString() {
  return 'GraphqlState.completed(user: $user)';
}


}

/// @nodoc
abstract mixin class $Graphql$CompletedStateCopyWith<$Res> implements $GraphqlStateCopyWith<$Res> {
  factory $Graphql$CompletedStateCopyWith(Graphql$CompletedState value, $Res Function(Graphql$CompletedState) _then) = _$Graphql$CompletedStateCopyWithImpl;
@useResult
$Res call({
 List<GraphqlUserTest> user
});




}
/// @nodoc
class _$Graphql$CompletedStateCopyWithImpl<$Res>
    implements $Graphql$CompletedStateCopyWith<$Res> {
  _$Graphql$CompletedStateCopyWithImpl(this._self, this._then);

  final Graphql$CompletedState _self;
  final $Res Function(Graphql$CompletedState) _then;

/// Create a copy of GraphqlState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(Graphql$CompletedState(
null == user ? _self._user : user // ignore: cast_nullable_to_non_nullable
as List<GraphqlUserTest>,
  ));
}


}

// dart format on
