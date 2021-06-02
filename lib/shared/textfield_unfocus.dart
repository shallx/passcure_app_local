import 'package:flutter/material.dart';

Widget unfocus(BuildContext context, Widget child) {
  return Listener(
    onPointerDown: (_) {
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
        currentFocus.focusedChild.unfocus();
      }
    },
    child: child,
  );
}

class Unfocus extends StatelessWidget {
  final Widget child;

  const Unfocus({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: child,
    );
  }
}
