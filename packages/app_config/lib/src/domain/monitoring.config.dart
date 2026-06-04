final class MonitoringConfig {
  const MonitoringConfig({
    this.enabled = false,
    this.crashReportingEnabled = true,
  });

  final bool enabled;
  final bool crashReportingEnabled;

  bool get shouldReportCrashes => enabled && crashReportingEnabled;
}
