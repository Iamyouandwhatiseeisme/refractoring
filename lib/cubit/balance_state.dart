part of 'balance_cubit.dart';

@immutable
class BalanceState {
  final double balance;

  const BalanceState({required this.balance});
}

class ErrorState extends BalanceState {
  final String errorMessage;

  const ErrorState({required super.balance, required this.errorMessage});

  List<Object> get props => [errorMessage];
}
