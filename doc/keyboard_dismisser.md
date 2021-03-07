# keyboard_dismisser library documentation

## KeyboardDismisser class

A widget that can dismiss the keyboard when performing a gesture.

Wrapping any widget with this widget will trigger the keyboard's dismissal
when performing a gesture in an area of the screen with no other widgets
that can absorb the gesture in it. For example, if a `KeyboardDismisser`
that is looking to dismiss the keyboard when performing a gesture of
`GestureType.onTap` is wrapping a widget that contains a button, the
keyboard will be dismissed when tapping outside of the button, but it won't
when tapped inside it, since the button will be pushed, absorbing the tap.

Typical usage of `KeyboardDismisser` involves wrapping a whole page with it,
including its `Scaffold`, so that the keyboard is dismissed when tapping on
any inactive widget. For example:

```dart
class KeyboardDismissiblePageWithButton extends StatelessWidget {
 @override
 Widget build(BuildContext context) => KeyboardDismisser(
       child: Scaffold(
         appBar: AppBar(
           title: Text('KeyboardDismisser example'),
         ),
         body: Column(
           children: <Widget>[
             Padding(
               padding: const EdgeInsets.all(42.0),
               child: TextField(
                 decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   labelText: 'Tap to show the keyboard',
                   hintText: 'Tap elsewhere to dismiss',
                 ),
               ),
             ),
             Center(
               child: RaisedButton(
                 onPressed: () => print('Keyboard persists'),
                 child: Text('Tap me!'),
               ),
             ),
           ],
         ),
       ),
     );
}
```

Wrapping a `MaterialApp`, `WidgetsApp` or `CupertinoApp` with a
`KeyboardDismisser` will make the whole app acquire the behaviour from
`KeyboardDismisser`, since every `Scaffold` will be a child of the
corresponding app widget.


### Constructor

```dart
const KeyboardDismisser({
    Key? key,
    this.child,
    this.behavior,
    this.gestures = const [GestureType.onTap],
    this.dragStartBehavior = DragStartBehavior.start,
    this.excludeFromSemantics = false,
  });
```
 Creates a widget that can dismiss the keyboard when performing a gesture.

The `gestures] property holds a list of `GestureType` that will dismiss
the keyboard when performed. This way, several gestures are supported.
Pan and scale callbacks cannot be used simultaneously, and horizontal and
vertical drag callbacks cannot be used simultaneously. By default, the
`KeyboardDismisser` will dismiss the keyboard when performing a tapping
gesture.

### Properties

#### gestures (`List<GestureType>`)

The list of gestures that will dismiss the keyboard when performed.

#### dragStartBehavior (`DragStartBehavior`)

Determines the way that drag start behavior is handled.

#### behavior (`HitTestBehavior?`)

How the this widget's `GestureDetector` should behave when hit testing.

#### excludeFromSemantics (`bool`)

Whether to exclude these gestures from the semantics tree.

#### child (`Widget?`)

The widget below this widget in the tree.


## GestureType enum

The gestures available to dismiss the keyboard with `KeyboardDismisser`.

Note that these gestures are also the ones available in `GestureDetector`
from Flutter's widgets library, except for `onPanUpdateDownDirection`,
`onPanUpdateUpDirection`, `onPanUpdateLeftDirection` and
`onPanUpdateRightDirection`, which are special types of
`onPanUpdateAnyDirection` (corresponding to `GestureDetector.onPanUpdate`)
that will trigger the keyboard's dismissal when swiping only in the
specified direction (down, up, left and right, respectively).

Just like with `GestureDetector`, pan and scale callbacks cannot be used
simultaneously, and horizontal and vertical drag callbacks cannot be used
simultaneously.