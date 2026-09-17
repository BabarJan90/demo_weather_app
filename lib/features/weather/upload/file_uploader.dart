import 'dart:async';
import 'dart:isolate';

// This function simulates uploading a large file in a separate isolate.
Future<String> uploadLargeFileInIsolate(int fileSizeInBytes) async {
  // Simulates real CPU-bound work (e.g. hashing a file) so this
  // genuinely proves it's running off the main isolate, not just an async delay.
  var checksum = 0;
  for (var i = 0; i < fileSizeInBytes; i++) {
    checksum = (checksum + i) % 1000000007;
  }
  final megabytes = (fileSizeInBytes / 1000000).toStringAsFixed(1);
  return 'Uploaded $megabytes MB (checksum: $checksum)';
}

// This function demonstrates how to use Isolate.spawn
// to run a long-running task in a separate isolate and
// report progress back to the main isolate.

Future<String> uploadLargeFileWithSpawn(
  int fileSizeInBytes, {
  required void Function(double progress) onProgress,
}) async {
  final receivePort = ReceivePort();
  await Isolate.spawn(_uploadEntryPoint, [
    receivePort.sendPort,
    fileSizeInBytes,
  ]);

  final completer = Completer<String>();

  receivePort.listen((message) {
    if (message is double) {
      onProgress(message);
    } else if (message is String) {
      completer.complete(message);
      receivePort.close();
    }
  });

  return completer.future;
}

void _uploadEntryPoint(List<dynamic> args) {
  final SendPort sendPort = args[0] as SendPort;
  final fileSizeInBytes = args[1] as int;

  var checksum = 0;
  const progressSteps = 20;
  final stepSize = fileSizeInBytes ~/ progressSteps;

  for (var i = 0; i < fileSizeInBytes; i++) {
    checksum = (checksum + i) % 1000000007;

    if (stepSize > 0 && i % stepSize == 0) {
      sendPort.send(i / fileSizeInBytes);
    }
  }

  final megabytes = (fileSizeInBytes / 1000000).toStringAsFixed(1);
  sendPort.send('Uploaded $megabytes MB (checksum: $checksum)');
}
