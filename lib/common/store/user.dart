import 'package:exchange/common/services/services.dart';
import 'package:exchange/common/values/values.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../apis/post.dart';
import '../entities/post.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  // 是否登录
  // final _isLogin = false.obs;
  // 令牌 token
  String token = '';
  // 用户 profile
  // final _profile = User().obs;
  final customerProfilesDetails = <String,dynamic>{}.obs;
  final RxString _email = ''.obs;
  String get email => _email.value;
  set email(String value) => _email.value = value;

  final RxString _password = ''.obs;
  String get password => _password.value;
  set password(String value) => _password.value = value;

  final _isLogin = false.obs;
  set isLogin(value) => _isLogin.value = value;
  get isLogin => _isLogin.value;


  // bool get isLogin => _isLogin.value;
  // User get profile => _profile.value;
  bool get hasToken => token.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    token = StorageService.to.getString(email);
    if (token.isNotEmpty) {
      _isLogin.value = true;
      customerProfilesDetails.value = StorageService.to.getList(email) as Map<String, dynamic>;
    }
    // _email.value = 'test@gmail.com';
    // _password.value ='123456';
    // token = StorageService.to.getString(email);
    // // getProfile('fd1dc3fc-d9ea-4d97-984c-dfa4b0fe8fc2');
    // // logIn(email, password);
    // if (token.isNotEmpty) {
    //   _isLogin.value = true;
    //   customerProfilesDetails.value = StorageService.to.getList(email) as Map<String, dynamic>;
    // }
  }

  // 保存 token
  Future<void> setToken(String value) async {
    await StorageService.to.setString(storageUserTokenKey, value);
    token = value;
  }

  Future<void> logIn(String email, String password) async {
    LoginRequestEntity req = LoginRequestEntity(
      email: email,
      password: password,
    );
    Map<String, dynamic>? userProfile = {};
    try {
      LoginResponseEntity res = await PostApi.logInPost(req);
      if (res.code == 200 && res.data != null) {
        userProfile = res.data!.toJson(); // 使用 Data 类的 toJson 方法
        isLogin = true;
        _email.value=email;
        _password.value = password;
        customerProfilesDetails.value = userProfile ;
        List<String> profile = userProfile.values.map((value) => value.toString()).toList();
        bool isSuccess = await StorageService.to.setList(email, profile);
        if(isSuccess){
         // EasyLoading.showSuccess('login success');
          Get.back();
        }
      } else {
        print('Error: getProfile()');
        isLogin = false;
        EasyLoading.showError('login failed');
      }
    } catch (e) {
      print('Error : $e');
      EasyLoading.showError('login failed : $e');
    }
  }

  // 注销
  Future<void> onLogout() async {
    // if (_isLogin.value) await User.logout();
    await StorageService.to.remove(email);
    _isLogin.value = false;
    token = '';
  }

  Future<void> getProfile(String id) async {
    GetProfileRequestEntity req = GetProfileRequestEntity(
        customerId: id,
    );
    Map<String, dynamic>? userProfile = {};
    try {
      GetProfileResponseEntity res = await PostApi.getProfile(req);
      if (res.code == 200 && res.data != null) {
        userProfile = res.data!.toJson(); // 使用 Data 类的 toJson 方法
        customerProfilesDetails.value = userProfile ;
        List<String> profile = userProfile.values.map((value) => value.toString()).toList();
        bool isSuccess = await StorageService.to.setList(email, profile);
        if(isSuccess){
          _isLogin.value =true;
        }
      } else {
        print('Error: getProfile()');
      }
    } catch (e) {
      print('Error : $e');
    }
  }
}


// 获取 profile
// Future<void> getProfile() async {
//   if (token.isEmpty) return;
// var result = await UserAPI.profile();
// _profile(result);
// _isLogin.value = true;
// StorageService.to.setString(storageUserTokenKey, jsonEncode(result));

// 保存 profile
// Future<void> saveProfile(User profile) async {
//   _isLogin.value = true;
//   StorageService.to.setString(storageUserTokenKey, profile.token);
//   StorageService.to.setString(storageUserProfileKey, jsonEncode(profile));
// }

