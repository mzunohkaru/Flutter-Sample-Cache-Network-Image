import 'package:permission_handler/permission_handler.dart';

Future<void> checkAndRequestPermissions() async {
  var status = await Permission.storage.status;
  if (!status.isGranted) {
    await Permission.storage.request();
  }

  status = await Permission.storage.status;
  if (status.isGranted) {
    print('ストレージ権限が許可されています');
  } else {
    print('ストレージ権限が拒否されています');
  }
}
