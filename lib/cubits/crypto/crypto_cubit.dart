import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:crypto/models/crypto_model.dart';
import 'package:crypto/services/crypto_service.dart';

part 'crypto_state.dart';

class CryptoCubit extends Cubit<CryptoState> {
  CryptoCubit() : super(CryptoInitial());

  CryptoService _CryptoService = CryptoService();

  LoadDataCrypto() async {
    var res = await _CryptoService.GETCrypto();
    res.fold(
      (l) => print(l),
      (r) => emit(
        CryptoData(r),
      ),
    );
  }
}
