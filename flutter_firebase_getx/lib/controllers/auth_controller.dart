import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_getx/dialogs/dialogue_widgets.dart';
import 'package:flutter_firebase_getx/firebase_references/references.dart';
import 'package:flutter_firebase_getx/screen/home/home_screen.dart';
import 'package:flutter_firebase_getx/screen/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  late FirebaseAuth _auth;
  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;
  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user) {
      _user.value = user;
    });
    navigatorToIntroduction();
  }

  signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        final _authAccount = await account.authentication;
        final _credential = GoogleAuthProvider.credential(
            idToken: _authAccount.idToken,
            accessToken: _authAccount.accessToken);

        await _auth.signInWithCredential(_credential);
        await saveUser(account);
        navigatorToHomePage();
      }
    } on Exception catch (error) {
      print(error);
      // AppLogger.e(error);
    }
  }

  User? getUser() {
    _user.value = _auth.currentUser;
    return _user.value;
  }

  saveUser(GoogleSignInAccount account) {
    userRF.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "profilepic": account.photoUrl
    });
  }

  Future<void> signOut() async {
    //AppLogger.d("Sign Out");
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      //AppLogger.e(e)
      print(e);
    }
  }

  void navigatorToIntroduction() {
    Get.offAllNamed("/introduction");
  }

  navigatorToHomePage() {
    Get.offAllNamed(HomeScreen.routeName);
  }

  void showLoginAlertDialogue() {
    Get.dialog(Dialogs.questionStartDialogue(onTap: () {
      Get.back(); // navigate to LoginPage
      NavigaterToLoginPage();
    }), barrierDismissible: false);
  }

  void NavigaterToLoginPage() {
    Get.toNamed(LoginScreen.routeName);
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }
}
