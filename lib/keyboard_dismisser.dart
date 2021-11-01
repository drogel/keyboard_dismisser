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
///
///   * [GestureDetector], which is a widget that detects gestures.
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

/// A widget that can dismiss the keyboard when performing a gesture.
///
/// Wrapping any widget with this widget will trigger the keyboard's dismissal
/// when performing a gesture in an area of the screen with no other widgets
/// that can absorb the gesture in it. For example, if a [KeyboardDismisser]
/// that is looking to dismiss the keyboard when performing a gesture of
/// [GestureType.onTap] is wrapping a widget that contains a button, the
/// keyboard will be dismissed when tapping outside of the button, but it won't
/// when tapped inside it, since the button will be pushed, absorbing the tap.
///
/// Typical usage of [KeyboardDismisser] involves wrapping a whole page with it,
/// including its [Scaffold], so that the keyboard is dismissed when tapping on
/// any inactive widget. For example:
///
/// ```dart
/// class KeyboardDismissiblePageWithButton extends StatelessWidget {
///  @override
///  Widget build(BuildContext context) => KeyboardDismisser(
///        child: Scaffold(
///          appBar: AppBar(
///            title: Text('KeyboardDismisser example'),
///          ),
///          body: Column(
///            children: <Widget>[
///              Padding(
///                padding: const EdgeInsets.all(42.0),
///                child: TextField(
///                  decoration: InputDecoration(
///                    border: OutlineInputBorder(),
///                    labelText: 'Tap to show the keyboard',
///                    hintText: 'Tap elsewhere to dismiss',
///                  ),
///                ),
///              ),
///              Center(
///                child: RaisedButton(
///                  onPressed: () => print('Keyboard persists'),
///                  child: Text('Tap me!'),
///                ),
///              ),
///            ],
///          ),
///        ),
///      );
/// }
/// ```
///
/// Wrapping a [MaterialApp], [WidgetsApp] or [CupertinoApp] with a
/// [KeyboardDismisser] will make the whole app acquire the behaviour from
/// [KeyboardDismisser], since every [Scaffold] will be a child of the
/// corresponding app widget.
class KeyboardDismisser extends StatelessWidget {
  /// Creates a widget that can dismiss the keyboard when performing a gesture.
  ///
  /// The [gestures] property holds a list of [GestureType] that will dismiss
  /// the keyboard when performed. This way, several gestures are supported.
  /// Pan and scale callbacks cannot be used simultaneously, and horizontal and
  /// vertical drag callbacks cannot be used simultaneously. By default, the
  /// [KeyboardDismisser] will dismiss the keyboard when performing a tapping
  /// gesture.
  const KeyboardDismisser({
    Key? key,
    this.child,
    this.behavior,
    this.gestures = const [GestureType.onTap],
    this.dragStartBehavior = DragStartBehavior.start,
    this.excludeFromSemantics = false,
    this.onKeyboardFocusChanged,
  }) : super(key: key);

  /// The callback function that will invoke when keyboard focus is changed
  final VoidCallback? onKeyboardFocusChanged;

  /// The list of gestures that will dismiss the keyboard when performed.
  final List<GestureType> gestures;

  /// Determines the way that drag start behavior is handled.
  ///
  /// See also:
  ///
  ///   * [GestureDetector.dragStartBehavior], which determines when a drag
  ///   formally starts when the user initiates a drag.
  final DragStartBehavior dragStartBehavior;

  /// How the this widget's [GestureDetector] should behave when hit testing.
  ///
  /// See also:
  ///
  ///   * [GestureDetector.behavior], which defaults to
  ///   [HitTestBehavior.deferToChild] if [child] is not null and
  ///   [HitTestBehavior.translucent] if child is null.
  final HitTestBehavior? behavior;

  /// Whether to exclude these gestures from the semantics tree.
  ///
  /// See also:
  ///
  ///   * [GestureDetector.excludeFromSemantics], which includes an example of
  ///   a case where this property can be used.
  final bool excludeFromSemantics;

  /// The widget below this widget in the tree.
  final Widget? child;

  @override
  Widget build(BuildContext context) => GestureDetector(
        excludeFromSemantics: excludeFromSemantics,
        dragStartBehavior: dragStartBehavior,
        behavior: behavior,
        onTap: gestures.contains(GestureType.onTap)
            ? () => _unfocus(context)
            : null,
        onTapDown: gestures.contains(GestureType.onTapDown)
            ? (_) => _unfocus(context)
            : null,
        onPanUpdate: gestures.contains(GestureType.onPanUpdateAnyDirection)
            ? (_) => _unfocus(context)
            : null,
        onTapUp: gestures.contains(GestureType.onTapUp)
            ? (_) => _unfocus(context)
            : null,
        onTapCancel: gestures.contains(GestureType.onTapCancel)
            ? () => _unfocus(context)
            : null,
        onSecondaryTapDown: gestures.contains(GestureType.onSecondaryTapDown)
            ? (_) => _unfocus(context)
            : null,
        onSecondaryTapUp: gestures.contains(GestureType.onSecondaryTapUp)
            ? (_) => _unfocus(context)
            : null,
        onSecondaryTapCancel:
            gestures.contains(GestureType.onSecondaryTapCancel)
                ? () => _unfocus(context)
                : null,
        onDoubleTap: gestures.contains(GestureType.onDoubleTap)
            ? () => _unfocus(context)
            : null,
        onLongPress: gestures.contains(GestureType.onLongPress)
            ? () => _unfocus(context)
            : null,
        onLongPressStart: gestures.contains(GestureType.onLongPressStart)
            ? (_) => _unfocus(context)
            : null,
        onLongPressMoveUpdate:
            gestures.contains(GestureType.onLongPressMoveUpdate)
                ? (_) => _unfocus(context)
                : null,
        onLongPressUp: gestures.contains(GestureType.onLongPressUp)
            ? () => _unfocus(context)
            : null,
        onLongPressEnd: gestures.contains(GestureType.onLongPressEnd)
            ? (_) => _unfocus(context)
            : null,
        onVerticalDragDown: gestures.contains(GestureType.onVerticalDragDown)
            ? (_) => _unfocus(context)
            : null,
        onVerticalDragStart: gestures.contains(GestureType.onVerticalDragStart)
            ? (_) => _unfocus(context)
            : null,
        onVerticalDragUpdate: _gesturesContainsDirectionalPanUpdate()
            ? (details) => _unfocusWithDetails(context, details)
            : null,
        onVerticalDragEnd: gestures.contains(GestureType.onVerticalDragEnd)
            ? (_) => _unfocus(context)
            : null,
        onVerticalDragCancel:
            gestures.contains(GestureType.onVerticalDragCancel)
                ? () => _unfocus(context)
                : null,
        onHorizontalDragDown:
            gestures.contains(GestureType.onHorizontalDragDown)
                ? (_) => _unfocus(context)
                : null,
        onHorizontalDragStart:
            gestures.contains(GestureType.onHorizontalDragStart)
                ? (_) => _unfocus(context)
                : null,
        onHorizontalDragUpdate: _gesturesContainsDirectionalPanUpdate()
            ? (details) => _unfocusWithDetails(context, details)
            : null,
        onHorizontalDragEnd: gestures.contains(GestureType.onHorizontalDragEnd)
            ? (_) => _unfocus(context)
            : null,
        onHorizontalDragCancel:
            gestures.contains(GestureType.onHorizontalDragCancel)
                ? () => _unfocus(context)
                : null,
        onForcePressStart: gestures.contains(GestureType.onForcePressStart)
            ? (_) => _unfocus(context)
            : null,
        onForcePressPeak: gestures.contains(GestureType.onForcePressPeak)
            ? (_) => _unfocus(context)
            : null,
        onForcePressUpdate: gestures.contains(GestureType.onForcePressUpdate)
            ? (_) => _unfocus(context)
            : null,
        onForcePressEnd: gestures.contains(GestureType.onForcePressEnd)
            ? (_) => _unfocus(context)
            : null,
        onPanDown: gestures.contains(GestureType.onPanDown)
            ? (_) => _unfocus(context)
            : null,
        onPanStart: gestures.contains(GestureType.onPanStart)
            ? (_) => _unfocus(context)
            : null,
        onPanEnd: gestures.contains(GestureType.onPanEnd)
            ? (_) => _unfocus(context)
            : null,
        onPanCancel: gestures.contains(GestureType.onPanCancel)
            ? () => _unfocus(context)
            : null,
        onScaleStart: gestures.contains(GestureType.onScaleStart)
            ? (_) => _unfocus(context)
            : null,
        onScaleUpdate: gestures.contains(GestureType.onScaleUpdate)
            ? (_) => _unfocus(context)
            : null,
        onScaleEnd: gestures.contains(GestureType.onScaleEnd)
            ? (_) => _unfocus(context)
            : null,
        child: child,
      );

  void _unfocus(BuildContext context) {
    WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus();
    if (onKeyboardFocusChanged == null) return;
    onKeyboardFocusChanged!();
  }

  void _unfocusWithDetails(
    BuildContext context,
    DragUpdateDetails details,
  ) {
    final dy = details.delta.dy;
    final dx = details.delta.dx;
    final isDragMainlyHorizontal = dx.abs() - dy.abs() > 0;
    if (gestures.contains(GestureType.onPanUpdateDownDirection) &&
        dy > 0 &&
        !isDragMainlyHorizontal) {
      _unfocus(context);
    } else if (gestures.contains(GestureType.onPanUpdateUpDirection) &&
        dy < 0 &&
        !isDragMainlyHorizontal) {
      _unfocus(context);
    } else if (gestures.contains(GestureType.onPanUpdateRightDirection) &&
        dx > 0 &&
        isDragMainlyHorizontal) {
      _unfocus(context);
    } else if (gestures.contains(GestureType.onPanUpdateLeftDirection) &&
        dx < 0 &&
        isDragMainlyHorizontal) {
      _unfocus(context);
    }
  }

  bool _gesturesContainsDirectionalPanUpdate() =>
      gestures.contains(GestureType.onPanUpdateDownDirection) ||
      gestures.contains(GestureType.onPanUpdateUpDirection) ||
      gestures.contains(GestureType.onPanUpdateRightDirection) ||
      gestures.contains(GestureType.onPanUpdateLeftDirection);
}
