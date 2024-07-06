part of 'crypto_cubit.dart';

@immutable
abstract class CryptoState {}

class CryptoInitial extends CryptoState {}

class CryptoData extends CryptoState {
  final CryptoModel data;
  CryptoData(this.data);
}
