import 'dart:convert';

import 'package:get/get.dart';

import '../api_services/api_exceptions.dart';
import '../api_services/data_api.dart';
import '../models/user_model.dart';
import '../preferences/auth_prefrence.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/custom_toast.dart';
import 'base_controller.dart';

class AuthController extends GetxController {
  RxString termsAndCondition = ''.obs;
  RxString privacyPolicy = ''.obs;

  final AuthPreference _authPreference = AuthPreference.instance;
  final BaseController _baseController = BaseController.instance;
  RxString accessToken = "".obs;

  RxBool savId = true.obs;

  RxBool isLoggedIn = false.obs;

  RxBool loading = false.obs;

  RxString fcmToken = ''.obs;

  Rx<UserModel> userData = UserModel(id: 1).obs;

  final Rx<String> userId = ''.obs;

  Map<String, dynamic> userDataMap = {
    'name': '',
    'email': '',
    'username': '',
    'password': '',
    'provider_name': 'system',
    'phone': '',
    'date_of_birth': '',
    'is_parent': '',
    'country_id': '',
    'firstname': '',
    'lastname': '',
    'is_private': '',
    'provider_id': ''
  };

  AuthController() {
    fetchFromDb();
  }

  fetchFromDb() async {
    accessToken.value = await _authPreference.getUserDataToken();
    isLoggedIn.value = await _authPreference.getUserLoggedIn();
    var res = await _authPreference.getUserData();
    // fetchingCountries();
    if (isLoggedIn.value) {
      userData.value = UserModel.fromJson(json.decode(res)['user']);
      userId.value = userData.value.id.toString();
      getFCMToken();
    } else {}

    update();
  }

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  /*<---------------------Register--------------------->*/

  Future userRegister(context, Map<String, dynamic> dataMap) async {
    _baseController.showLoading('Registering account...');
    print(dataMap);
    var response = await DataApiService.instance.post('/signup', dataMap);
    if (response == null) return;
    _baseController.hideLoading();
    var result = json.decode(response);
    print(result);
    if (result['success'] == true) {
      print(response);
      var req = {
        'email': dataMap['email'],
        'password': dataMap['password'],
      };
      showCustomDialog(context, "assets/images/requested_pop.png",
          "Your account has been created successfully", '', "Continue", () {
        Get.back();
      }).then((v) {
        userLogin(req, newUser: true);
      });
    } else {
      if (result['message'] != null && result['message'] is Map) {
        List<String> errorMessages = [];
        result['message'].forEach((key, value) {
          if (value is List) {
            errorMessages.addAll(value.map((item) => item.toString()));
          }
        });
        String errorMessage = errorMessages.join('\n');
        CustomDialogBox.showErrorDialog(description: errorMessage);
      }
    }
  }

  /*<---------------------Login--------------------->*/

  Future userLogin(var body, {bool newUser = false}) async {
    _baseController.showLoading('Logging user...');
    var response =
        await DataApiService.instance.post('/login', body).catchError((error) {
      if (error is BadRequestException) {
        return error.message!;
      } else {
        _baseController.handleError(error);
      }
    });

    if (response == null) return;
    _baseController.hideLoading();
    var result = json.decode(response);
    print(result);
    if (result['success'] == true) {
      userData.value = UserModel.fromJson(result['user']);
      accessToken.value = result['token'];

      if (savId.isTrue) {
        print('save id is called');
        _authPreference.saveUserData(token: response);
        _authPreference.saveUserDataToken(token: accessToken.value);
        _authPreference.setUserLoggedIn(true);
        isLoggedIn.value = true;
        getFCMToken();
      } else {
        isLoggedIn.value = false;
      }
      update();

      ///TODO: I changed
      // if (newUser) {
      //   Get.offAll(() => ChooseInterest());
      // } else {
      //   Get.offAll(() => CustomBottomNavBar());
      // }
      ///TODO: I changed

      return '';
    } else {
      if (result['message'] != null && result['message'] is Map) {
        List<String> errorMessages = [];
        result['message'].forEach((key, value) {
          if (value is List) {
            errorMessages.addAll(value.map((item) => item.toString()));
          }
        });
        String errorMessage = errorMessages.join('\n');
        CustomDialogBox.showErrorDialog(description: errorMessage);
      } else {
        CustomDialogBox.showErrorDialog(description: result['message']);
      }
    }
  }

  /*<---------------------Logout--------------------->*/

  Future signOut() async {
    _baseController.showLoading('Signing out...');
    _authPreference.saveUserDataToken(token: '');
    _authPreference.setUserLoggedIn(false);
    _authPreference.saveUserData(token: '');
    isLoggedIn(false);
    accessToken.value = '';
    update();
    _baseController.hideLoading();

    ///TODO: I changed
    // Get.offAll(() => const LoginScreen());
    ///TODO: I changed
  }

  /*<---------------------Delete Account--------------------->*/

  Future deleteAccount() async {
    var body = {};
    _baseController.showLoading('Deleting account...');
    var response = await DataApiService.instance
        .post('/delete-account', body)
        .catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        CustomDialogBox.showErrorDialog(description: apiError["reason"]);
      } else {
        _baseController.handleError(error);
      }
    });
    if (response == null) return;
    _baseController.hideLoading();
    print(response);
    var result = json.decode(response);
    if (result['status']) {
      await signOut();
    } else {
      CustomDialogBox.showErrorDialog(description: result['message']);
    }
  }

/*<---------------------Edit Account--------------------->*/

// Future updateProfile(var body) async {
//   _baseController.showLoading('Updating account...');
//   print(body);
//   var response = await DataApiService.instance
//       .post('/edit-profile', body)
//       .catchError((error) {
//     if (error is BadRequestException) {
//       var apiError = json.decode(error.message!);
//       CustomDialogBox.showErrorDialog(description: apiError["reason"]);
//     } else {
//       _baseController.handleError(error);
//     }
//   });
//   if (response == null) return;
//   _baseController.hideLoading();
//   print(response);
//   var result = json.decode(response);
//   if (result['status']) {
//     UserModel user = userData.value;
//     // user.name = body['name'];
//     // user.name = body['english_name'];
//     // user.name = body['gender'];
//     // user.name = body['dob'];
//     // user.name = body['country'];
//     update();
//     Get.offAll(() => const HomePage());
//   } else {
//     CustomDialogBox.showErrorDialog(description: result['message']);
//   }
// }

  Future checkUserNameEmailUniqueness({
    required Map<String, dynamic> body,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    _baseController.showLoading('Checking uniqueness');
    print(body);
    var response = await DataApiService.instance
        .post('/check-unique-email-username', body);
    _baseController.hideLoading();

    if (response == null) {
      // Handle the case where there was no response (e.g., a network error).
      CustomDialogBox.showErrorDialog(description: 'Something went wrong');
      return false;
    }
    print("response");
    print(response);
    var result = json.decode(response);
    print(result);

    if (result['success'] == true) {
      // Email and username are unique, proceed with registration
      userDataMap['email'] = body['email'];
      userDataMap['username'] = body['username'];
      userDataMap['name'] = body['username'];
      userDataMap['password'] = password;
      userDataMap['firstname'] = firstName;
      userDataMap['lastname'] = lastName;
      print(userDataMap);
      return true;
    } else {
      // Error occurred, extract and show error messages
      if (result['message'] != null && result['message'] is Map) {
        List<String> errorMessages = [];
        result['message'].forEach((key, value) {
          if (value is List) {
            errorMessages.addAll(value.map((item) => item.toString()));
          }
        });

        // Join error messages to display them
        String errorMessage = errorMessages.join('\n');
        CustomDialogBox.showErrorDialog(description: errorMessage);
      }
      return false;
    }
  }

  Future checkUserPhoneUniqueness(Map<String, dynamic> body) async {
    _baseController.showLoading('Checking phone number uniqueness');
    print(body);
    var response =
        await DataApiService.instance.post('/phone-verification', body);
    _baseController.hideLoading();

    if (response == null) {
      // Handle the case where there was no response (e.g., a network error).
      CustomDialogBox.showErrorDialog(description: 'Something went wrong');
      return;
    }

    var result = json.decode(response);
    print(result);

    if (result['success'] == true) {
      String otpCode =
          result['phone_verification']['verification_code'].toString();
      userDataMap['phone'] = body['phone'];
      userDataMap['is_parent'] = body['is_parent'];
      print(userDataMap);

      ///TODO: I changed
      // Get.to(() => VerifyPhone(otpCode: otpCode));
      ///TODO: I changed
    } else {
      if (result['message'] != null && result['message'] is Map) {
        List<String> errorMessages = [];
        result['message'].forEach((key, value) {
          if (value is List) {
            errorMessages.addAll(value.map((item) => item.toString()));
          }
        });

        // Join error messages to display them
        String errorMessage = errorMessages.join('\n');
        CustomDialogBox.showErrorDialog(description: errorMessage);
      } else {
        CustomDialogBox.showErrorDialog(description: result['message']);
      }
    }
  }

  Future fetchingCountries() async {
    try {
      var response = await DataApiService.instance.get('/countries');
      if (response == null) return;

      var result = json.decode(response);
      print('Fetching countries');
      print(result.toString());
    } catch (error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        CustomDialogBox.showErrorDialog(description: apiError["reason"]);
      } else {
        _baseController.handleError(error);
      }
    }
  }

  Future getConnectAccounts() async {
    loading.value = true;
    try {
      var response =
          await DataApiService.instance.get('/get-connected-accounts');
      loading.value = false;
      if (response == null) return;

      var result = json.decode(response);
      print('Fetching countries');
      print(result.toString());
      if (result['success']) {
      } else {
        CustomDialogBox.showErrorDialog(description: result["message"]);
      }
    } catch (error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        CustomDialogBox.showErrorDialog(description: apiError["reason"]);
      } else {
        _baseController.handleError(error);
      }
    }
  }

  Future getTermsAndCondition() async {
    loading.value = true;
    try {
      var response = await DataApiService.instance.get('/terms-conditions');
      loading.value = false;
      if (response == null) return;

      var result = json.decode(response);

      print(result.toString());
      if (result['success']) {
        termsAndCondition.value = result['data'];
      } else {
        CustomDialogBox.showErrorDialog(description: result["message"]);
      }
    } catch (error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        CustomDialogBox.showErrorDialog(description: apiError["reason"]);
      } else {
        _baseController.handleError(error);
      }
    }
  }

  Future getPrivacyPolicy() async {
    loading.value = true;
    try {
      var response = await DataApiService.instance.get('/privacy-policy');
      loading.value = false;
      if (response == null) return;

      var result = json.decode(response);

      print(result.toString());
      if (result['success']) {
        privacyPolicy.value = result['data'];
      } else {
        CustomDialogBox.showErrorDialog(description: result["message"]);
      }
    } catch (error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        CustomDialogBox.showErrorDialog(description: apiError["reason"]);
      } else {
        _baseController.handleError(error);
      }
    }
  }

  Future addAccount(Map<String, dynamic> body) async {
    _baseController.showLoading('Connect account...');
    var response = await DataApiService.instance
        .post('/connect-account', body)
        .catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        CustomDialogBox.showErrorDialog(description: apiError["reason"]);
      } else {
        _baseController.handleError(error);
      }
    });
    if (response == null) return;
    _baseController.hideLoading();
    print(response);
    var result = json.decode(response);
    if (result['success']) {
      CustomToast.errorToast(message: 'Account connected successfully');
      Get.back();
    } else {
      CustomDialogBox.showErrorDialog(description: result['message']);
    }
  }

  Future privateAccount(Map<String, dynamic> body) async {
    _baseController.showLoading('Updating account...');
    var response = await DataApiService.instance
        .post('/private-account', body)
        .catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        CustomDialogBox.showErrorDialog(description: apiError["reason"]);
      } else {
        _baseController.handleError(error);
      }
    });
    if (response == null) return;
    _baseController.hideLoading();
    print(response);
    var result = json.decode(response);
    if (result['success']) {
      CustomToast.errorToast(message: 'Account update successfully');
      Get.back();
    } else {
      CustomDialogBox.showErrorDialog(description: result['message']);
    }
  }

  Future editProfile(Map<String, String> body, String? imageFile) async {
    _baseController.showLoading('Editing Profile...');
    print(body);
    var response = await DataApiService.instance
        .multiPartPost('/edit-profile', imageFile, body)
        .catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        CustomDialogBox.showErrorDialog(description: apiError["reason"]);
      } else {
        _baseController.handleError(error);
      }
    });
    if (response == null) return;
    _baseController.hideLoading();
    print(response);
    var result = json.decode(response);
    if (result['success']) {
      userData.value = UserModel.fromJson(result['user']);
      _authPreference.saveUserData(token: result['user'].toString());
      print(userData.value.photo);

      ///TODO: I changed
      // Get.offAll(() => CustomBottomNavBar());
      ///TODO: I changed

      CustomToast.errorToast(message: 'Profile edit successfully');
    } else {
      CustomDialogBox.showErrorDialog(description: result['message']);
    }
  }

  getFCMToken() async {
    // fcmToken.value = (await FirebaseMessaging.instance.getToken())!;
    var body = {
      'user': userData.value.id.toString(),
      'fcm_token': fcmToken.value
    };
    saveFcm(body);
    print("fcmToken");
    print(fcmToken.value);
  }

  Future saveFcm(Map<String, String> body) async {
    print(body);
    var response = await DataApiService.instance
        .post('/save-fcm', body)
        .catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        CustomDialogBox.showErrorDialog(description: apiError["reason"]);
      } else {
        _baseController.handleError(error);
      }
    });
    if (response == null) return;
    _baseController.hideLoading();
    print(response);
    var result = json.decode(response);
    if (result['success']) {
      fcmToken(body['fcm_token']);
    } else {
      CustomDialogBox.showErrorDialog(description: result['message']);
    }
  }

  Future forgotPassword(Map<String, String> body) async {
    _baseController.showLoading('Sending otp...');

    print(body);
    var response = await DataApiService.instance
        .post('/forgot-password', body)
        .catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        CustomDialogBox.showErrorDialog(description: apiError["reason"]);
      } else {
        _baseController.handleError(error);
      }
    });
    if (response == null) return;
    _baseController.hideLoading();
    print(response);
    var result = json.decode(response);
    if (result['success']) {
      await CustomDialogBox.showSuccessDialog(description: result['message']);
      return result;
    } else {
      if (result['message'] != null && result['message'] is Map) {
        List<String> errorMessages = [];
        result['message'].forEach((key, value) {
          if (value is List) {
            errorMessages.addAll(value.map((item) => item.toString()));
          }
        });
        String errorMessage = errorMessages.join('\n');
        CustomDialogBox.showErrorDialog(description: errorMessage);
      } else {
        CustomDialogBox.showErrorDialog(description: result['message']);
      }
    }
    return result;
  }

  Future resetPassword(Map<String, String> body) async {
    _baseController.showLoading('Updating password...');

    print(body);
    var response = await DataApiService.instance
        .post('/reset-password', body)
        .catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        CustomDialogBox.showErrorDialog(description: apiError["reason"]);
      } else {
        _baseController.handleError(error);
      }
    });
    if (response == null) return;
    _baseController.hideLoading();
    print(response);
    var result = json.decode(response);
    if (result['success']) {
      await CustomDialogBox.showSuccessDialog(description: result['message']);
      return result;
    } else {
      if (result['message'] != null && result['message'] is Map) {
        List<String> errorMessages = [];
        result['message'].forEach((key, value) {
          if (value is List) {
            errorMessages.addAll(value.map((item) => item.toString()));
          }
        });
        String errorMessage = errorMessages.join('\n');
        CustomDialogBox.showErrorDialog(description: errorMessage);
      } else {
        CustomDialogBox.showErrorDialog(description: result['message']);
      }
    }
    return result;
  }
}
