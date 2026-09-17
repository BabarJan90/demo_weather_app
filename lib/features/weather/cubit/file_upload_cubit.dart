import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../upload/file_uploader.dart';

part 'file_upload_cubit.freezed.dart';
part 'file_upload_state.dart';

@injectable
class FileUploadCubit extends Cubit<FileUploadState> {
  FileUploadCubit() : super(const FileUploadState.idle());

  Future<void> uploadFile() async {
    emit(const FileUploadState.uploading());

    final result = await compute(uploadLargeFileInIsolate, 50000000);

    if (!isClosed) emit(FileUploadState.uploaded(result));
  }

  Future<void> uploadFileWithSpawn() async {
    emit(const FileUploadState.uploading());

    final result = await uploadLargeFileWithSpawn(
      5000000000,
      onProgress: (progress) {
        if (!isClosed) emit(FileUploadState.uploading(progress));
      },
    );

    if (!isClosed) emit(FileUploadState.uploaded(result));
  }
}
