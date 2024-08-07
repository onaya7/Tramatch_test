import 'package:flutter/material.dart';
import 'package:tramatch_test/core/device/sizes/sizes.dart';

import '../../../../utils/constants/color_constants.dart';

class AlreadyHave extends StatelessWidget {
  final String text;
  final String authName;
  final void Function()? onPressed;
  const AlreadyHave({
    required this.text,
    required this.authName,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Sizes.screenWidth(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: ColorConstants.textBody,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          GestureDetector(
            onTap: onPressed,
            child: Text(
              authName,
              style: const TextStyle(
                color: ColorConstants.primary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
                decorationColor: ColorConstants.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
