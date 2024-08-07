import 'package:flutter/material.dart';

import '../utils/constants/color_constants.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: Container(
          width: 56.0,
          height: 56.0,
          decoration: const BoxDecoration(
            color: ColorConstants.primary,
            shape: BoxShape.circle,
          ),
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
