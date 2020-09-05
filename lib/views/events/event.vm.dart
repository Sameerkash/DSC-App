import 'package:dsckssem/models/event.dart';
import 'package:dsckssem/services/repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
part 'event.vm.freezed.dart';

@freezed
abstract class EventState with _$EventState {
  const factory EventState.loading() = Loading;
  const factory EventState.loaded({@Default([]) List<Event> events}) = Loaded;

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
    print(res);

    state = EventState.loaded(events: res);
  }
}
