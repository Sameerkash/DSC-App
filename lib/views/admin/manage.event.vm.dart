import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

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
}
