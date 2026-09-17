part of 'file_upload_cubit.dart';

@freezed
sealed class FileUploadState with _$FileUploadState {
  const factory FileUploadState.idle() = FileUploadIdle;
  const factory FileUploadState.uploading([@Default(0.0) double progress]) =
      FileUploadInProgress;
  const factory FileUploadState.uploaded(String message) = FileUploadSuccess;
}
