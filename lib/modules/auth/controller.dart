import 'package:get/get.dart';
import '../common/services/firebase_messaging_service.dart';
import '../../base/base_controller.dart';
import '../user/service.dart';

class AuthController extends BaseController {
  final _isLoginScreen = true.obs;
  get isLoginScreen => _isLoginScreen.value;

  final _userService = Get.find<UserService>();
  final _messagingService = Get.find<PushNotificationService>();

  bool hasLoggedIn() => _userService.hasLoggedIn();

  Future<bool> login(String email, String password) async {
    isLoading = true;
    var loginSuccessful = await _userService.login(email, password);
    if (loginSuccessful) {
      await updateFcmToken();
    }
    isLoading = false;
    return loginSuccessful;
  }

  Future updateFcmToken() async {
    var fcmToken = await _messagingService.getFcmToken();
    await _userService.clearFCMTokenOfUsers(fcmToken);
    await _userService.updateFCMTokenForCurrentUser(fcmToken);
  }

  Future<bool> signUp(String email, String password) async {
    isLoading = true;
    var fcmToken = await _messagingService.getFcmToken();
    var signupSuccessful = await _userService.signUp(email, password, fcmToken);
    isLoading = false;
    return signupSuccessful;
  }

  Future<void> signOut() async {
    await _userService.signOut();
  }

  void switchScreen() {
    _isLoginScreen.value = !_isLoginScreen.value;
  }
}
