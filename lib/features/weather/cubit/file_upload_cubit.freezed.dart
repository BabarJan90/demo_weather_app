// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_upload_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FileUploadState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FileUploadState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileUploadState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FileUploadState()';
}


}

/// @nodoc
class $FileUploadStateCopyWith<$Res>  {
$FileUploadStateCopyWith(FileUploadState _, $Res Function(FileUploadState) __);
}


/// Adds pattern-matching-related methods to [FileUploadState].
extension FileUploadStatePatterns on FileUploadState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FileUploadIdle value)?  idle,TResult Function( FileUploadInProgress value)?  uploading,TResult Function( FileUploadSuccess value)?  uploaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FileUploadIdle() when idle != null:
return idle(_that);case FileUploadInProgress() when uploading != null:
return uploading(_that);case FileUploadSuccess() when uploaded != null:
return uploaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FileUploadIdle value)  idle,required TResult Function( FileUploadInProgress value)  uploading,required TResult Function( FileUploadSuccess value)  uploaded,}){
final _that = this;
switch (_that) {
case FileUploadIdle():
return idle(_that);case FileUploadInProgress():
return uploading(_that);case FileUploadSuccess():
return uploaded(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FileUploadIdle value)?  idle,TResult? Function( FileUploadInProgress value)?  uploading,TResult? Function( FileUploadSuccess value)?  uploaded,}){
final _that = this;
switch (_that) {
case FileUploadIdle() when idle != null:
return idle(_that);case FileUploadInProgress() when uploading != null:
return uploading(_that);case FileUploadSuccess() when uploaded != null:
return uploaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function( double progress)?  uploading,TResult Function( String message)?  uploaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FileUploadIdle() when idle != null:
return idle();case FileUploadInProgress() when uploading != null:
return uploading(_that.progress);case FileUploadSuccess() when uploaded != null:
return uploaded(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function( double progress)  uploading,required TResult Function( String message)  uploaded,}) {final _that = this;
switch (_that) {
case FileUploadIdle():
return idle();case FileUploadInProgress():
return uploading(_that.progress);case FileUploadSuccess():
return uploaded(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function( double progress)?  uploading,TResult? Function( String message)?  uploaded,}) {final _that = this;
switch (_that) {
case FileUploadIdle() when idle != null:
return idle();case FileUploadInProgress() when uploading != null:
return uploading(_that.progress);case FileUploadSuccess() when uploaded != null:
return uploaded(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class FileUploadIdle with DiagnosticableTreeMixin implements FileUploadState {
  const FileUploadIdle();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FileUploadState.idle'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileUploadIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FileUploadState.idle()';
}


}




/// @nodoc


class FileUploadInProgress with DiagnosticableTreeMixin implements FileUploadState {
  const FileUploadInProgress([this.progress = 0.0]);
  

@JsonKey() final  double progress;

/// Create a copy of FileUploadState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileUploadInProgressCopyWith<FileUploadInProgress> get copyWith => _$FileUploadInProgressCopyWithImpl<FileUploadInProgress>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FileUploadState.uploading'))
    ..add(DiagnosticsProperty('progress', progress));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileUploadInProgress&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode => Object.hash(runtimeType,progress);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FileUploadState.uploading(progress: $progress)';
}


}

/// @nodoc
abstract mixin class $FileUploadInProgressCopyWith<$Res> implements $FileUploadStateCopyWith<$Res> {
  factory $FileUploadInProgressCopyWith(FileUploadInProgress value, $Res Function(FileUploadInProgress) _then) = _$FileUploadInProgressCopyWithImpl;
@useResult
$Res call({
 double progress
});




}
/// @nodoc
class _$FileUploadInProgressCopyWithImpl<$Res>
    implements $FileUploadInProgressCopyWith<$Res> {
  _$FileUploadInProgressCopyWithImpl(this._self, this._then);

  final FileUploadInProgress _self;
  final $Res Function(FileUploadInProgress) _then;

/// Create a copy of FileUploadState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? progress = null,}) {
  return _then(FileUploadInProgress(
null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class FileUploadSuccess with DiagnosticableTreeMixin implements FileUploadState {
  const FileUploadSuccess(this.message);
  

 final  String message;

/// Create a copy of FileUploadState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileUploadSuccessCopyWith<FileUploadSuccess> get copyWith => _$FileUploadSuccessCopyWithImpl<FileUploadSuccess>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FileUploadState.uploaded'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileUploadSuccess&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FileUploadState.uploaded(message: $message)';
}


}

/// @nodoc
abstract mixin class $FileUploadSuccessCopyWith<$Res> implements $FileUploadStateCopyWith<$Res> {
  factory $FileUploadSuccessCopyWith(FileUploadSuccess value, $Res Function(FileUploadSuccess) _then) = _$FileUploadSuccessCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$FileUploadSuccessCopyWithImpl<$Res>
    implements $FileUploadSuccessCopyWith<$Res> {
  _$FileUploadSuccessCopyWithImpl(this._self, this._then);

  final FileUploadSuccess _self;
  final $Res Function(FileUploadSuccess) _then;

/// Create a copy of FileUploadState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(FileUploadSuccess(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
