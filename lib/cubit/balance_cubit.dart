import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'balance_state.dart';

class BalanceCubit extends Cubit<BalanceState> {
  BalanceCubit() : super(const BalanceState(balance: 12));

  void pay(double price) {
    if (state.balance > price) {
      final double newBalance = state.balance - price;
      emit(BalanceState(balance: newBalance));
    } else {
      emit(ErrorState(
          balance: state.balance,
          errorMessage:
              'Not enough balance, please add ${price - state.balance} \$'));
    }
  }
}
