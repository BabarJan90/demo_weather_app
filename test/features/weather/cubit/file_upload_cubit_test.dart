import 'package:bloc_test/bloc_test.dart';
import 'package:demo_weather_app/features/weather/cubit/file_upload_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  blocTest<FileUploadCubit, FileUploadState>(
    'given uploadFile() is called, should emit [Uploading, Uploaded]',
    build: () => FileUploadCubit(),
    act: (cubit) => cubit.uploadFile(),
    expect: () => [const FileUploadState.uploading(), isA<FileUploadSuccess>()],
  );
}
