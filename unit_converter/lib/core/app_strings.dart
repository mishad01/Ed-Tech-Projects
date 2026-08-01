/// All static text strings displayed in the Unit Converter app.
class AppStrings {
  // ── App-wide ──────────────────────────────────────────────────────────────

  /// Shown in the browser/OS task switcher and the AppBar.
  static const String appTitle = 'Unit Converter';

  // ── Converter Screen — section labels ────────────────────────────────────

  /// Section header above the category chips.
  static const String chooseCategory = 'Choose a category';

  /// Section header above the numeric input field.
  static const String enterValue = 'Enter a value';

  /// Section header above the From/To dropdowns.
  static const String selectUnits = 'Select units';

  // ── Input Field ───────────────────────────────────────────────────────────

  /// Floating label inside the text field.
  static const String inputLabel = 'Value to convert';

  /// Greyed-out placeholder shown when the field is empty.
  static const String inputHint = 'e.g. 100';

  // ── Unit Dropdowns ────────────────────────────────────────────────────────

  /// Label for the "source" dropdown.
  static const String fromLabel = 'From';

  /// Label for the "target" dropdown.
  static const String toLabel = 'To';

  /// Tooltip shown when hovering over the swap icon button.
  static const String swapTooltip = 'Swap units';

  // ── Result Card ───────────────────────────────────────────────────────────

  /// Small heading above the big result number.
  static const String resultLabel = 'Result';

  /// Shown inside the result card before the user enters a number.
  static const String resultHint = 'Enter a number above';
}
