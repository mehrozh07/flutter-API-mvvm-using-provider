import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String? title;
  final Function()? onTap;
  final bool loading;
  const RoundedButton({Key? key,
    required this.title,
    required this.onTap,
    this.loading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CupertinoButton(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.zero,
              onPressed: onTap,
              child: loading ?
              Transform.scale(
                scale: 0.5,
                child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 3,
                ),
              ) :
              Text("$title"),
          ),
        )
      ],
    );
  }
}
