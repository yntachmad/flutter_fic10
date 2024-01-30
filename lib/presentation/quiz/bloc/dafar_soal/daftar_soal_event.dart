part of 'daftar_soal_bloc.dart';

@freezed
class DaftarSoalEvent with _$DaftarSoalEvent {
  const factory DaftarSoalEvent.started() = _Started;
  const factory DaftarSoalEvent.getDataSoal(List<Soal> data) = _GetDataSoal;
  const factory DaftarSoalEvent.nextSoal() = _NextSoal;
}
