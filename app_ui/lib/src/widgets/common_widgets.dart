import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class CommonWidgets {
  CommonWidgets._();

  static AppBar appBar(
    BuildContext context,
    String title, {
    bool showBack = true,
  }) {
    return AppBar(
      elevation: 10,
      title: Text(title),
      centerTitle: true,
      leading: showBack
          ? IconButton(
              icon: const Icon(Icons.keyboard_arrow_left),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null,
    );
  }

  // static Widget commonButton(
  //   BuildContext context,
  //   String label, {
  //   Function()? onPressed,
  //   Widget? icon,
  // }) {
  //   return SizedBox(
  //     width: MediaQuery.of(context).size.width,
  //     child: icon != null
  //         ? ElevatedButton.icon(
  //             icon: icon,
  //             onPressed: onPressed ?? () {},
  //             label: Text(label),
  //           )
  //         : ElevatedButton(
  //             onPressed: onPressed ?? () {},
  //             child: Text(label),
  //           ),
  //   );
  // }

  static Widget messageButton(
    BuildContext context,
    String label,
    String msg,
    IconData icon,
    // Function()? onPressed,
  ) {
    return GestureDetector(
      // onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          image: const DecorationImage(
            fit: BoxFit.fitHeight,
            opacity: 0.1,
            image: AssetImage('assets/images/networking.png'),
          ),
          border: Border.all(color: ZeeveColors.gray),
          borderRadius: BorderRadius.circular(15),
          // border: Border.all(color: ZeeveColors.secondary),
        ),
        width: MediaQuery.of(context).size.width * 0.4,
        height: 250,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // CircleAvatar(
            //   radius: 30,
            //   backgroundColor: ZeeveColors.primary,
            //   foregroundColor: ZeeveColors.white,
            //   child: Icon(icon, size: 35),
            // ),
            // Text(
            //   label,
            //   style: const TextStyle(
            //     color: ZeeveColors.secondary,
            //     fontSize: 18,
            //   ),
            // ),
            Text(
              msg,
              style: const TextStyle(color: ZeeveColors.black),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
