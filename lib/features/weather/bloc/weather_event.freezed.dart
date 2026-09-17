// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WeatherEvent {

 String get cityName;
/// Create a copy of WeatherEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherEventCopyWith<WeatherEvent> get copyWith => _$WeatherEventCopyWithImpl<WeatherEvent>(this as WeatherEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherEvent&&(identical(other.cityName, cityName) || other.cityName == cityName));
}


@override
int get hashCode => Object.hash(runtimeType,cityName);

@override
String toString() {
  return 'WeatherEvent(cityName: $cityName)';
}


}

/// @nodoc
abstract mixin class $WeatherEventCopyWith<$Res>  {
  factory $WeatherEventCopyWith(WeatherEvent value, $Res Function(WeatherEvent) _then) = _$WeatherEventCopyWithImpl;
@useResult
$Res call({
 String cityName
});




}
/// @nodoc
class _$WeatherEventCopyWithImpl<$Res>
    implements $WeatherEventCopyWith<$Res> {
  _$WeatherEventCopyWithImpl(this._self, this._then);

  final WeatherEvent _self;
  final $Res Function(WeatherEvent) _then;

/// Create a copy of WeatherEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cityName = null,}) {
  return _then(_self.copyWith(
cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WeatherEvent].
extension WeatherEventPatterns on WeatherEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( WeatherLoadRequested value)?  loadRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case WeatherLoadRequested() when loadRequested != null:
return loadRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( WeatherLoadRequested value)  loadRequested,}){
final _that = this;
switch (_that) {
case WeatherLoadRequested():
return loadRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( WeatherLoadRequested value)?  loadRequested,}){
final _that = this;
switch (_that) {
case WeatherLoadRequested() when loadRequested != null:
return loadRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String cityName)?  loadRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case WeatherLoadRequested() when loadRequested != null:
return loadRequested(_that.cityName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String cityName)  loadRequested,}) {final _that = this;
switch (_that) {
case WeatherLoadRequested():
return loadRequested(_that.cityName);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String cityName)?  loadRequested,}) {final _that = this;
switch (_that) {
case WeatherLoadRequested() when loadRequested != null:
return loadRequested(_that.cityName);case _:
  return null;

}
}

}

/// @nodoc


class WeatherLoadRequested implements WeatherEvent {
  const WeatherLoadRequested(this.cityName);
  

@override final  String cityName;

/// Create a copy of WeatherEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherLoadRequestedCopyWith<WeatherLoadRequested> get copyWith => _$WeatherLoadRequestedCopyWithImpl<WeatherLoadRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherLoadRequested&&(identical(other.cityName, cityName) || other.cityName == cityName));
}


@override
int get hashCode => Object.hash(runtimeType,cityName);

@override
String toString() {
  return 'WeatherEvent.loadRequested(cityName: $cityName)';
}


}

/// @nodoc
abstract mixin class $WeatherLoadRequestedCopyWith<$Res> implements $WeatherEventCopyWith<$Res> {
  factory $WeatherLoadRequestedCopyWith(WeatherLoadRequested value, $Res Function(WeatherLoadRequested) _then) = _$WeatherLoadRequestedCopyWithImpl;
@override @useResult
$Res call({
 String cityName
});




}
/// @nodoc
class _$WeatherLoadRequestedCopyWithImpl<$Res>
    implements $WeatherLoadRequestedCopyWith<$Res> {
  _$WeatherLoadRequestedCopyWithImpl(this._self, this._then);

  final WeatherLoadRequested _self;
  final $Res Function(WeatherLoadRequested) _then;

/// Create a copy of WeatherEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cityName = null,}) {
  return _then(WeatherLoadRequested(
null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
