// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:getwidget/getwidget.dart';

class GFCheckboxListTile extends StatelessWidget {
  const GFCheckboxListTile({
    Key key,
    @required this.value,
    @required this.onChanged,
    this.titleText,
    this.subtitleText,
    this.color,
    this.avatar,
    this.title,
    this.subTitle,
    this.description,
    this.padding = const EdgeInsets.all(8),
    this.margin = const EdgeInsets.all(16),
    this.size = GFSize.MEDIUM,
    this.type = GFCheckboxType.basic,
    this.checkColor = GFColors.WHITE,
    this.activeBackgroundColor = GFColors.PRIMARY,
    this.inactiveBackgroundColor = GFColors.WHITE,
    this.activeBorderColor = GFColors.WHITE,
    this.inactiveBorderColor = GFColors.DARK,
    this.activeIcon = const Icon(
      Icons.check,
      size: 20,
      color: GFColors.WHITE,
    ),
    this.inactiveIcon = const Icon(Icons.close),
    this.customBackgroundColor = GFColors.SUCCESS,
    this.selected = false,
    this.autofocus = false,
  })  : assert(value != null),
        assert(selected != null),
        assert(autofocus != null),
        super(key: key);

  /// type of [String] used to pass text, alternative to title property and gets higher priority than title
  final String titleText;

  /// type of [String] used to pass text, alternative to subtitle property and gets higher priority than subtitle
  final String subtitleText;

  /// The GFListTile's background color. Can be given [Color] or [GFColors]
  final Color color;

  /// type of [Widget] or [GFAvatar] used to create rounded user profile
  final Widget avatar;

  /// The title to display inside the [GFListTile]. see [Text]
  final Widget title;

  /// The subTitle to display inside the [GFListTile]. see [Text]
  final Widget subTitle;

  /// The description to display inside the [GFListTile]. see [Text]
  final Widget description;

  /// defines the margin of GFListTile
  final EdgeInsets margin;

  /// defines the padding of GFListTile
  final EdgeInsets padding;

  /// type of [GFCheckboxType] which is of four type is basic, square, circular and custom
  final GFCheckboxType type;

  /// type of [double] which is GFSize ie, small, medium and large and can use any double value
  final double size;

  /// type pf [Color] used to change the check color when the checkbox is active
  final Color checkColor;

  /// type of [Color] used to change the backgroundColor of the active checkbox
  final Color activeBackgroundColor;

  /// type of [Color] used to change the backgroundColor of the inactive checkbox
  final Color inactiveBackgroundColor;

  /// type of [Color] used to change the border color of the active checkbox
  final Color activeBorderColor;

  /// type of [Color] used to change the border color of the inactive checkbox
  final Color inactiveBorderColor;

  /// Called when the user checks or unchecks the checkbox.
  final ValueChanged<bool> onChanged;

  /// Used to set the current state of the checkbox
  final bool value;

  /// type of Widget used to change the active icon of the checkbox
  final Widget activeIcon;

  /// type of [Widget] used to change the inactive icon of the checkbox
  final Widget inactiveIcon;

  /// type of [Color] used to change the background color of the custom active  checkbox only
  final Color customBackgroundColor;

  /// To have the list tile appear selected when the checkbox is checked, pass the same value to both.
  /// Normally, this property is left to its default value, false.
  final bool selected;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  @override
  Widget build(BuildContext context) => MergeSemantics(
        child: GFListTile(
          autofocus: autofocus,
          enabled: onChanged != null,
          onTap: onChanged != null
              ? () {
                  onChanged(!value);
                }
              : null,
          selected: selected,
          avatar: avatar,
          titleText: titleText,
          subTitle: subTitle,
          subtitleText: subtitleText,
          description: description,
          color: color,
          padding: padding,
          margin: margin,
          title: title,
          icon: GFCheckbox(
            autofocus: autofocus,
            onChanged: onChanged,
            value: value,
            size: size,
            activeBackgroundColor: activeBackgroundColor,
            inactiveIcon: inactiveIcon,
            activeBorderColor: activeBorderColor,
            inactiveBackgroundColor: inactiveBackgroundColor,
            activeIcon: activeIcon,
            inactiveBorderColor: inactiveBorderColor,
            customBackgroundColor: customBackgroundColor,
            checkColor: checkColor,
            type: type,
          ),
        ),
      );
}
