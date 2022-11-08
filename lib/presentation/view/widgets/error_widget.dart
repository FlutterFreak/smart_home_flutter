import 'package:flutter/material.dart';
import 'package:smart_home_flutter/utils/resources.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(
      {Key? key, required this.refresh, required this.errorMessage})
      : super(key: key);

  final Function refresh;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              child: IconButton(
                icon: Icon(
                  Icons.refresh,
                  color: AppColors.primary,
                ),
                onPressed: () => refresh(),
              ),
            ),
            Text(
              errorMessage,
              style: TextStyles.body,
            ),
          ],
        ),
      ),
    );
  }
}
