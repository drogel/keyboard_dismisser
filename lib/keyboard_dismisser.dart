library keyboard_dismisser;

import 'package:flutter/widgets.dart';
import 'package:keyboard_dismisser/gesture_type.dart';

class PassiveKeyboardDismisser extends StatelessWidget {
  const PassiveKeyboardDismisser({
    Key key,
    this.child,
    this.gestures = const [GestureType.onTap],
  })  : assert(gestures != null),
        super(key: key);

  final Widget child;
  final List<GestureType> gestures;

  void _shouldUnfocus(BuildContext context, GestureType gesture) {
    if (gestures.contains(gesture)) {
      final currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => _shouldUnfocus(context, GestureType.onTap),
        onTapUp: (_) => _shouldUnfocus(context, GestureType.onTapUp),
        onTapCancel: () => _shouldUnfocus(context, GestureType.onTapCancel),
        onSecondaryTapDown: (_) =>
            _shouldUnfocus(context, GestureType.onSecondaryTapDown),
        onSecondaryTapUp: (_) =>
            _shouldUnfocus(context, GestureType.onSecondaryTapUp),
        onSecondaryTapCancel: () =>
            _shouldUnfocus(context, GestureType.onSecondaryTapCancel),
        onDoubleTap: () => _shouldUnfocus(context, GestureType.onDoubleTap),
        onLongPress: () => _shouldUnfocus(context, GestureType.onLongPress),
        onLongPressStart: (_) =>
            _shouldUnfocus(context, GestureType.onLongPressStart),
        onLongPressMoveUpdate: (_) =>
            _shouldUnfocus(context, GestureType.onLongPressMoveUpdate),
        onLongPressUp: () => _shouldUnfocus(context, GestureType.onLongPressUp),
        onLongPressEnd: (_) =>
            _shouldUnfocus(context, GestureType.onLongPressEnd),
        onVerticalDragDown: (_) =>
            _shouldUnfocus(context, GestureType.onVerticalDragDown),
        onVerticalDragStart: (_) =>
            _shouldUnfocus(context, GestureType.onVerticalDragStart),
        onVerticalDragUpdate: (_) =>
            _shouldUnfocus(context, GestureType.onVerticalDragUpdate),
        onVerticalDragEnd: (_) =>
            _shouldUnfocus(context, GestureType.onVerticalDragEnd),
        onVerticalDragCancel: () =>
            _shouldUnfocus(context, GestureType.onVerticalDragCancel),
        onHorizontalDragDown: (_) =>
            _shouldUnfocus(context, GestureType.onHorizontalDragDown),
        onHorizontalDragStart: (_) =>
            _shouldUnfocus(context, GestureType.onHorizontalDragStart),
        onHorizontalDragUpdate: (_) =>
            _shouldUnfocus(context, GestureType.onHorizontalDragUpdate),
        onHorizontalDragEnd: (_) =>
            _shouldUnfocus(context, GestureType.onHorizontalDragEnd),
        onHorizontalDragCancel: () =>
            _shouldUnfocus(context, GestureType.onHorizontalDragCancel),
        onForcePressStart: (_) =>
            _shouldUnfocus(context, GestureType.onForcePressStart),
        onForcePressPeak: (_) =>
            _shouldUnfocus(context, GestureType.onForcePressPeak),
        onForcePressUpdate: (_) =>
            _shouldUnfocus(context, GestureType.onForcePressUpdate),
        onForcePressEnd: (_) =>
            _shouldUnfocus(context, GestureType.onForcePressEnd),
        onPanDown: (_) => _shouldUnfocus(context, GestureType.onPanDown),
        onPanStart: (_) => _shouldUnfocus(context, GestureType.onPanStart),
        onPanUpdate: (_) => _shouldUnfocus(context, GestureType.onPanUpdate),
        onPanEnd: (_) => _shouldUnfocus(context, GestureType.onPanEnd),
        onPanCancel: () => _shouldUnfocus(context, GestureType.onPanCancel),
        onScaleStart: (_) => _shouldUnfocus(context, GestureType.onScaleStart),
        onScaleUpdate: (_) =>
            _shouldUnfocus(context, GestureType.onScaleUpdate),
        onScaleEnd: (_) => _shouldUnfocus(context, GestureType.onScaleEnd),
        child: child,
      );
}
