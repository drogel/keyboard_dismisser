library keyboard_dismisser;

import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

/// The gestures available to dismiss the keyboard with [KeyboardDismisser].
///
/// Note that these gestures are also the ones available in [GestureDetector]
/// from Flutter's widgets library, except for [onPanUpdateDownDirection],
/// [onPanUpdateUpDirection], [onPanUpdateLeftDirection] and
/// [onPanUpdateRightDirection], which are special types of
/// [onPanUpdateAnyDirection] (corresponding to [GestureDetector.onPanUpdate])
/// that will trigger the keyboard's dismissal when swiping only in the
/// specified direction (down, up, left and right, respectively).
///
/// Just like with [GestureDetector], pan and scale callbacks cannot be used
/// simultaneously, and horizontal and vertical drag callbacks cannot be used
/// simultaneously.
///
/// See also:
/// - [GestureDetector], which is a widget that detects gestures, on which this
/// package is based.
enum GestureType {
  onTapDown,
  onTapUp,
  onTap,
  onTapCancel,
  onSecondaryTapDown,
  onSecondaryTapUp,
  onSecondaryTapCancel,
  onDoubleTap,
  onLongPress,
  onLongPressStart,
  onLongPressMoveUpdate,
  onLongPressUp,
  onLongPressEnd,
  onVerticalDragDown,
  onVerticalDragStart,
  onVerticalDragUpdate,
  onVerticalDragEnd,
  onVerticalDragCancel,
  onHorizontalDragDown,
  onHorizontalDragStart,
  onHorizontalDragUpdate,
  onHorizontalDragEnd,
  onHorizontalDragCancel,
  onForcePressStart,
  onForcePressPeak,
  onForcePressUpdate,
  onForcePressEnd,
  onPanDown,
  onPanStart,
  onPanUpdateAnyDirection,
  onPanUpdateDownDirection,
  onPanUpdateUpDirection,
  onPanUpdateLeftDirection,
  onPanUpdateRightDirection,
  onPanEnd,
  onPanCancel,
  onScaleStart,
  onScaleUpdate,
  onScaleEnd,
}

class KeyboardDismisser extends StatelessWidget {
  const KeyboardDismisser({
    Key key,
    this.child,
    this.behavior,
    this.gestures = const [GestureType.onTap],
    this.dragStartBehavior = DragStartBehavior.start,
    this.excludeFromSemantics = false,
  })
      : assert(gestures != null),
        super(key: key);

  final Widget child;
  final List<GestureType> gestures;
  final DragStartBehavior dragStartBehavior;
  final HitTestBehavior behavior;
  final bool excludeFromSemantics;

  void _shouldUnfocus(BuildContext context) {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void _shouldUnfocusWithDetails(BuildContext context,
      DragUpdateDetails details,) {
    final dy = details.delta.dy;
    final dx = details.delta.dx;
    final isMainlyHorizontal = dx.abs() - dy.abs() > 0;
    if (gestures.contains(GestureType.onPanUpdateDownDirection) &&
        dy > 0 && !isMainlyHorizontal) {
      _shouldUnfocus(context);
    } else if (gestures.contains(GestureType.onPanUpdateUpDirection) &&
        dy < 0 && !isMainlyHorizontal) {
      _shouldUnfocus(context);
    } else if (gestures.contains(GestureType.onPanUpdateRightDirection) &&
        dx > 0 && isMainlyHorizontal) {
      _shouldUnfocus(context);
    } else if (gestures.contains(GestureType.onPanUpdateLeftDirection) &&
        dx < 0 && isMainlyHorizontal) {
      _shouldUnfocus(context);
    }
  }

  bool _gesturesContainsDirectionalPanUpdate() =>
      gestures.contains(GestureType.onPanUpdateDownDirection) ||
          gestures.contains(GestureType.onPanUpdateUpDirection) ||
          gestures.contains(GestureType.onPanUpdateRightDirection) ||
          gestures.contains(GestureType.onPanUpdateLeftDirection);

  @override
  Widget build(BuildContext context) =>
      GestureDetector(
        excludeFromSemantics: excludeFromSemantics,
        dragStartBehavior: dragStartBehavior,
        behavior: behavior,
        onTap: gestures.contains(GestureType.onTap)
            ? () => _shouldUnfocus(context)
            : null,
        onTapDown: gestures.contains(GestureType.onTapDown)
            ? (_) => _shouldUnfocus(context)
            : null,
        onPanUpdate: gestures.contains(GestureType.onPanUpdateAnyDirection)
            ? (_) => _shouldUnfocus(context)
            : null,
        onTapUp: gestures.contains(GestureType.onTapUp)
            ? (_) => _shouldUnfocus(context)
            : null,
        onTapCancel: gestures.contains(GestureType.onTapCancel)
            ? () => _shouldUnfocus(context)
            : null,
        onSecondaryTapDown: gestures.contains(GestureType.onSecondaryTapDown)
            ? (_) => _shouldUnfocus(context)
            : null,
        onSecondaryTapUp: gestures.contains(GestureType.onSecondaryTapUp)
            ? (_) => _shouldUnfocus(context)
            : null,
        onSecondaryTapCancel:
        gestures.contains(GestureType.onSecondaryTapCancel)
            ? () => _shouldUnfocus(context)
            : null,
        onDoubleTap: gestures.contains(GestureType.onDoubleTap)
            ? () => _shouldUnfocus(context)
            : null,
        onLongPress: gestures.contains(GestureType.onLongPress)
            ? () => _shouldUnfocus(context)
            : null,
        onLongPressStart: gestures.contains(GestureType.onLongPressStart)
            ? (_) => _shouldUnfocus(context)
            : null,
        onLongPressMoveUpdate:
        gestures.contains(GestureType.onLongPressMoveUpdate)
            ? (_) => _shouldUnfocus(context)
            : null,
        onLongPressUp: gestures.contains(GestureType.onLongPressUp)
            ? () => _shouldUnfocus(context)
            : null,
        onLongPressEnd: gestures.contains(GestureType.onLongPressEnd)
            ? (_) => _shouldUnfocus(context)
            : null,
        onVerticalDragDown: gestures.contains(GestureType.onVerticalDragDown)
            ? (_) => _shouldUnfocus(context)
            : null,
        onVerticalDragStart: gestures.contains(GestureType.onVerticalDragStart)
            ? (_) => _shouldUnfocus(context)
            : null,
        onVerticalDragUpdate:
        _gesturesContainsDirectionalPanUpdate()
            ? (details) => _shouldUnfocusWithDetails(context, details)
            : null,
        onVerticalDragEnd: gestures.contains(GestureType.onVerticalDragEnd)
            ? (_) => _shouldUnfocus(context)
            : null,
        onVerticalDragCancel:
        gestures.contains(GestureType.onVerticalDragCancel)
            ? () => _shouldUnfocus(context)
            : null,
        onHorizontalDragDown:
        gestures.contains(GestureType.onHorizontalDragDown)
            ? (_) => _shouldUnfocus(context)
            : null,
        onHorizontalDragStart:
        gestures.contains(GestureType.onHorizontalDragStart)
            ? (_) => _shouldUnfocus(context)
            : null,
        onHorizontalDragUpdate:
        _gesturesContainsDirectionalPanUpdate()
            ? (details) => _shouldUnfocusWithDetails(context, details)
            : null,
        onHorizontalDragEnd: gestures.contains(GestureType.onHorizontalDragEnd)
            ? (_) => _shouldUnfocus(context)
            : null,
        onHorizontalDragCancel:
        gestures.contains(GestureType.onHorizontalDragCancel)
            ? () => _shouldUnfocus(context)
            : null,
        onForcePressStart: gestures.contains(GestureType.onForcePressStart)
            ? (_) => _shouldUnfocus(context)
            : null,
        onForcePressPeak: gestures.contains(GestureType.onForcePressPeak)
            ? (_) => _shouldUnfocus(context)
            : null,
        onForcePressUpdate: gestures.contains(GestureType.onForcePressUpdate)
            ? (_) => _shouldUnfocus(context)
            : null,
        onForcePressEnd: gestures.contains(GestureType.onForcePressEnd)
            ? (_) => _shouldUnfocus(context)
            : null,
        onPanDown: gestures.contains(GestureType.onPanDown)
            ? (_) => _shouldUnfocus(context)
            : null,
        onPanStart: gestures.contains(GestureType.onPanStart)
            ? (_) => _shouldUnfocus(context)
            : null,
        onPanEnd: gestures.contains(GestureType.onPanEnd)
            ? (_) => _shouldUnfocus(context)
            : null,
        onPanCancel: gestures.contains(GestureType.onPanCancel)
            ? () => _shouldUnfocus(context)
            : null,
        onScaleStart: gestures.contains(GestureType.onScaleStart)
            ? (_) => _shouldUnfocus(context)
            : null,
        onScaleUpdate: gestures.contains(GestureType.onScaleUpdate)
            ? (_) => _shouldUnfocus(context)
            : null,
        onScaleEnd: gestures.contains(GestureType.onScaleEnd)
            ? (_) => _shouldUnfocus(context)
            : null,
        child: child,
      );
}
