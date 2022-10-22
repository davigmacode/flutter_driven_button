import 'package:flutter/widgets.dart';
import 'package:widget_event/widget_event.dart';
import 'dart:ui';
import 'event.dart';

/// Default button's style.
class DrivenButtonStyle {
  const DrivenButtonStyle({
    this.height,
    this.margin,
    this.padding,
    this.clipBehavior,
    this.overlayColor,
    this.shadowColor,
    this.elevation,
    this.foregroundStyle,
    this.foregroundColor,
    this.foregroundOpacity,
    this.foregroundAlpha,
    this.foregroundSpacing,
    this.backgroundColor,
    this.backgroundOpacity,
    this.backgroundAlpha,
    this.borderColor,
    this.borderOpacity,
    this.borderAlpha,
    this.borderWidth,
    this.borderRadius,
    this.borderStyle,
    this.iconColor,
    this.iconOpacity,
    this.iconSize,
  });

  /// Create a button's style from another style
  DrivenButtonStyle.from(DrivenButtonStyle? other)
      : height = other?.height,
        margin = other?.margin,
        padding = other?.padding,
        clipBehavior = other?.clipBehavior,
        overlayColor = other?.overlayColor,
        shadowColor = other?.shadowColor,
        elevation = other?.elevation,
        foregroundStyle = other?.foregroundStyle,
        foregroundColor = other?.foregroundColor,
        foregroundOpacity = other?.foregroundOpacity,
        foregroundAlpha = other?.foregroundAlpha,
        foregroundSpacing = other?.foregroundSpacing,
        backgroundColor = other?.backgroundColor,
        backgroundOpacity = other?.backgroundOpacity,
        backgroundAlpha = other?.backgroundAlpha,
        borderColor = other?.borderColor,
        borderOpacity = other?.borderOpacity,
        borderAlpha = other?.borderAlpha,
        borderWidth = other?.borderWidth,
        borderRadius = other?.borderRadius,
        borderStyle = other?.borderStyle,
        iconColor = other?.iconColor,
        iconOpacity = other?.iconOpacity,
        iconSize = other?.iconSize;

  /// Create an event driven button's style using [callback].
  factory DrivenButtonStyle.driven(
    DrivenPropertyResolver<DrivenButtonStyle?> callback,
  ) {
    return _DrivenButtonStyle(callback);
  }

  /// Create a button's style when some events occurs.
  ///
  /// The [enabled] is base style to be applied to the button.
  /// if `null` will fallback with empty DrivenButtonStyle
  ///
  /// The [disabled] style to be merged with [enabled],
  /// when events includes [DrivenButtonEvent.disabled].
  ///
  /// The [hovered] style to be merged with [enabled],
  /// when events includes [DrivenButtonEvent.hovered].
  ///
  /// The [focused] style to be merged with [enabled],
  /// when events includes [DrivenButtonEvent.focused].
  ///
  /// The [pressed] style to be merged with [enabled],
  /// when events includes [DrivenButtonEvent.pressed].
  factory DrivenButtonStyle.when({
    DrivenButtonStyle? enabled,
    DrivenButtonStyle? disabled,
    DrivenButtonStyle? hovered,
    DrivenButtonStyle? focused,
    DrivenButtonStyle? pressed,
  }) {
    return DrivenButtonStyle.driven((events) {
      return (enabled ?? const DrivenButtonStyle())
          .merge(DrivenButtonEvent.isDisabled(events)
              ? evaluate(disabled, events)
              : null)
          .merge(DrivenButtonEvent.isHovered(events)
              ? evaluate(hovered, events)
              : null)
          .merge(DrivenButtonEvent.isFocused(events)
              ? evaluate(focused, events)
              : null)
          .merge(DrivenButtonEvent.isPressed(events)
              ? evaluate(pressed, events)
              : null);
    });
  }

  /// Create button's style with default value for toned style.
  ///
  /// The [disabledStyle] style to be merged,
  /// when events includes [DrivenButtonEvent.disabled].
  ///
  /// The [hoveredStyle] style to be merged,
  /// when events includes [DrivenButtonEvent.hovered].
  ///
  /// The [focusedStyle] style to be merged,
  /// when events includes [DrivenButtonEvent.focused].
  ///
  /// The [pressedStyle] style to be merged,
  /// when events includes [DrivenButtonEvent.pressed].
  factory DrivenButtonStyle.toned({
    double? height,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Clip? clipBehavior,
    Color? overlayColor,
    Color? shadowColor,
    double? elevation,
    TextStyle? foregroundStyle,
    Color? foregroundColor,
    double? foregroundOpacity,
    int? foregroundAlpha,
    double? foregroundSpacing,
    Color? backgroundColor,
    double? backgroundOpacity = .12,
    int? backgroundAlpha,
    Color? borderColor,
    double? borderOpacity = 1,
    int? borderAlpha,
    double? borderWidth = 1,
    BorderRadiusGeometry? borderRadius,
    BorderStyle? borderStyle = BorderStyle.none,
    Color? iconColor,
    double? iconOpacity,
    double? iconSize,
    DrivenButtonStyle? disabledStyle = const DrivenButtonStyle(
      foregroundAlpha: DrivenButtonStyle.disabledForegroundAlpha,
      backgroundAlpha: DrivenButtonStyle.disabledBackgroundAlpha,
      borderAlpha: DrivenButtonStyle.disabledBorderAlpha,
    ),
    DrivenButtonStyle? hoveredStyle,
    DrivenButtonStyle? focusedStyle,
    DrivenButtonStyle? pressedStyle,
  }) {
    return DrivenButtonStyle.when(
      enabled: DrivenButtonStyle(
        height: height,
        margin: margin,
        padding: padding,
        clipBehavior: clipBehavior,
        overlayColor: overlayColor,
        shadowColor: shadowColor,
        elevation: elevation,
        foregroundStyle: foregroundStyle,
        foregroundColor: foregroundColor,
        foregroundOpacity: foregroundOpacity,
        foregroundAlpha: foregroundAlpha,
        foregroundSpacing: foregroundSpacing,
        backgroundColor: backgroundColor,
        backgroundOpacity: backgroundOpacity,
        backgroundAlpha: backgroundAlpha,
        borderColor: borderColor,
        borderOpacity: borderOpacity,
        borderAlpha: borderAlpha,
        borderWidth: borderWidth,
        borderRadius: borderRadius,
        borderStyle: borderStyle,
        iconColor: iconColor,
        iconOpacity: iconOpacity,
        iconSize: iconSize,
      ),
      disabled: disabledStyle,
      hovered: hoveredStyle,
      focused: focusedStyle,
      pressed: pressedStyle,
    );
  }

  /// Create button's style with default value for filled style.
  ///
  /// The [disabledStyle] style to be merged,
  /// when events includes [DrivenButtonEvent.disabled].
  ///
  /// The [hoveredStyle] style to be merged,
  /// when events includes [DrivenButtonEvent.hovered].
  ///
  /// The [focusedStyle] style to be merged,
  /// when events includes [DrivenButtonEvent.focused].
  ///
  /// The [pressedStyle] style to be merged,
  /// when events includes [DrivenButtonEvent.pressed].
  factory DrivenButtonStyle.filled({
    Color? color,
    double? height,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Clip? clipBehavior,
    Color? overlayColor,
    Color? shadowColor,
    double? elevation,
    TextStyle? foregroundStyle,
    Color? foregroundColor,
    double? foregroundOpacity,
    int? foregroundAlpha,
    double? foregroundSpacing,
    double? backgroundOpacity = .8,
    int? backgroundAlpha,
    double? borderOpacity = 0,
    int? borderAlpha,
    double? borderWidth = 0,
    BorderRadiusGeometry? borderRadius,
    BorderStyle? borderStyle = BorderStyle.none,
    Color? iconColor,
    double? iconOpacity,
    double? iconSize,
    DrivenButtonStyle? selectedStyle,
    DrivenButtonStyle? disabledStyle = const DrivenButtonStyle(
      foregroundAlpha: DrivenButtonStyle.disabledForegroundAlpha,
      backgroundAlpha: DrivenButtonStyle.disabledBackgroundAlpha,
      borderAlpha: DrivenButtonStyle.disabledBorderAlpha,
    ),
    DrivenButtonStyle? hoveredStyle,
    DrivenButtonStyle? focusedStyle,
    DrivenButtonStyle? pressedStyle = const DrivenButtonStyle(
      elevation: 5,
    ),
  }) {
    return DrivenButtonStyle.when(
      enabled: DrivenButtonStyle(
        backgroundColor: color,
        borderColor: color,
        height: height,
        margin: margin,
        padding: padding,
        clipBehavior: clipBehavior,
        overlayColor: overlayColor,
        shadowColor: shadowColor,
        elevation: elevation,
        foregroundStyle: foregroundStyle,
        foregroundColor: foregroundColor,
        foregroundOpacity: foregroundOpacity,
        foregroundAlpha: foregroundAlpha,
        foregroundSpacing: foregroundSpacing,
        backgroundOpacity: backgroundOpacity,
        backgroundAlpha: backgroundAlpha,
        borderOpacity: borderOpacity,
        borderAlpha: borderAlpha,
        borderWidth: borderWidth,
        borderRadius: borderRadius,
        borderStyle: borderStyle,
        iconColor: iconColor,
        iconOpacity: iconOpacity,
        iconSize: iconSize,
      ),
      disabled: disabledStyle,
      hovered: hoveredStyle,
      focused: focusedStyle,
      pressed: pressedStyle,
    );
  }

  /// Create button's style with default value for outlined style.
  ///
  /// The [disabled] style to be merged,
  /// when events includes [DrivenButtonEvent.disabled].
  ///
  /// The [hovered] style to be merged,
  /// when events includes [DrivenButtonEvent.hovered].
  ///
  /// The [focused] style to be merged,
  /// when events includes [DrivenButtonEvent.focused].
  ///
  /// The [pressed] style to be merged,
  /// when events includes [DrivenButtonEvent.pressed].
  factory DrivenButtonStyle.outlined({
    Color? color,
    double? height,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Clip? clipBehavior,
    Color? overlayColor,
    Color? shadowColor,
    double? elevation,
    TextStyle? foregroundStyle,
    double? foregroundOpacity,
    int? foregroundAlpha,
    double? foregroundSpacing,
    Color? backgroundColor,
    double? backgroundOpacity = 0,
    int? backgroundAlpha,
    double? borderOpacity = 1,
    int? borderAlpha,
    double? borderWidth = 1,
    BorderRadiusGeometry? borderRadius,
    BorderStyle? borderStyle = BorderStyle.solid,
    Color? iconColor,
    double? iconOpacity,
    double? iconSize,
    DrivenButtonStyle? selectedStyle,
    DrivenButtonStyle? disabledStyle = const DrivenButtonStyle(
      foregroundAlpha: DrivenButtonStyle.disabledForegroundAlpha,
      borderAlpha: DrivenButtonStyle.disabledBorderAlpha,
    ),
    DrivenButtonStyle? hoveredStyle,
    DrivenButtonStyle? focusedStyle,
    DrivenButtonStyle? pressedStyle,
  }) {
    return DrivenButtonStyle.when(
      enabled: DrivenButtonStyle(
        borderColor: color,
        foregroundColor: color,
        height: height,
        margin: margin,
        padding: padding,
        clipBehavior: clipBehavior,
        overlayColor: overlayColor,
        shadowColor: shadowColor,
        elevation: elevation,
        foregroundStyle: foregroundStyle,
        foregroundOpacity: foregroundOpacity,
        foregroundAlpha: foregroundAlpha,
        foregroundSpacing: foregroundSpacing,
        backgroundColor: backgroundColor,
        backgroundOpacity: backgroundOpacity,
        backgroundAlpha: backgroundAlpha,
        borderOpacity: borderOpacity,
        borderAlpha: borderAlpha,
        borderWidth: borderWidth,
        borderRadius: borderRadius,
        borderStyle: borderStyle,
        iconColor: iconColor,
        iconOpacity: iconOpacity,
        iconSize: iconSize,
      ),
      disabled: disabledStyle,
      hovered: hoveredStyle,
      focused: focusedStyle,
      pressed: pressedStyle,
    );
  }

  /// Resolves the value for the given set of events
  /// if `value` is an event driven [DrivenButtonStyle],
  /// otherwise returns the value itself.
  static DrivenButtonStyle? evaluate(
    DrivenButtonStyle? value,
    Set<WidgetEvent> events,
  ) {
    return value
        ?.merge(DrivenProperty.evaluate<DrivenButtonStyle?>(value, events));
  }

  static const defaultClipBehavior = Clip.antiAlias;
  static const defaultBorderWidth = 1.0;
  static const defaultBorderStyle = BorderStyle.solid;
  static const defaultBorderRadius = BorderRadius.all(Radius.circular(8));
  static const defaultMargin = EdgeInsets.zero;
  static const defaultPadding = EdgeInsets.symmetric(horizontal: 8);
  static const defaultPaddingWithAvatar = EdgeInsets.symmetric(horizontal: 4);
  static const defaultAvatarSize = Size.square(24);
  static const defaultHeight = 40.0;
  static const defaultIconSize = 18.0;
  static const defaultForegroundSpacing = 8.0;
  static const disabledForegroundAlpha = 0x61; // 38%
  static const disabledBackgroundAlpha = 0x0c; // 38% * 12% = 5%
  static const disabledBorderAlpha = 0x0c; // 38% * 12% = 5%
  static const colorTransparent = Color(0x00000000);
  static const colorBlack = Color(0xFF000000);
  static const colorWhite = Color(0xFFFFFFFF);

  /// Defaults to [DrivenButtonStyle.defaultHeight]
  final double? height;

  /// Empty space to surround the outside button.
  final EdgeInsetsGeometry? margin;

  /// The padding between the contents of the button and the outside button.
  ///
  /// defaults to [DrivenButtonStyle.defaultPadding].
  final EdgeInsetsGeometry? padding;

  /// The button's content will be clipped (or not) according to this option.
  ///
  /// See the enum [Clip] for details of all possible options and their common use cases.
  ///
  /// Defaults to [DrivenButtonStyle.defaultClipBehavior]
  final Clip? clipBehavior;

  /// Defines the ink response colors.
  final Color? overlayColor;

  /// When [elevation] is non zero the color
  /// to use for the button's shadow color.
  final Color? shadowColor;

  /// The button's z-coordinate relative to
  /// the parent at which to place this physical object.
  ///
  /// The value is non-negative.
  final double? elevation;

  /// The style to be applied to the button's label.
  ///
  /// The default label style is [TextTheme.bodyText1] from the overall
  /// theme's [ThemeData.textTheme].
  //
  /// This only has an effect on widgets that respect the [DefaultTextStyle],
  /// such as [Text].
  final TextStyle? foregroundStyle;

  /// The color to be applied to the button's label, and icon
  final Color? foregroundColor;

  /// Opacity to be apply to [foregroundColor].
  final double? foregroundOpacity;

  /// Alpha to be apply to [foregroundColor].
  final int? foregroundAlpha;

  /// How much space to place between button's foreground widget in a run in the main axis.
  final double? foregroundSpacing;

  /// Color to be used for the button's background.
  final Color? backgroundColor;

  /// Opacity to be apply to [backgroundColor].
  final double? backgroundOpacity;

  /// Alpha to be apply to [backgroundColor].
  final int? backgroundAlpha;

  /// Color to be used for the button's border.
  final Color? borderColor;

  /// Opacity to be apply to [borderColor].
  final double? borderOpacity;

  /// Alpha to be apply to [borderColor].
  final int? borderAlpha;

  /// The width of this side of the button's border, in logical pixels.
  final double? borderWidth;

  /// The radii for each corner of the button's border.
  final BorderRadiusGeometry? borderRadius;

  /// The style of this side of the button's border.
  ///
  /// To omit a side, set [borderStyle] to [BorderStyle.none].
  /// This skips painting the border, but the border still has a [borderWidth].
  final BorderStyle? borderStyle;

  /// Color to be used for the icon's inside the button.
  final Color? iconColor;

  /// Opacity to be apply to [iconColor].
  final double? iconOpacity;

  /// The size of the icon's inside the button, in logical pixels.
  ///
  /// Defaults to [DrivenButtonStyle.defaultIconSize].
  final double? iconSize;

  /// Whether the button's has outline or not
  bool get isOutlined {
    final width = borderWidth;
    return borderStyle == BorderStyle.solid && width != null && width >= 1;
  }

  /// Whether the button's has solid background color or not
  bool get isFilled {
    Color? color = backgroundColor;
    final opacity = backgroundOpacity;
    final alpha = backgroundAlpha;

    const kOpacityThreshold = 0.4;
    const kAlphaThreshold = 102;

    if (color != null) {
      color = colorWithOpacity(color, opacity);
      color = colorWithAlpha(color, alpha);
      final colorIsNotTransparent = color != colorTransparent;
      final colorIsSolid = color.opacity > kOpacityThreshold;
      return colorIsNotTransparent && colorIsSolid;
    }

    final isSolidByOpacity = opacity != null && opacity > kOpacityThreshold;
    final isSolidByAlpha = alpha != null && alpha > kAlphaThreshold;

    return isSolidByOpacity || isSolidByAlpha;
  }

  /// Whether the button's has toned background color or not
  bool get isToned => !isFilled;

  /// Creates a copy of this [DrivenButtonStyle] but with
  /// the given fields replaced with the new values.
  DrivenButtonStyle copyWith({
    double? height,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Clip? clipBehavior,
    Color? overlayColor,
    Color? shadowColor,
    double? elevation,
    TextStyle? foregroundStyle,
    Color? foregroundColor,
    double? foregroundOpacity,
    int? foregroundAlpha,
    double? foregroundSpacing,
    Color? backgroundColor,
    double? backgroundOpacity,
    int? backgroundAlpha,
    Color? borderColor,
    double? borderOpacity,
    int? borderAlpha,
    double? borderWidth,
    BorderRadiusGeometry? borderRadius,
    BorderStyle? borderStyle,
    Color? iconColor,
    double? iconOpacity,
    double? iconSize,
    DrivenButtonStyle? disabledStyle,
    DrivenButtonStyle? hoveredStyle,
    DrivenButtonStyle? focusedStyle,
    DrivenButtonStyle? pressedStyle,
  }) {
    final hasEvent = disabledStyle != null ||
        hoveredStyle != null ||
        focusedStyle != null ||
        pressedStyle != null;
    final style = DrivenButtonStyle(
      height: height ?? this.height,
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      overlayColor: overlayColor ?? this.overlayColor,
      shadowColor: shadowColor ?? this.shadowColor,
      elevation: elevation ?? this.elevation,
      foregroundStyle: foregroundStyle ?? this.foregroundStyle,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      foregroundOpacity: foregroundOpacity ?? this.foregroundOpacity,
      foregroundAlpha: foregroundAlpha ?? this.foregroundAlpha,
      foregroundSpacing: foregroundSpacing ?? this.foregroundSpacing,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundOpacity: backgroundOpacity ?? this.backgroundOpacity,
      backgroundAlpha: backgroundAlpha ?? this.backgroundAlpha,
      borderColor: borderColor ?? this.borderColor,
      borderOpacity: borderOpacity ?? this.borderOpacity,
      borderAlpha: borderAlpha ?? this.borderAlpha,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      borderStyle: borderStyle ?? this.borderStyle,
      iconColor: iconColor ?? this.iconColor,
      iconOpacity: iconOpacity ?? this.iconOpacity,
      iconSize: iconSize ?? this.iconSize,
    );
    return hasEvent
        ? DrivenButtonStyle.when(
            enabled: style,
            disabled: disabledStyle,
            hovered: hoveredStyle,
            focused: focusedStyle,
            pressed: pressedStyle,
          )
        : style;
  }

  /// Creates a copy of this [DrivenButtonStyle] but with
  /// the given fields replaced with the new values.
  DrivenButtonStyle merge(DrivenButtonStyle? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      height: other.height,
      margin: other.margin,
      padding: other.padding,
      clipBehavior: other.clipBehavior,
      overlayColor: other.overlayColor,
      shadowColor: other.shadowColor,
      elevation: other.elevation,
      foregroundStyle: other.foregroundStyle,
      foregroundColor: other.foregroundColor,
      foregroundOpacity: other.foregroundOpacity,
      foregroundAlpha: other.foregroundAlpha,
      foregroundSpacing: other.foregroundSpacing,
      backgroundColor: other.backgroundColor,
      backgroundOpacity: other.backgroundOpacity,
      backgroundAlpha: other.backgroundAlpha,
      borderColor: other.borderColor,
      borderOpacity: other.borderOpacity,
      borderAlpha: other.borderAlpha,
      borderWidth: other.borderWidth,
      borderRadius: other.borderRadius,
      borderStyle: other.borderStyle,
      iconColor: other.iconColor,
      iconOpacity: other.iconOpacity,
      iconSize: other.iconSize,
      disabledStyle: other is _DrivenButtonStyle
          ? evaluate(other, {DrivenButtonEvent.disabled})
          : null,
      hoveredStyle: other is _DrivenButtonStyle
          ? evaluate(other, {DrivenButtonEvent.hovered})
          : null,
      focusedStyle: other is _DrivenButtonStyle
          ? evaluate(other, {DrivenButtonEvent.focused})
          : null,
      pressedStyle: other is _DrivenButtonStyle
          ? evaluate(other, {DrivenButtonEvent.pressed})
          : null,
    );
  }

  /// Determines whether the given [Color] is [Brightness.light] or
  /// [Brightness.dark].
  ///
  /// This compares the luminosity and opacity of the given color
  /// to a threshold value that matches the material design specification.
  static Brightness? brightnessFor(Color? color) {
    if (color == null) return null;

    // See <https://www.w3.org/TR/WCAG20/#contrast-ratiodef>
    // The spec says to use kThreshold=0.0525, but Material Design appears to bias
    // more towards using light text than WCAG20 recommends. Material Design spec
    // doesn't say what value to use, but 0.15 seemed close to what the Material
    // Design spec shows for its color palette on
    // <https://material.io/go/design-theming#color-color-palette>.
    const kLuminanceThreshold = 0.15;
    const kOpaqueThreshold = 0.6;

    final relativeLuminance = color.computeLuminance();
    final luminance = (relativeLuminance + 0.05) * (relativeLuminance + 0.05);
    final isLight = luminance > kLuminanceThreshold;
    final isOpaque = color.opacity > kOpaqueThreshold;

    return isLight
        ? isOpaque
            ? Brightness.light
            : Brightness.dark
        : isOpaque
            ? Brightness.dark
            : Brightness.light;
  }

  /// Estimate foreground color on surface
  static Color? colorOnSurface(
    Color? surface, [
    Color? onLight = colorBlack,
    Color? onDark = colorWhite,
  ]) {
    if (surface == null) return null;
    final brightness = brightnessFor(surface);
    return brightness == Brightness.light ? onLight : onDark;
  }

  /// Returns a new color that matches this color
  /// with the alpha channel replaced with
  /// the given opacity (which ranges from 0.0 to 1.0).
  static Color colorWithOpacity(Color color, double? opacity) {
    return opacity != null ? color.withOpacity(opacity) : color;
  }

  /// Returns a new color that matches this color
  /// with the alpha channel replaced
  /// with a (which ranges from 0 to 255).
  static Color colorWithAlpha(Color color, int? alpha) {
    return alpha != null ? color.withAlpha(alpha) : color;
  }
}

class _DrivenButtonStyle extends DrivenButtonStyle
    implements DrivenProperty<DrivenButtonStyle?> {
  _DrivenButtonStyle(this._resolver) : super.from(_resolver({}));

  final DrivenPropertyResolver<DrivenButtonStyle?> _resolver;

  @override
  DrivenButtonStyle? resolve(Set<WidgetEvent> events) => _resolver(events);
}
