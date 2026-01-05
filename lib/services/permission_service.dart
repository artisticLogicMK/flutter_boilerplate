import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<bool> requestNotification() async {
    final status = await Permission.notification.request();
    return status.isGranted;
  }

  Future<bool> requestLocation() async {
    final status = await Permission.locationWhenInUse.request();
    return status.isGranted;
  }

  Future<bool> isGranted(Permission permission) async {
    return await permission.isGranted;
  }
}

final permissionServiceProvider =
    Provider<PermissionService>((_) => PermissionService());

/* How to use:
  final permissionService =
    ref.read(permissionServiceProvider);

  final granted =
      await permissionService.requestLocation();

  if (!granted) {
    // show explanation UI
  }
*/