import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:uuid/uuid.dart';

import '../../../models/badge.dart';
import '../../../services/repository.dart';

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
    final res = await read<AppRepository>().getAllBadges();

    if (res.isNotEmpty) {
      state = BadgeState.loaded(badges: res);
    } else {
      state = BadgeState.empty();
    }
  }

  Future<void> addBadge(
      {Map<String, dynamic> form, bool isEditing = false, Badge badge}) async {
    final current = state;

    if (current is Loaded) {
      if (isEditing) {
        final image = form['image'].isEmpty ? null : form['image'][0];

        final Badge b = Badge(name: form['name'], bid: badge.bid);

        await read<AppRepository>().addBadge(
            b: b, image: image, imageUrl: badge.imageUrl, uuid: badge.bid);
      } else {
        final uuid = Uuid().v4();
        final image = form['image'][0];

        final Badge b = Badge(name: form['name'], bid: uuid);

        await read<AppRepository>().addBadge(b: b, image: image, uuid: uuid);
      }

      await getBadges();
    }
  }

  Future<void> deleteEvent({Badge badge}) async {
    final current = state;
    if (current is Loaded) {
      final newBadges = [...current.badges]..remove(badge);

      await read<AppRepository>()
          .deleteBadge(bid: badge.bid, imageUrl: badge.imageUrl);

      state = BadgeState.loaded(badges: newBadges);
    }
  }
}
