// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:getwidget/getwidget.dart';

class GFLoader extends StatefulWidget {
  const GFLoader(
      {Key key,
      this.color1 = Colors.redAccent,
      this.color2 = Colors.green,
      this.color3 = Colors.blueAccent,
      this.duration = const Duration(milliseconds: 1000),
      this.type = GFLoaderType.android,
      this.icon1,
      this.icon2,
      this.icon3,
      this.androidLoaderColor,
      this.strokeWidth = 4.0,
      this.size = GFSize.MEDIUM,
      this.child})
      : super(key: key);

  /// Type of [Widget] used only in custom type and it is prominent over the icon1, icon2, icon3 in custom type
  final Widget child;

  /// Type of GFColor or [Color] which defines the color of the first dot in only  circle or square type of loader
  final Color color1;

  /// Type of GFColor or [Color] which defines the color of the second dot in only  circle or square type of loader
  final Color color2;

  /// Type of GFColor or [Color] which defines the color of the third dot in only  circle or square type of loader
  final Color color3;

  /// Type of duration which defines the animation duration of the loader only in circle and square type of loader
  final Duration duration;

  /// Type of [GFLoaderType] ie, android, ios, circle , square and custom
  final GFLoaderType type;

  /// Type of [Widget] which takes text, icons or images for first dot only in custom type of loader
  final Widget icon1;

  /// Type of [Widget] which takes text, icons or images for second dot only in custom type of loader
  final Widget icon2;

  /// Type of [Widget] which takes text, icons or images for third dot only in custom type of loader
  final Widget icon3;

  /// type of Animation<Color> used to change the color of the android loader only
  final Animation<Color> androidLoaderColor;

  /// type of [double] used to change the stroke width of the android loader only
  final double strokeWidth;

  /// type of [double] or [GFSize] ie, small , medium or large which is used
  /// to change the size of android, ios, circle and square loaders only
  final double size;

  @override
  _GFLoaderState createState() => _GFLoaderState();
}

class _GFLoaderState extends State<GFLoader>
    with SingleTickerProviderStateMixin {
  Animation<double> animation1;
  Animation<double> animation2;
  Animation<double> animation3;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    animation1 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0,
          0.71,
          curve: Curves.linear,
        ),
      ),
    );

    animation2 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.1,
          0.81,
          curve: Curves.linear,
        ),
      ),
    );

    animation3 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.2,
          0.91,
          curve: Curves.linear,
        ),
      ),
    );

    controller.addListener(() {
      setState(() {});
    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) => Container(
        child: widget.child != null
            ? Loader(
                radius: widget.size * 0.3,
                type: widget.type,
                child: widget.child,
              )
            : widget.type == GFLoaderType.android
                ? Center(
                    child: Container(
                    height: widget.size * 0.7,
                    width: widget.size * 0.7,
                    child: CircularProgressIndicator(
                      valueColor: widget.androidLoaderColor,
                      strokeWidth: widget.strokeWidth,
//              value: 20,
                    ),
                  ))
                : widget.type == GFLoaderType.ios
                    ? Center(
                        child: CupertinoActivityIndicator(
                            radius: widget.size * 0.4),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Opacity(
                            opacity: animation1.value <= 0.3
                                ? 2.5 * animation1.value
                                : (animation1.value > 0.30 &&
                                        animation1.value <= 0.70)
                                    ? 1.0
                                    : 2.5 - (2.5 * animation1.value),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Loader(
                                radius: widget.size * 0.3,
                                color: widget.color1,
                                type: widget.type,
                                icon: widget.icon1,
                                child: widget.child,
                              ),
                            ),
                          ),
                          Opacity(
                            opacity: animation2.value <= 0.3
                                ? 2.5 * animation2.value
                                : (animation2.value > 0.30 &&
                                        animation2.value <= 0.70)
                                    ? 1.0
                                    : 2.5 - (2.5 * animation2.value),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Loader(
                                radius: widget.size * 0.44,
                                color: widget.color2,
                                type: widget.type,
                                icon: widget.icon2,
//
                              ),
                            ),
                          ),
                          Opacity(
                            opacity: animation3.value <= 0.3
                                ? 2.5 * animation3.value
                                : (animation3.value > 0.30 &&
                                        animation3.value <= 0.70)
                                    ? 1.0
                                    : 2.5 - (2.5 * animation3.value),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Loader(
                                radius: widget.size * 0.3,
                                color: widget.color3,
                                type: widget.type,
                                icon: widget.icon3,
//
                              ),
                            ),
                          ),
                        ],
                      ),
      );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class Loader extends StatelessWidget {
  const Loader(
      {Key key,
      this.radius,
      this.color,
      this.type,
      this.icon,
      this.size,
      this.child})
      : super(key: key);

  final double radius;
  final Color color;
  final GFLoaderType type;
  final Widget icon;
  final double size;
  final Widget child;

  @override
  Widget build(BuildContext context) => Center(
      child: type == GFLoaderType.custom
          ? Container(child: child != null ? child : icon ?? Container())
          : Container(
              width: radius,
              height: radius,
              decoration: BoxDecoration(
                  color: color,
                  shape: type == GFLoaderType.circle
                      ? BoxShape.circle
                      : BoxShape.rectangle),
            ));
}
