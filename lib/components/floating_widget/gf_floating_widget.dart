// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:getwidget/getwidget.dart';

class GFFloatingWidget extends StatefulWidget {
	/// Creates a Floating body that can be used to display quick messages, warnings and errors.
	/// Inside floating widget [GFToast] can be used as body. See [GFToast]
	const GFFloatingWidget({
		Key key,
		this.child,
		this.horizontalPosition,
		this.verticalPosition,
		this.blurColor,
		this.showBlur = false,
		this.body
	}) : super(key: key);

	/// child of  type [Widget] which floats across the body based on horizontal and vertical position
	final Widget child;

	/// body of type [Widget] which is same as Scaffold's body
	final Widget body;

	/// horizontalPosition of type [double] which  aligns the child horizontally across the body
	final double horizontalPosition;

	/// verticalPosition of type [double] which  aligns the child vertically across the body
	final double verticalPosition;

	/// blurColor of tye [Color] or [GFColors] which is used to blur the backgroundColor when ever the [child] is used in [GFFloatingWidget]
	final Color blurColor;

	/// type of bool which allows to show or hide the blur of the backgroundColor whenever the [child]  is used in [GFFloatingWidget]
	final bool showBlur;

	@override
	_GFFloatingWidgetState createState() => _GFFloatingWidgetState();
}

class _GFFloatingWidgetState extends State<GFFloatingWidget> {
	Widget child;

	@override
	void initState() {
		child = widget.child;
		super.initState();
	}

	@override
	void didUpdateWidget(GFFloatingWidget oldWidget) {
		child = widget.child;
		super.didUpdateWidget(oldWidget);
	}

	@override
	Widget build(BuildContext context) => Stack(
				alignment: Alignment.center,
				fit: StackFit.loose,
				children: <Widget>[
					Container(
						height: MediaQuery.of(context).size.height,
						child: widget.body ?? Container(),
					),
					Positioned(
							child: Container(
						height: MediaQuery.of(context).size.height,
						width: MediaQuery.of(context).size.width,
						color: widget.showBlur
								? widget.blurColor ?? Colors.black54
								: null,
						child: Stack(
							children: <Widget>[
								Positioned(
									top: widget.verticalPosition != null
											? widget.verticalPosition
											: 0.0,
									left: widget.horizontalPosition != null
											? widget.horizontalPosition
											: 0.0,
									child: widget.child ?? Container(),
								)
							],
						),
					))
				],
			);
}
