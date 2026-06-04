final class FeatureFlags {
  const FeatureFlags({
    this.enableOfflineMode = true,
    this.enableReferralProgram = false,
    this.enableMessaging = false,
    this.enableClaims = false,
  });

  final bool enableOfflineMode;
  final bool enableReferralProgram;
  final bool enableMessaging;
  final bool enableClaims;
}
