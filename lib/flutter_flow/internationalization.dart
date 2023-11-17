import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'th'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? thText = '',
  }) =>
      [enText, thText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // login
  {
    'h0dwlqfk': {
      'en': 'Welcome back! \nGlad to see you, Again!',
      'th': 'ยินดีต้อนรับกลับ!',
    },
    'j7s5erhx': {
      'en': 'Enter your email',
      'th': 'กรอกอีเมลของคุณ',
    },
    'y4t4mojb': {
      'en': '',
      'th': '',
    },
    'zcyxa4je': {
      'en': 'Enter your password',
      'th': 'กรอกรหัสผ่านของคุณ',
    },
    '0i1iyhe2': {
      'en': 'Forgot Password?',
      'th': 'ลืมรหัสผ่าน?',
    },
    '1ao0n4nj': {
      'en': 'Login',
      'th': '',
    },
    'vtgzci3k': {
      'en': 'Don\'t have an account?  ',
      'th': '',
    },
    '5fvktpwr': {
      'en': 'Register Now',
      'th': '',
    },
    'jc5g2f6n': {
      'en': 'Home',
      'th': 'บ้าน',
    },
  },
  // home
  {
    'ujw6os2u': {
      'en': 'Tracktify',
      'th': '',
    },
    '9ascwiye': {
      'en': 'Login',
      'th': 'เข้าสู่ระบบ',
    },
    '3t1dcfzz': {
      'en': 'Register',
      'th': 'สมัครสมาชิก',
    },
    '17nafvn6': {
      'en': 'Continue as a guest',
      'th': '',
    },
  },
  // register
  {
    'aq41qois': {
      'en': 'Hello! Register to get started',
      'th': 'ยินดีต้อนรับกลับ!',
    },
    'nv0j70nn': {
      'en': 'Enter your Name',
      'th': 'กรอกอีเมลของคุณ',
    },
    '0wxxus4o': {
      'en': '',
      'th': '',
    },
    'xr0yfysu': {
      'en': 'Enter your Email',
      'th': 'กรอกอีเมลของคุณ',
    },
    'b0rmxned': {
      'en': '',
      'th': '',
    },
    '3omuxxgz': {
      'en': 'Enter your Password',
      'th': 'กรอกรหัสผ่านของคุณ',
    },
    's0qyhfqa': {
      'en': 'Register',
      'th': '',
    },
    '2lqpkq4f': {
      'en': 'Already have an account? ',
      'th': '',
    },
    'q8qoi8wf': {
      'en': 'Login Now',
      'th': '',
    },
    'abicctuj': {
      'en': 'Home',
      'th': 'บ้าน',
    },
  },
  // forgotpassword
  {
    'rqkzhpxx': {
      'en': 'Forgot Password?',
      'th': 'ยินดีต้อนรับกลับ!',
    },
    'glaowqfy': {
      'en':
          'Don\'t worry! It occurs. Please enter the email address linked with your account.',
      'th': 'ยินดีต้อนรับกลับ!',
    },
    'ick9pnyn': {
      'en': 'Enter your email',
      'th': 'กรอกอีเมลของคุณ',
    },
    'v7g6bnhh': {
      'en': '',
      'th': '',
    },
    '51os7edu': {
      'en': 'Send code',
      'th': '',
    },
    'njdmtjr9': {
      'en': 'Remember Password? ',
      'th': '',
    },
    'ioqher2m': {
      'en': 'Login Now',
      'th': '',
    },
    'ggokip5r': {
      'en': 'Home',
      'th': 'บ้าน',
    },
  },
  // trackingpage
  {
    '9l4esfh9': {
      'en': 'Enter parcel number ',
      'th': '',
    },
    'k4c5gaa4': {
      'en': 'Enter tracking number...',
      'th': 'กรอกอีเมลของคุณ',
    },
    '59c0phkx': {
      'en': '',
      'th': '',
    },
    '1179ou70': {
      'en': 'Track Parcel',
      'th': '',
    },
    '4g0m0wck': {
      'en': 'Tracking History',
      'th': '',
    },
    'jbpurzu7': {
      'en': 'Tracktify',
      'th': '',
    },
    'j84wladd': {
      'en': 'home',
      'th': '',
    },
  },
  // myparcel
  {
    'g1q4rxc6': {
      'en': 'Tracktify',
      'th': '',
    },
    'gfsnw6dh': {
      'en': 'My parcels',
      'th': '',
    },
    'q55p46qw': {
      'en': 'หูฟัง',
      'th': '',
    },
    'qg70d5kl': {
      'en': 'SHP5360121343',
      'th': '',
    },
    'bwpmfwo4': {
      'en': 'พัสดุถึงสาขาปลายทาง',
      'th': '',
    },
    'ta6pgpj7': {
      'en': 'Details',
      'th': '',
    },
    'vgwmlt9c': {
      'en': 'My parcels',
      'th': '',
    },
  },
  // setting
  {
    '1puq6j9c': {
      'en': 'Account Setting',
      'th': '',
    },
    'x9iok4ig': {
      'en': 'Edit Profile',
      'th': '',
    },
    'wen64hnn': {
      'en': 'Change Password',
      'th': '',
    },
    'rtqeglct': {
      'en': 'Push Notifications',
      'th': '',
    },
    '7a7z50al': {
      'en': 'Dark Mode',
      'th': '',
    },
    'pr13qvqx': {
      'en': 'More',
      'th': '',
    },
    'sij0c0s8': {
      'en': 'Support',
      'th': '',
    },
    'i6yzkzyc': {
      'en': 'Terms of Service',
      'th': '',
    },
    'esacaix5': {
      'en': 'Log Out',
      'th': '',
    },
    'm08lsw6e': {
      'en': 'Settings',
      'th': '',
    },
    '6kt34vyp': {
      'en': 'setting',
      'th': '',
    },
  },
  // ProfileEdit
  {
    '47ybm0he': {
      'en': 'Your Name',
      'th': '',
    },
    'qcl3nk4y': {
      'en': 'Your Email',
      'th': '',
    },
    'bl3v45d2': {
      'en': 'Save Changes',
      'th': '',
    },
    '2o9jgqhz': {
      'en': 'Edit Profile',
      'th': '',
    },
  },
  // trackingParcel
  {
    '5ibg2d8f': {
      'en': 'SHP5360121343',
      'th': '',
    },
    'vsnw76fd': {
      'en': 'พัสดุถึงสาขาปลายทาง, กรุงเทพมหานคร,\nสะพานสูง,ราษฎร์พัฒนา',
      'th': '',
    },
    'kn5t95mv': {
      'en': 'April 12, 2023',
      'th': '',
    },
    'cm3hhou2': {
      'en': 'พัสดุถึงสาขาปลายทาง, กรุงเทพมหานคร,\nสะพานสูง,ราษฎร์พัฒนา',
      'th': '',
    },
    'jm87uy3g': {
      'en': 'April 12, 2023',
      'th': '',
    },
    '205phv9o': {
      'en': 'พัสดุถึงศูนย์คัดแยกสินค้า, พระนครศรีอยุธยา, \nเคอรี่ปทุมธานี',
      'th': '',
    },
    's11wq5p4': {
      'en': 'April 11, 2022',
      'th': '',
    },
    'uf2zkd6e': {
      'en': 'บริษัทขนส่งเข้ารับพัสดุเรียบร้อยแล้ว, พระนครศรีอยุธยา',
      'th': '',
    },
    'kq0r5uxq': {
      'en': 'April 10, 2022',
      'th': '',
    },
    'mg1985ez': {
      'en': 'Track parcel',
      'th': '',
    },
    '7zfu9x7a': {
      'en': 'Tracktify',
      'th': '',
    },
    'ransss00': {
      'en': 'home',
      'th': '',
    },
  },
  // Parceldetails
  {
    '7tfukerk': {
      'en': 'หูฟัง',
      'th': '',
    },
    'k96huicl': {
      'en': 'พัสดุถึงสาขาปลายทาง, กรุงเทพมหานคร,\nสะพานสูง,ราษฎร์พัฒนา',
      'th': '',
    },
    'yutmzhhn': {
      'en': 'April 12, 2023',
      'th': '',
    },
    'cku3760b': {
      'en': 'พัสดุถึงสาขาปลายทาง, กรุงเทพมหานคร,\nสะพานสูง,ราษฎร์พัฒนา',
      'th': '',
    },
    'mqhxteh2': {
      'en': 'April 12, 2023',
      'th': '',
    },
    '8bhkgut4': {
      'en': 'พัสดุถึงศูนย์คัดแยกสินค้า, พระนครศรีอยุธยา, \nเคอรี่ปทุมธานี',
      'th': '',
    },
    'r98u524c': {
      'en': 'April 11, 2022',
      'th': '',
    },
    '849cwjre': {
      'en': 'บริษัทขนส่งเข้ารับพัสดุเรียบร้อยแล้ว, พระนครศรีอยุธยา',
      'th': '',
    },
    'kkbohgl8': {
      'en': 'April 10, 2022',
      'th': '',
    },
    'j9v75dhq': {
      'en': 'SHP5360121343',
      'th': '',
    },
    'vb3ougq3': {
      'en': 'Tracktify',
      'th': '',
    },
    'mlfohmgz': {
      'en': 'home',
      'th': '',
    },
  },
  // note
  {
    'dtw3jze7': {
      'en': 'Note',
      'th': '',
    },
    'k19sea4j': {
      'en': 'Leave note here...',
      'th': '',
    },
    'hkbd0o5x': {
      'en': 'Save',
      'th': '',
    },
  },
  // Miscellaneous
  {
    'yvsnv3n1': {
      'en': '',
      'th': '',
    },
    'kq3plyhb': {
      'en': '',
      'th': '',
    },
    'iv8j9m14': {
      'en': '',
      'th': '',
    },
    'uzp3570h': {
      'en': '',
      'th': '',
    },
    'pbrcspdk': {
      'en': '',
      'th': '',
    },
    'g9enweqp': {
      'en': '',
      'th': '',
    },
    'yg76551p': {
      'en': '',
      'th': '',
    },
    'q2b1eak0': {
      'en': '',
      'th': '',
    },
    'gj1il3ny': {
      'en': '',
      'th': '',
    },
    'opjjbzd5': {
      'en': '',
      'th': '',
    },
    '5z67w2k2': {
      'en': '',
      'th': '',
    },
    'zh81a7fq': {
      'en': '',
      'th': '',
    },
    'gqg3orsk': {
      'en': '',
      'th': '',
    },
    'x0kryout': {
      'en': '',
      'th': '',
    },
    '010cyj2t': {
      'en': '',
      'th': '',
    },
    '5ivkgp0q': {
      'en': '',
      'th': '',
    },
    '9inqe767': {
      'en': '',
      'th': '',
    },
    'aqtj9ypz': {
      'en': '',
      'th': '',
    },
    'k1ikmjk2': {
      'en': '',
      'th': '',
    },
    '02ytiug6': {
      'en': '',
      'th': '',
    },
    'txiq5ei8': {
      'en': '',
      'th': '',
    },
    'lecym75r': {
      'en': '',
      'th': '',
    },
    'p87ta95r': {
      'en': '',
      'th': '',
    },
    '63fkbo3j': {
      'en': '',
      'th': '',
    },
    'vdr2xpsl': {
      'en': '',
      'th': '',
    },
  },
].reduce((a, b) => a..addAll(b));
