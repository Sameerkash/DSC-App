import 'package:dsckssem/models/user.dart';
import 'package:dsckssem/services/repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
part 'profile.vm.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState.loading() = Loading;
  const factory ProfileState.loaded({AppUser user}) = Loaded;
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

    state = ProfileState.loaded(user: result);
  }
}
