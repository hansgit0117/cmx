class Setting {
  String appName;
  bool enableStripe;
  String defaultTax;
  String defaultCurrency;
  String fcmKey;
  bool enablePaypal;
  String defaultTheme;
  String mainColor;
  String mainDarkColor;
  String secondColor;
  String secondDarkColor;
  String accentColor;
  String accentDarkColor;
  String scaffoldDarkColor;
  String scaffoldColor;
  String googleMapsKey;
  String mobileLanguage;
  String appVersion;
  bool enableVersion;
  bool currencyRight;
  int defaultCurrencyDecimalDigits;
  bool enableRazorpay;
  String homeSection1;
  String homeSection2;
  String homeSection3;
  String homeSection4;
  String homeSection5;
  String homeSection6;
  String homeSection7;
  String homeSection8;
  String homeSection9;
  String homeSection10;
  String homeSection11;
  String homeSection12;

  Setting(
      {this.appName,
      this.enableStripe,
      this.defaultTax,
      this.defaultCurrency,
      this.fcmKey,
      this.enablePaypal,
      this.mainColor,
      this.mainDarkColor,
      this.secondColor,
      this.secondDarkColor,
      this.accentColor,
      this.accentDarkColor,
      this.scaffoldDarkColor,
      this.scaffoldColor,
      this.googleMapsKey,
      this.mobileLanguage,
      this.appVersion,
      this.enableVersion,
      this.currencyRight,
      this.defaultCurrencyDecimalDigits,
      this.enableRazorpay,
      this.homeSection1,
      this.homeSection2,
      this.homeSection3,
      this.homeSection4,
      this.homeSection5,
      this.homeSection6,
      this.homeSection7,
      this.homeSection8,
      this.homeSection9,
      this.homeSection10,
      this.homeSection11,
      this.homeSection12});

  Setting.fromJson(Map<String, dynamic> json) {
    appName = json['app_name'];
    enableStripe = json['enable_stripe'] == null || json['enable_stripe'] == '0' ? false : true;
    defaultTax = json['default_tax'];
    defaultCurrency = json['default_currency'];
    fcmKey = json['fcm_key'];
    enablePaypal = json['enable_paypal'] == null || json['enable_paypal'] == '0' ? false : true;
    defaultTheme = json['default_theme'];
    mainColor = json['main_color'];
    mainDarkColor = json['main_dark_color'];
    secondColor = json['second_color'];
    secondDarkColor = json['second_dark_color'];
    accentColor = json['accent_color'];
    accentDarkColor = json['accent_dark_color'];
    scaffoldDarkColor = json['scaffold_dark_color'];
    scaffoldColor = json['scaffold_color'];
    googleMapsKey = json['google_maps_key'];
    mobileLanguage = json['mobile_language'];
    appVersion = json['app_version'];
    enableVersion = json['enable_version'] == null || json['enable_version'] == '0' ? false : true;
    currencyRight = json['currency_right'] == null || json['currency_right'] == '0' ? false : true;
    defaultCurrencyDecimalDigits = int.tryParse(json['default_currency_decimal_digits'] ?? '2') ?? 2;
    enableRazorpay = json['enable_razorpay'] == null || json['enable_razorpay'] == '0' ? false : true;
    homeSection1 = json['home_section_1'];
    homeSection2 = json['home_section_2'];
    homeSection3 = json['home_section_3'];
    homeSection4 = json['home_section_4'];
    homeSection5 = json['home_section_5'];
    homeSection6 = json['home_section_6'];
    homeSection7 = json['home_section_7'];
    homeSection8 = json['home_section_8'];
    homeSection9 = json['home_section_9'];
    homeSection10 = json['home_section_10'];
    homeSection11 = json['home_section_11'];
    homeSection12 = json['home_section_12'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['app_name'] = this.appName;
    data['enable_stripe'] = this.enableStripe;
    data['default_tax'] = this.defaultTax;
    data['default_currency'] = this.defaultCurrency;
    data['fcm_key'] = this.fcmKey;
    data['enable_paypal'] = this.enablePaypal;
    data['main_color'] = this.mainColor;
    data['default_theme'] = this.defaultTheme;
    data['main_dark_color'] = this.mainDarkColor;
    data['second_color'] = this.secondColor;
    data['second_dark_color'] = this.secondDarkColor;
    data['accent_color'] = this.accentColor;
    data['accent_dark_color'] = this.accentDarkColor;
    data['scaffold_dark_color'] = this.scaffoldDarkColor;
    data['scaffold_color'] = this.scaffoldColor;
    data['google_maps_key'] = this.googleMapsKey;
    data['mobile_language'] = this.mobileLanguage;
    data['app_version'] = this.appVersion;
    data['enable_version'] = this.enableVersion;
    data['currency_right'] = this.currencyRight;
    data['default_currency_decimal_digits'] = this.defaultCurrencyDecimalDigits;
    data['enable_razorpay'] = this.enableRazorpay;
    data['home_section_1'] = this.homeSection1;
    data['home_section_2'] = this.homeSection2;
    data['home_section_3'] = this.homeSection3;
    data['home_section_4'] = this.homeSection4;
    data['home_section_5'] = this.homeSection5;
    data['home_section_6'] = this.homeSection6;
    data['home_section_7'] = this.homeSection7;
    data['home_section_8'] = this.homeSection8;
    data['home_section_9'] = this.homeSection9;
    data['home_section_10'] = this.homeSection10;
    data['home_section_11'] = this.homeSection11;
    data['home_section_12'] = this.homeSection12;
    return data;
  }
}
