// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refactoring_excercise/button.dart';
import 'package:refactoring_excercise/cubit/balance_cubit.dart';
import 'package:refactoring_excercise/text_label.dart';

class PaymentDialog extends StatefulWidget {
  const PaymentDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentDialog> createState() => _PaymentDialogState();
}

class _PaymentDialogState extends State<PaymentDialog> {
  final double totalPrice = 5.0;
  final double commision = 0.0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BalanceCubit, BalanceState>(
      builder: (context, state) {
        return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Column(
              children: [
                TextLabel(
                  label: 'Balance :',
                  textColor: Colors.green,
                  textToDisplay: '${state.balance} \$',
                ),
                TextLabel(
                    label: 'Total Price: ',
                    textColor: Colors.red,
                    textToDisplay: totalPrice.toString()),
                TextLabel(
                    label: 'Commision: ',
                    textColor: Colors.red,
                    textToDisplay: '$commision \$'),
                const Divider(
                  thickness: 1,
                ),
                TextLabel(
                    label: 'New Balance: ',
                    textColor: Colors.red,
                    textToDisplay: '${state.balance - totalPrice} \$'),
              ],
            ),
            actions: <Widget>[
              Button(
                buttonColor: Colors.blue,
                buttonLabel: 'Pay',
                onPressed: () {
                  if (state is ErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errorMessage)));
                  } else {
                    BlocProvider.of<BalanceCubit>(context).pay(totalPrice);
                  }
                },
              ),
              Button(
                  onPressed: () => Navigator.of(context).pop(),
                  buttonLabel: 'Cancel',
                  buttonColor: Colors.black)
            ]);
      },
    );
  }
}
