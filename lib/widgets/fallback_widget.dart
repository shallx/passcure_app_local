import 'package:flutter/material.dart';

class FallbackWidget extends StatelessWidget {
  const FallbackWidget({
    Key key,
    @required this.check,
    this.isLoading = false,
    @required this.child,
    this.fallbackWidget,
    this.showLoader = false,
    this.loader,

    /// true is set to show shimmer,
    /// set [false] to not show child
    this.loadChildIfLoading = true,
  }) : super(key: key);

  /// pass an object in [check] to see if it is null, zero
  /// or false. If not then passed child will be painted
  /// or else fallback object will be drawn
  final dynamic check;
  final Widget Function() child;
  final bool isLoading;
  final Widget fallbackWidget;
  final Widget loader;

  /// Show loader if [isLoading] is true
  final bool showLoader;

  final bool loadChildIfLoading;

  // Only to make it easier to read
  bool get isNotLoading => !isLoading;

  @override
  Widget build(BuildContext context) {
    if (showLoader == true && isLoading == true) {
      return loader ?? const CircularProgressIndicator();
    }
    return (isNotLoading &&
            (check == null ||
                (check is num && check == 0) ||
                (check is List && check.length == 0) ||
                (check is bool && check == false) ||
                (check is String && check == '')))
        // If it is not loading and  check is not valid then fallback widget will be painted
        ? (fallbackWidget ?? const SizedBox.shrink())
        // if it is loading or check is valid then child will be painted
        : loadChildIfLoading
            ? child()
            : (fallbackWidget ?? const SizedBox.shrink());
  }
}
