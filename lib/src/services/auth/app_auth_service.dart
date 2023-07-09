
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:um_core/src/data/hive/app_data.dart';


abstract class AppAuthService {
  static final _auth = FirebaseAuth.instance;
  static final _googleSignIn = GoogleSignIn();
  // static final _facebookAuth = FacebookAuth.instance;
  static bool get isLogin => _auth.currentUser != null;
  static String get email => _auth.currentUser?.email ?? '';

  static Future<UserCredential> signInUser(
      String email, String password) async {
    try {
      final _credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await AppData.setUserId(_credential.user!.uid);
      return _credential;
    } on FirebaseAuthException catch (e) {
      if(e.code == 'wrong-password'){
        throw 'wrong-password';
      }else if(e.code == 'user-not-found'){
        throw 'user-not-found';
        // throw Exception('The account with this email and password does not exist.');
      }else{
        throw 'Internet Connection Error';
      }
    } catch (e) {
    rethrow;
    }
  }

  static Future<void> deleteCurrentUser() async {
    try {
      if (isLogin) {
        await _auth.currentUser?.delete();
      }
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'Internet Connection Error';
    } catch (e) {
    rethrow;
    }
  }
  static Future<UserCredential> signUpUser(
      String email, String password) async {
    try {
      final _credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // AppData.setUserId(_credential.user!.uid);
      return _credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw ('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw ('The account already exists for that email.');
      } else {
        throw e.message ?? 'Internet Connection Error';
    }
    } catch (e) {
    rethrow;
    }
  }

  static Future<UserCredential> signInWithGoogle() async {
    try {
      await _googleSignIn.signOut();
      final _account = await _googleSignIn.signIn();
      final _authentication = await _account!.authentication;
      final _authCredential = GoogleAuthProvider.credential(
        accessToken: _authentication.accessToken,
        idToken: _authentication.idToken,
      );
      final authResult = await _auth.signInWithCredential(_authCredential);
      // await AppData.setUserId(authResult.user.uid);
      return authResult;
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> phoneAuth({
    required String phone,
    required Function(PhoneAuthCredential) onCompleted,
    required void Function(String error, bool isPop) onError,
    required void Function(String verificationId) onCodeSent,
    required void Function(String verificationId) onTimeOut,
  }) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: onCompleted,
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          onError(
          'The provided phone number is not valid.',
          true,
          );
        }
      },
      timeout: const Duration(seconds: 120),
      codeSent: (String verificationId, int? resendToken) {
        onCodeSent(verificationId);
      },
      codeAutoRetrievalTimeout: onTimeOut,
    );
  }
  static Future<UserCredential> signInWithCredentials(
      AuthCredential credential) async {
    return await _auth.signInWithCredential(credential);
  }
  static Future<void> sendForgotPasswordEMail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
  static Future<void> signOut() async {
    await _auth.signOut();
    // await _googleSignIn.signOut();
    // await _facebookAuth.logOut();
    await AppData.clear();
  }


// static Future<UserCredential> signInWithFacebook() async {
//   try {
//     final _account = await _facebookAuth.login();
//     if (_account.status != LoginStatus.success) {
//       throw _account.message ?? 'Facebook Login Failed';
//   }
//   final _facebookAuthCredential =
//   FacebookAuthProvider.credential(_account.accessToken!.token);
//   final _authResult =
//   await _auth.signInWithCredential(_facebookAuthCredential);
//   return _authResult;
//   } catch (e) {
//   rethrow;
//   }
// }
// static Future<UserCredential> signInWithApple() async {
//   try {
//     final appleCredentials = await SignInWithApple.getAppleIDCredential(
//       scopes: [
//         AppleIDAuthorizationScopes.email,
//         AppleIDAuthorizationScopes.fullName,
//       ],
//     );
//     final credential = OAuthProvider(‘apple.com’).credential(
//       idToken: appleCredentials.identityToken,
//       accessToken: appleCredentials.authorizationCode,
//     );
//     final _authResult = await _auth.signInWithCredential(credential);
//     return _authResult;
//   } catch (e) {
//   throw ‘Apple authorization cancelled’;
// }
// }


}