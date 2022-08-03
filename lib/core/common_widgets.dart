import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class CommonWidgets {
  Widget commonButton(BuildContext context, String label,
      {Function()? onPressed, Widget? icon}) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: icon != null
            ? ElevatedButton.icon(
                icon: icon,
                onPressed: onPressed ?? () {},
                label: Text(label),
              )
            : ElevatedButton(
                onPressed: onPressed ?? () {},
                child: Text(label),
              ));
  }

  Widget messageButton(
      String label, String msg, IconData icon, Function()? onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: ZeeveColors.ternary,
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            // border: Border.all(color: ZeeveColors.secondary),
          ),
          width: 180,
          height: 250,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: ZeeveColors.primary,
                  foregroundColor: ZeeveColors.ternary,
                  child: Icon(icon, size: 35),
                ),
                Text(label,
                    style: const TextStyle(
                        color: ZeeveColors.secondary, fontSize: 18)),
                Text(msg,
                    style: const TextStyle(color: ZeeveColors.black54),
                    textAlign: TextAlign.center)
              ])),
    );
  }
}
