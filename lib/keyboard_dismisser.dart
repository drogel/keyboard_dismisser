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
  /// A [GestureType] that represents the event in which a pointer that might
  /// cause a tap has contacted the screen at a particular location.
  onTapDown,

  /// A [GestureType] that represents the event in which a pointer that will
  /// trigger a tap has stopped contacting the screen at a particular location.
  onTapUp,

  /// A [GestureType] that represents the event in which a tap has occurred.
  onTap,

  /// A [GestureType] that represents the event in which the pointer that
  /// previously triggered a [GestureType.onTapDown] event will not end up
  /// causing a tap.
  onTapCancel,

  /// A [GestureType] that represents the event in which a pointer that might
  /// cause a secondary tap has contacted the screen at a particular location.
  onSecondaryTapDown,

  /// A [GestureType] that represents the event in which a pointer that will
  /// trigger a secondary tap has stopped contacting the screen at a particular
  /// location.
  onSecondaryTapUp,

  /// A [GestureType] that represents the event in which the pointer that
  /// previously triggered [GestureType.onSecondaryTapDown] will not end up
  /// causing a tap.
  onSecondaryTapCancel,

  /// A [GestureType] that represents the event in which a pointer that might
  /// cause a double tap has contacted the screen at a particular location.
  onDoubleTap,

  /// A [GestureType] that represents the event in which a long press gesture
  /// has been recognized.
  onLongPress,

  /// A [GestureType] that represents the event in which a long press gesture
  /// has been recognized.
  onLongPressStart,

  /// A [GestureType] that represents the event in which a pointer has been
  /// drag-moved after a long-press.
  onLongPressMoveUpdate,

  /// A [GestureType] that represents the event in which a pointer that has
  /// triggered a long-press has stopped contacting the screen.
  onLongPressUp,

  /// A [GestureType] that represents the event in which a pointer that has
  /// triggered a long-press has stopped contacting the screen.
  onLongPressEnd,

  /// A [GestureType] that represents the event in which a pointer has
  /// contacted the screen and might begin to move vertically.
  onVerticalDragDown,

  /// A [GestureType] that represents the event in which a pointer has
  /// contacted the screen and has begun to move vertically.
  onVerticalDragStart,

  /// A [GestureType] that represents the event in which a pointer that is in
  /// contact with the screen and moving vertically has moved in the vertical
  /// direction.
  onVerticalDragUpdate,

  /// A [GestureType] that represents the event in which a pointer that was
  /// previously in contact with the screen and moving vertically is no longer
  /// in contact with the screen and was moving at a specific velocity when it
  /// stopped contacting the screen.
  onVerticalDragEnd,

  /// A [GestureType] that represents the event in which the pointer that
  /// previously triggered [GestureType.onVerticalDragDown] did not complete.
  onVerticalDragCancel,

  /// A [GestureType] that represents the event in which a pointer has
  /// contacted the screen and might begin to move horizontally.
  onHorizontalDragDown,

  /// A [GestureType] that represents the event in which a pointer has
  /// contacted the screen and has begun to move horizontally.
  onHorizontalDragStart,

  /// A [GestureType] that represents the event in which a pointer that is in
  /// contact with the screen and moving horizontally has moved in the
  /// horizontal direction.
  onHorizontalDragUpdate,

  /// A [GestureType] that represents the event in which a pointer that was
  /// previously in contact with the screen and moving horizontally is no
  /// longer in contact with the screen and was moving at a specific velocity
  /// when it stopped contacting the screen.
  onHorizontalDragEnd,

  /// A [GestureType] that represents the event in which the pointer that
  /// previously triggered [GestureType.onHorizontalDragDown] did not complete.
  onHorizontalDragCancel,

  /// A [GestureType] that represents the event in which the pointer is in
  /// contact with the screen and has pressed with sufficient force to initiate
  /// a force press.
  onForcePressStart,

  /// A [GestureType] that represents the event in which the pointer is in
  /// contact with the screen and has pressed with the maximum force.
  onForcePressPeak,

  /// A [GestureType] that represents the event in which a pointer is in
  /// a contact with force with the screen and is either moving on the
  /// plane of the screen, pressing the screen with varying forces or both
  /// simultaneously.
  onForcePressUpdate,

  /// A [GestureType] that represents the event in which the pointer is no
  /// longer in contact with the screen.
  onForcePressEnd,

  /// A [GestureType] that represents the event in which a pointer has
  /// contacted the screen and might begin to move.
  onPanDown,

  /// A [GestureType] that represents the event in which a pointer has
  /// contacted the screen and has begun to move.
  onPanStart,

  /// A [GestureType] that represents the event in which a pointer that is in
  /// contact with the screen and moving has moved again.
  onPanUpdateAnyDirection,

  /// A [GestureType] that represents the event in which a pointer that is in
  /// contact with the screen and moving has moved again, moving vertically in
  /// a downward direction.
  onPanUpdateDownDirection,

  /// A [GestureType] that represents the event in which a pointer that is in
  /// contact with the screen and moving has moved again, moving vertically in
  /// a upward direction.
  onPanUpdateUpDirection,

  /// A [GestureType] that represents the event in which a pointer that is in
  /// contact with the screen and moving has moved again, moving horizontally
  /// in a leftward direction.
  onPanUpdateLeftDirection,

  /// A [GestureType] that represents the event in which a pointer that is in
  /// contact with the screen and moving has moved again, moving horizontally
  /// in a rightward direction.
  onPanUpdateRightDirection,

  /// A [GestureType] that represents the event in which a pointer that was
  /// previously in contact with the screen and moving is no longer in contact
  /// with the screen and was moving at a specific velocity when it stopped
  /// contacting the screen.
  onPanEnd,

  /// A [GestureType] that represents the event in which the pointer that
  /// previously triggered [GestureType.onPanDown] did not complete.
  onPanCancel,

  /// A [GestureType] that represents the event in which the pointers in
  /// contact with the screen have established a focal point.
  onScaleStart,

  /// A [GestureType] that represents the event in which the pointers in
  /// contact with the screen have indicated a new focal point and/or scale.
  onScaleUpdate,

  /// A [GestureType] that represents the event in which the pointers are no
  /// longer in contact with the screen.
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
  }) : super(key: key);

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

  void _unfocus(BuildContext context) =>
      WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus();

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
