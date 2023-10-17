import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth{
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> mailSignIn({required String mail, required String passwd})async {
    await firebaseAuth.signInWithEmailAndPassword(email: mail, password: passwd);
  }
  Future<void> mailSignUp({required String mail, required String passwd})async {
    await firebaseAuth.createUserWithEmailAndPassword(email: mail, password: passwd);
  }
  Future<void> signOut() async{
    await firebaseAuth.signOut();
  }
  Future<void> googleSignIn() async{
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential cred = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken
    );

    await firebaseAuth.signInWithCredential(cred);
  }

  Future<void> facebookSignIn() async{
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookCred = FacebookAuthProvider.credential(loginResult.accessToken!.token);
    firebaseAuth.signInWithCredential(facebookCred);
  }
  Future<void> appleSignIn() async {
    final appleProvider = AppleAuthProvider();
    await firebaseAuth.signInWithProvider(appleProvider);
  }
}