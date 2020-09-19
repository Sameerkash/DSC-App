import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../models/event.dart';
import '../../models/user.dart';
import '../../services/repository.dart';

part 'profile.vm.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState.loading() = Loading;
  const factory ProfileState.loaded({AppUser user, List<Event> events}) =
      Loaded;
  const factory ProfileState.error({String error}) = Error;
}

class ProfileVM extends StateNotifier<ProfileState> with LocatorMixin {
  ProfileVM() : super(ProfileState.loading());

  @override
  void initState() {
    fetchProfile();
    super.initState();
  }

  Future<void> fetchProfile() async {
    final result = await read<AppRepository>().getLoggedInUser();

    final events = await read<AppRepository>().fecthMyEvents(uid: result.uid);

    state = ProfileState.loaded(user: result, events: [...events]);
  }

  Future<void> updateProfile(Map<String, dynamic> userForm) async {
    final current = state;
    if (current is Loaded) {
      final AppUser newProfile = AppUser(
        uid: current.user.uid,
        isAdmin: current.user.isAdmin,
        imageUrl: current.user.imageUrl,
        email: current.user.email,
        userName: userForm['name'],
        phone: userForm['phone'],
        usn: userForm['usn'].toUpperCase(),
      );

      await read<AppRepository>().updateProfile(user: newProfile);

      await fetchProfile();
    }
  }
}
