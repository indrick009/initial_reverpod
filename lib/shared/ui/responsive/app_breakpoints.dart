import 'package:responsive_framework/responsive_framework.dart';

final class AppBreakpoints {
  const AppBreakpoints._();

  static const mobile = Breakpoint(start: 0, end: 450, name: MOBILE);
  static const tablet = Breakpoint(start: 451, end: 800, name: TABLET);
  static const desktop = Breakpoint(start: 801, end: 1920, name: DESKTOP);
  static const ultraWide = Breakpoint(
    start: 1921,
    end: double.infinity,
    name: '4K',
  );

  static const values = [mobile, tablet, desktop, ultraWide];
}
