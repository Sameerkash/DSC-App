import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../../models/user.dart';
import '../../../services/repository.dart';

part 'manage.users.vm.freezed.dart';

@freezed
abstract class ManageUserState with _$ManageUserState {
  const factory ManageUserState.loading() = Loading;
  const factory ManageUserState.loaded({@Default([]) List<AppUser> users}) =
      Loaded;
  const factory ManageUserState.empty() = Empty;
}

class ManageUserVM extends StateNotifier<ManageUserState> with LocatorMixin {
  ManageUserVM() : super(ManageUserState.empty());

  Future<void> searchUser({@required String userName}) async {
    state = ManageUserState.loading();

    final current = state;
    if (current is Loading) {
      final res = await read<AppRepository>().serahcUser(userName: userName);
      print(res);

      if (res.isNotEmpty)
        state = ManageUserState.loaded(users: res);
      else
        state = ManageUserState.empty();
    }
  }

  Future<void> deleteUser({String uid, AppUser user}) async {
    final current = state;

    if (current is Loaded) {
      final newUsers = [...current.users]..remove(user);

      await read<AppRepository>().deleteUser(uid: uid);

      state = ManageUserState.loaded(users: newUsers);
    }
  }

  Future<void> makeUserAdmin({bool value, String uid}) async {
    
    await read<AppRepository>().makeAdmin(uid: uid, value: value);
  }
}
