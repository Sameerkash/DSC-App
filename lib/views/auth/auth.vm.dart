import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../models/user.dart';
import '../../services/repository.dart';

part 'auth.vm.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.loading() = Loading;
  const factory AuthState.authenticated({AppUser user}) = Auth;
  const factory AuthState.unauthenticated() = UnAuth;
}

class AuthVM extends StateNotifier<AuthState> with LocatorMixin {
  AuthVM() : super(AuthState.loading());

  @override
  void initState() {
    read<AppRepository>().auth.authStateChanges().listen((User firebaseUser) {
      if (firebaseUser == null) {
        state = AuthState.unauthenticated();
        print('User is currently signed out!');
      } else {
        setUser(firebaseUser: firebaseUser);
        
        print('User is signed in!');
      }
    });
    super.initState();
  }

  // request for uid, if exists, store in semabast, and update state
  // if doc not exists create a doc, update and set state

  Future<void> setUser({User firebaseUser}) async {
    await read<AppRepository>()
        .setUser(firebaseUser: firebaseUser, uid: firebaseUser.uid);

    final user = await read<AppRepository>().getLoggedInUser();

    state = AuthState.authenticated(user: user);
  }

  Future<void> googleSignIn() async {
    await read<AppRepository>().signInWithGoogle();
  }

  Future<void> signOut() async {
    await read<AppRepository>().signOut();
  }
}
