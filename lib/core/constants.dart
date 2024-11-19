part of 'core.dart';

class UiConstants {
  UiConstants.of(this.context);
  final BuildContext context;

  /// Constants
  static const borderRadius = BorderRadius.all(Radius.circular(8));

  static BorderRadius radiusForEdgeInsets(EdgeInsets insets) {
    return borderRadius.copyWith(
      // bottomLeft: Radius.elliptical(
      //   insets.bottomLeft.dx,
      //   insets.bottomLeft.dy.abs(),
      // ),
      topLeft: Radius.elliptical(
        borderRadius.topLeft.x - insets.topLeft.dx.abs(),
        borderRadius.topLeft.y - insets.topLeft.dy.abs(),
      ),
      topRight: Radius.elliptical(
        borderRadius.topRight.x - insets.topRight.dx.abs(),
        borderRadius.topRight.y - insets.topRight.dy.abs(),
      ),
      bottomLeft: Radius.elliptical(
        borderRadius.bottomLeft.x - insets.bottomLeft.dx.abs(),
        borderRadius.bottomLeft.y - insets.bottomLeft.dy.abs(),
      ),
      bottomRight: Radius.elliptical(
        borderRadius.bottomRight.x - insets.bottomRight.dx.abs(),
        borderRadius.bottomRight.y - insets.bottomRight.dy.abs(),
      ),
    );
  }

  /// Dynamic calculating
  late final border = Border.all(
    width: 1 / MediaQuery.devicePixelRatioOf(context),
    strokeAlign: BorderSide.strokeAlignOutside,
    color: const Color(0x66000000),
  );
}

final class Gaps {
  Gaps.of(BuildContext context) : padding = MediaQuery.paddingOf(context);
  final EdgeInsets padding;

  /// Some device has bottom notch and this cause some underlying render
  /// problems and to fix that we need to check every time to screen
  /// notch status and default page padding
  EdgeInsets get safeBottom {
    return safe.copyWith(top: vertical.top);
  }

  EdgeInsets get safeTop {
    return safe.copyWith(bottom: vertical.bottom);
  }

  EdgeInsets get safe {
    return all.copyWith(
      bottom: padding.bottom + vertical.bottom,
      top: padding.top + vertical.top,
    );
  }

  /// fixed values
  static const horizontal = EdgeInsets.symmetric(horizontal: 12);
  static const vertical = EdgeInsets.symmetric(vertical: 12);
  static final all = horizontal + vertical;
}
