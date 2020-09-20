import '../../../services/repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../../models/badge.dart';
part 'badge.vm.freezed.dart';

@freezed
abstract class BadgeState with _$BadgeState {
  const factory BadgeState.loading() = Loading;
  const factory BadgeState.loaded({List<Badge> badges}) = Loaded;
  const factory BadgeState.empty() = Empty;
}

class BadgeVM extends StateNotifier<BadgeState> with LocatorMixin {
  BadgeVM() : super(BadgeState.loading());

  @override
  void initState() {
    getBadges();
    super.initState();
  }

  Future<void> getBadges() async {
    print('called');
    final res = await read<AppRepository>().getAllBadges();
    print(res);

    if (res.isNotEmpty) {
      state = BadgeState.loaded(badges: res);
    } else {
      state = BadgeState.empty();
    }
  }
}
