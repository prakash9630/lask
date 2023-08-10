import 'package:freezed_annotation/freezed_annotation.dart';
part 'form_status.freezed.dart';
@Freezed(map: FreezedMapOptions.none)
class FormStatus with _$FormStatus {
  const factory FormStatus.initial() = _Initial;

  const factory FormStatus.invalid() = _Invalid;

  const factory FormStatus.submitting() = _Submitting;

  const factory FormStatus.error() = _Error;

  const factory FormStatus.success() = _Success;
}
