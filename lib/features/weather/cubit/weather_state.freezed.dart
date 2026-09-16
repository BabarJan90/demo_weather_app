// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WeatherState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WeatherState()';
}


}

/// @nodoc
class $WeatherStateCopyWith<$Res>  {
$WeatherStateCopyWith(WeatherState _, $Res Function(WeatherState) __);
}


/// Adds pattern-matching-related methods to [WeatherState].
extension WeatherStatePatterns on WeatherState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( WeatherInitial value)?  initial,TResult Function( WeatherLoading value)?  loading,TResult Function( WeatherLoaded value)?  loaded,TResult Function( WeatherError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case WeatherInitial() when initial != null:
return initial(_that);case WeatherLoading() when loading != null:
return loading(_that);case WeatherLoaded() when loaded != null:
return loaded(_that);case WeatherError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( WeatherInitial value)  initial,required TResult Function( WeatherLoading value)  loading,required TResult Function( WeatherLoaded value)  loaded,required TResult Function( WeatherError value)  error,}){
final _that = this;
switch (_that) {
case WeatherInitial():
return initial(_that);case WeatherLoading():
return loading(_that);case WeatherLoaded():
return loaded(_that);case WeatherError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( WeatherInitial value)?  initial,TResult? Function( WeatherLoading value)?  loading,TResult? Function( WeatherLoaded value)?  loaded,TResult? Function( WeatherError value)?  error,}){
final _that = this;
switch (_that) {
case WeatherInitial() when initial != null:
return initial(_that);case WeatherLoading() when loading != null:
return loading(_that);case WeatherLoaded() when loaded != null:
return loaded(_that);case WeatherError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Weather weather)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case WeatherInitial() when initial != null:
return initial();case WeatherLoading() when loading != null:
return loading();case WeatherLoaded() when loaded != null:
return loaded(_that.weather);case WeatherError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Weather weather)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case WeatherInitial():
return initial();case WeatherLoading():
return loading();case WeatherLoaded():
return loaded(_that.weather);case WeatherError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Weather weather)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case WeatherInitial() when initial != null:
return initial();case WeatherLoading() when loading != null:
return loading();case WeatherLoaded() when loaded != null:
return loaded(_that.weather);case WeatherError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class WeatherInitial implements WeatherState {
  const WeatherInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WeatherState.initial()';
}


}




/// @nodoc


class WeatherLoading implements WeatherState {
  const WeatherLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WeatherState.loading()';
}


}




/// @nodoc


class WeatherLoaded implements WeatherState {
  const WeatherLoaded(this.weather);
  

 final  Weather weather;

/// Create a copy of WeatherState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherLoadedCopyWith<WeatherLoaded> get copyWith => _$WeatherLoadedCopyWithImpl<WeatherLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherLoaded&&(identical(other.weather, weather) || other.weather == weather));
}


@override
int get hashCode => Object.hash(runtimeType,weather);

@override
String toString() {
  return 'WeatherState.loaded(weather: $weather)';
}


}

/// @nodoc
abstract mixin class $WeatherLoadedCopyWith<$Res> implements $WeatherStateCopyWith<$Res> {
  factory $WeatherLoadedCopyWith(WeatherLoaded value, $Res Function(WeatherLoaded) _then) = _$WeatherLoadedCopyWithImpl;
@useResult
$Res call({
 Weather weather
});




}
/// @nodoc
class _$WeatherLoadedCopyWithImpl<$Res>
    implements $WeatherLoadedCopyWith<$Res> {
  _$WeatherLoadedCopyWithImpl(this._self, this._then);

  final WeatherLoaded _self;
  final $Res Function(WeatherLoaded) _then;

/// Create a copy of WeatherState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? weather = null,}) {
  return _then(WeatherLoaded(
null == weather ? _self.weather : weather // ignore: cast_nullable_to_non_nullable
as Weather,
  ));
}


}

/// @nodoc


class WeatherError implements WeatherState {
  const WeatherError(this.message);
  

 final  String message;

/// Create a copy of WeatherState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherErrorCopyWith<WeatherError> get copyWith => _$WeatherErrorCopyWithImpl<WeatherError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'WeatherState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $WeatherErrorCopyWith<$Res> implements $WeatherStateCopyWith<$Res> {
  factory $WeatherErrorCopyWith(WeatherError value, $Res Function(WeatherError) _then) = _$WeatherErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$WeatherErrorCopyWithImpl<$Res>
    implements $WeatherErrorCopyWith<$Res> {
  _$WeatherErrorCopyWithImpl(this._self, this._then);

  final WeatherError _self;
  final $Res Function(WeatherError) _then;

/// Create a copy of WeatherState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(WeatherError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
