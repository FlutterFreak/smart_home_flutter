import 'package:flutter/material.dart';
import 'package:smart_home_flutter/utils/app_assets.dart';

import '../../../utils/resources.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            welcomeText,
            style: TextStyles.headline4,
          ),
        ),
        const CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage(profile),
        ),
      ],
    );
  }
}
