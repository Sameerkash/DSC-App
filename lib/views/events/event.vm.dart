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
}
