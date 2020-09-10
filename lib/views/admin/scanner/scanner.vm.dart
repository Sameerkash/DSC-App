import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../services/repository.dart';
import 'package:state_notifier/state_notifier.dart';
part 'scanner.vm.freezed.dart';

@freezed
abstract class ScannerState with _$ScannerState {
  const factory ScannerState.loading() = Loading;
  const factory ScannerState.confirmed() = Confirmed;
  const factory ScannerState.error() = Error;
}

class ScannerVM extends StateNotifier<ScannerState> with LocatorMixin {
  ScannerVM() : super(ScannerState.loading());

  Future<bool> confirmAttendee({String uid, String eid}) async {
    final current = state;

    if (current is Loading) {
      final res = await read<AppRepository>().confirmRegistration(eid, uid);
      // final res = true;
      if (res) {
        state = ScannerState.confirmed();
        return true;
      } else {
        print("error");
        ScannerState.error();
        return false;
      }
    }
  }

  void newScan() {
    final current = state;
    if (current is Confirmed) {
      state = ScannerState.loading();
    }
  }
}
