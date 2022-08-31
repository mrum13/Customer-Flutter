import 'package:ats_customer/cubit/rating_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RatingStar extends StatelessWidget {
  final int index;

  const RatingStar({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<RatingCubit>().setStar(index);
      },
      child: Container(
        height: 32,
        width: 32,
        color: Colors.transparent,
      ),
    );
  }
}
