// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_theme_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appThemeConfig)
final appThemeConfigProvider = AppThemeConfigProvider._();

final class AppThemeConfigProvider
    extends $FunctionalProvider<AppThemeConfig, AppThemeConfig, AppThemeConfig>
    with $Provider<AppThemeConfig> {
  AppThemeConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appThemeConfigProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appThemeConfigHash();

  @$internal
  @override
  $ProviderElement<AppThemeConfig> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppThemeConfig create(Ref ref) {
    return appThemeConfig(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppThemeConfig value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppThemeConfig>(value),
    );
  }
}

String _$appThemeConfigHash() => r'ecf3829330a052feadf3f8bdda6e6148e7eebf3d';

@ProviderFor(RequestedThemeMode)
final requestedThemeModeProvider = RequestedThemeModeProvider._();

final class RequestedThemeModeProvider
    extends $NotifierProvider<RequestedThemeMode, ThemeMode> {
  RequestedThemeModeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'requestedThemeModeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$requestedThemeModeHash();

  @$internal
  @override
  RequestedThemeMode create() => RequestedThemeMode();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeMode>(value),
    );
  }
}

String _$requestedThemeModeHash() =>
    r'8e13dd6b73e02e3b6398933832c2f519fb1aa1bc';

abstract class _$RequestedThemeMode extends $Notifier<ThemeMode> {
  ThemeMode build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ThemeMode, ThemeMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ThemeMode, ThemeMode>,
              ThemeMode,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(effectiveThemeMode)
final effectiveThemeModeProvider = EffectiveThemeModeProvider._();

final class EffectiveThemeModeProvider
    extends $FunctionalProvider<ThemeMode, ThemeMode, ThemeMode>
    with $Provider<ThemeMode> {
  EffectiveThemeModeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'effectiveThemeModeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$effectiveThemeModeHash();

  @$internal
  @override
  $ProviderElement<ThemeMode> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ThemeMode create(Ref ref) {
    return effectiveThemeMode(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeMode>(value),
    );
  }
}

String _$effectiveThemeModeHash() =>
    r'2350666754808d32134c799d1e81cbbe0a2bb082';

@ProviderFor(appThemeController)
final appThemeControllerProvider = AppThemeControllerProvider._();

final class AppThemeControllerProvider
    extends
        $FunctionalProvider<
          AppThemeController,
          AppThemeController,
          AppThemeController
        >
    with $Provider<AppThemeController> {
  AppThemeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appThemeControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appThemeControllerHash();

  @$internal
  @override
  $ProviderElement<AppThemeController> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AppThemeController create(Ref ref) {
    return appThemeController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppThemeController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppThemeController>(value),
    );
  }
}

String _$appThemeControllerHash() =>
    r'44489988d9a76ff03d3d083a33b4eb9a02040720';
