import 'package:crypto/cubits/crypto/crypto_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoScreen extends StatefulWidget {
  const CryptoScreen({super.key});

  @override
  State<CryptoScreen> createState() => _CryptoScreenState();
}

class _CryptoScreenState extends State<CryptoScreen> {
  CryptoCubit _CryptoCubit = CryptoCubit();

  @override
  void initState() {
    _CryptoCubit.LoadDataCrypto();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Crypto'),
      ),
      body: BlocBuilder<CryptoCubit, CryptoState>(
        bloc: _CryptoCubit,
        builder: (context, state) {
          if (state is CryptoData) {
            return ListView.builder(
              itemCount: state.data.data?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.data.data?[index].name ?? ""),
                );
              },
            );
          }
          return const Center(
            child: Text('Loading Data'),
          );
        },
      ),
    );
  }
}
