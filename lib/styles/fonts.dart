part of styling;

double fontSize = 14;

class AppFonts {
  static TextStyle getAppFont({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
  }) {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          height: height),
    );
  }

  static final TextStyle primaryHeader = getAppFont(
      color: TextColors.primaryTextColor,
      fontSize: 24,
      fontWeight: FontWeight.w900);
  static final TextStyle primaryText = getAppFont(
    color: TextColors.primaryTextColor,
    fontSize: 14,
  );
  static final TextStyle secondaryText = getAppFont(
    color: TextColors.secondaryTextColor,
    fontSize: 14,
  );
}
