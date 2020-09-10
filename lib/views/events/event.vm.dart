import 'package:dsckssem/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../models/event.dart';
import '../../services/repository.dart';

part 'event.vm.freezed.dart';

@freezed
abstract class EventState with _$EventState {
  const factory EventState.loading() = Loading;
  const factory EventState.loaded(
      {@Default([]) List<Event> events, AppUser user}) = Loaded;

  const factory EventState.error({String error}) = Error;
}

class EventVM extends StateNotifier<EventState> with LocatorMixin {
  EventVM() : super(EventState.loading());

  @override
  void initState() {
    getEvents();
    super.initState();
  }

  Future<void> getEvents() async {
    final res = await read<AppRepository>().getEvents();

    final user = await read<AppRepository>().getLoggedInUser();

    state = EventState.loaded(events: res, user: user);
  }

  Future<void> setIsRegistred(Event event) async {
    final current = state;

    if (current is Loaded) {
      final res =
          await read<AppRepository>().fetchEventregistrations(eid: event.eid);
      bool isregistered = false;

      res.forEach((u) {
        if (u.uid == current.user.uid) isregistered = true;
        return;
      });

      final eve = current.events.map((e) {
        if (e == event) {
          if (isregistered) {
            var eVe = e.copyWith(isRegistered: true);
            return eVe;
          }
        }
        return e;
      });

      state = EventState.loaded(user: current.user, events: [...eve]);
    }
  }

  Future<void> resgisterEvent({AppUser user, Event event}) async {
    final current = state;

    if (current is Loaded) {
      await read<AppRepository>().resgiterEvent(
          user: user, eid: event.eid, attendees: event.attendees + 1);

      final eve = current.events.map((e) {
        if (e == event) {
          var eVe = e.copyWith(attendees: e.attendees + 1, isRegistered: true);

          return eVe;
        }
        return e;
      });

      state = EventState.loaded(user: user, events: [...eve]);
    }
  }
}
