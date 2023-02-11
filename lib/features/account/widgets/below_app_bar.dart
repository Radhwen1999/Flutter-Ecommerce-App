import 'package:provider/provider.dart';

import '../../../constants/gloabal_variables.dart';
import 'package:flutter/material.dart';

import '../../../providers/user_provideer.dart';
class BelowAppBar extends StatelessWidget {
  const BelowAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Container(
      decoration: const BoxDecoration(
        gradient: GlobalVariables.appBarGradient,
      ),
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              text: 'Welcome, ',
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
              children: [
                TextSpan(
                  text: user.name,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w600, 
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
