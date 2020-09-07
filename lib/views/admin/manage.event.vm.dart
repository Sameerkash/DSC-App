import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:uuid/uuid.dart';

import '../../models/event.dart';
import '../../services/repository.dart';

part 'manage.event.vm.freezed.dart';

@freezed
abstract class ManageEventState with _$ManageEventState {
  const factory ManageEventState.loading() = Loading;
  const factory ManageEventState.loaded({List<Event> event}) = Loaded;
  const factory ManageEventState.error({String error}) = Error;
}

class ManagaeEventVM extends StateNotifier<ManageEventState> with LocatorMixin {
  ManagaeEventVM() : super(ManageEventState.loading());

  @override
  void initState() {
    getEvents();
    super.initState();
  }

  Future<void> getEvents() async {
    final res = await read<AppRepository>().getEvents();
    state = ManageEventState.loaded(event: res);
  }

  Future<void> createEvent(
      {Map<String, dynamic> form, bool isEditing = false, Event eve}) async {
    print("called state");
    final current = state;
    if (current is Loaded) {
      if (isEditing) {
        final image = form['image'].isEmpty ? null : form['image'][0];
        print("called editing");

        final Event event = Event(
          name: form['name'],
          description: form['description'],
          time: form['date'],
          color: form['color'],
          secondaryColor: form['secondaryColor'],
          eid: eve.eid,
        );

        await read<AppRepository>().createEvent(
            event: event, image: image, uuid: eve.eid, imageUrl: eve.imageUrl);
      } else {
        final uuid = Uuid().v4();

        final Event event = Event(
          name: form['name'],
          description: form['description'],
          time: form['date'],
          color: form['color'],
          secondaryColor: form['secondaryColor'],
          eid: uuid,
        );

        await read<AppRepository>()
            .createEvent(event: event, uuid: uuid, image: form['image'][0]);
      }
      final res = await read<AppRepository>().getEvents();

      state = ManageEventState.loaded(event: [...res]);
    }
  }

  Future<void> deleteEvent({Event event}) async {
    final current = state;
    if (current is Loaded) {
      final newEvents = [...current.event]..remove(event);

      await read<AppRepository>()
          .deleteEvent(eid: event.eid, imageUrl: event.imageUrl);

      state = ManageEventState.loaded(event: newEvents);
    }
  }
}
