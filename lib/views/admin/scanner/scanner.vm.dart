foldeimport 'package:freezed_annotation/freezed_annotation.dart';
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






}
