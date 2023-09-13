import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

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
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

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
  // mainPage
  {
    'n71dyynj': {
      'en': 'Package Summary',
      'ar': 'ملخص الطرود',
    },
    'd0bi1ug2': {
      'en': 'Delivered',
      'ar': 'تم التوصيل',
    },
    'nu6n0ryr': {
      'en': 'Canceled',
      'ar': 'ملغاة',
    },
    'vziau5x4': {
      'en': 'InProgress',
      'ar': 'قيد التوصيل',
    },
    'ogh2yvl9': {
      'en': 'Money Handed',
      'ar': 'اموال تم تسليمها ',
    },
    'l2q7ic44': {
      'en': 'Money in Progress',
      'ar': 'اموال غير جاهزة للتسليم',
    },
    'p1pbp6pn': {
      'en': 'Money ready to hand',
      'ar': 'أموال جاهزة للاستلام',
    },
    'cyzuwpg7': {
      'en': 'Money Transfer Summary',
      'ar': 'ملخص التحويلات المالية',
    },
    'acvzfnmi': {
      'en': 'Handed',
      'ar': 'مستلمة',
    },
    '9lzbs6la': {
      'en': 'Ready',
      'ar': 'جاهزة للاستلام',
    },
    '86w3c8ab': {
      'en': 'In Progress',
      'ar': 'غير جاهزة للتسليم',
    },
    'jfe079jt': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
    'opu7x5po': {
      'en': 'Track Package',
      'ar': 'تتبع طرد',
    },
    'ht070qrr': {
      'en': 'Package List',
      'ar': 'سجل الطرود',
    },
    '01zn3ru6': {
      'en': 'Add Package',
      'ar': 'اضافة طرد',
    },
    '0zu142f2': {
      'en': 'User Name',
      'ar': 'اسم المستخدم',
    },
    '2pm7a5go': {
      'en': 'E-mail',
      'ar': 'البريد الالكتروني',
    },
    'gw65bemp': {
      'en': 'View Profile',
      'ar': 'عرض الملف الشخصي',
    },
    'jbwwmqnr': {
      'en': 'Package Summary',
      'ar': 'ملخص الطرود',
    },
    'f0eom7yv': {
      'en': '15',
      'ar': '15',
    },
    'f5sycffx': {
      'en': 'Successfull',
      'ar': 'تم التسليم',
    },
    '9vkwyb2d': {
      'en': '3',
      'ar': '3',
    },
    '6lnk3542': {
      'en': 'Canceled',
      'ar': 'ملغاة',
    },
    '6h6a53b6': {
      'en': '15',
      'ar': '15',
    },
    'rsiumm0j': {
      'en': 'In Progress',
      'ar': 'قيد التوصيل',
    },
    '1g9cfgrn': {
      'en': 'Money Transfer Summary',
      'ar': 'سجل التحويلات المالية',
    },
    '73oph5sp': {
      'en': '1500',
      'ar': '1500',
    },
    '4e268v7s': {
      'en': 'Handed',
      'ar': 'تم التسليم',
    },
    'v344cn2e': {
      'en': '370',
      'ar': '370',
    },
    'hnc6vhi2': {
      'en': 'Ready',
      'ar': 'جاهز للاستلام',
    },
    't30lwo68': {
      'en': '150',
      'ar': '150',
    },
    'igkauaj9': {
      'en': 'In Progress',
      'ar': 'غير جاهز',
    },
    'p42yeq8u': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
    'l9e0cxmw': {
      'en': 'Log out',
      'ar': 'تسجيل الخروج',
    },
    'dr2wjooh': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
    'jn9od0jc': {
      'en': 'Track Package',
      'ar': 'تتبع طرد',
    },
    'zyrzdgud': {
      'en': 'Package List',
      'ar': 'سجل الطرود',
    },
    '1y0gry6y': {
      'en': 'Add Package',
      'ar': 'إضافة طرد',
    },
    '24kzc762': {
      'en': 'About US',
      'ar': 'معلومات عن المكتب',
    },
    'j2kavg38': {
      'en': 'View Profile',
      'ar': 'عرض الملف الشخصي',
    },
    '15geak67': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // SignUp
  {
    'pp40kkp5': {
      'en': 'Nazik Delivery',
      'ar': 'نازك للتوصيل',
    },
    'gcnrf35a': {
      'en': 'Create account',
      'ar': 'إنشاء حساب',
    },
    'w8t23uej': {
      'en': 'Fill the following fields',
      'ar': 'املئ الحقول التالية',
    },
    'ulm4ffc0': {
      'en': 'E-mail',
      'ar': 'البريد الالكتروني',
    },
    'cxfzyp7o': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'k6b3sfnw': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
    },
    'pxok5gbo': {
      'en': 'User Name',
      'ar': 'اسم المستخدم',
    },
    'io3kiq3g': {
      'en': 'Phone',
      'ar': 'رقم الهاتف',
    },
    '05l6ltl6': {
      'en': 'Company',
      'ar': 'الشركة',
    },
    'jb10k63j': {
      'en': 'Tripoli',
      'ar': 'طرابلس',
    },
    '0bc5mhft': {
      'en': 'Tripoli',
      'ar': 'طرابلس',
    },
    '5vkg9p08': {
      'en': 'Benghazi',
      'ar': 'بنغازي',
    },
    'v0u8dlax': {
      'en': 'Sabha',
      'ar': 'سبها',
    },
    'j6kb7o10': {
      'en': 'City',
      'ar': 'المدينة',
    },
    '3ppge3xt': {
      'en': 'Select City...',
      'ar': 'اختر مدينة',
    },
    'mkiyvmji': {
      'en': 'Create account',
      'ar': 'انشاء حساب',
    },
    'x54w9q7y': {
      'en': 'Already have account?',
      'ar': 'لديك حساب بالفعل؟',
    },
    'qckum5zd': {
      'en': 'Log in',
      'ar': 'تسجيل الدخول',
    },
    'rmleorhn': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // login
  {
    '6xr2gqqm': {
      'en': 'Sign in',
      'ar': 'تسجيل الدخول',
    },
    'g74grkju': {
      'en': 'Fill The followin fields',
      'ar': 'املئ الحقول التالية',
    },
    'j2ev3y0c': {
      'en': 'Email',
      'ar': 'البريد الالكتروني',
    },
    'rez08b58': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    '74tsnpea': {
      'en': 'Sign in',
      'ar': 'تسجيل الدخول',
    },
    'dacnyedd': {
      'en': 'or',
      'ar': 'أو',
    },
    'lki3xezr': {
      'en': 'Continue with Google',
      'ar': 'تسجيل عن طريق جوجل',
    },
    'jm11bofd': {
      'en': 'Don\'t have account? ',
      'ar': 'ليس لدي حساب؟',
    },
    '42poh8aw': {
      'en': 'Create new account',
      'ar': 'إنشاء حساب جديد',
    },
    'hqwhiw73': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // PackageNew
  {
    'jp5w3nem': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
    'scpsunnt': {
      'en': 'Track Package',
      'ar': 'تتبع طرد',
    },
    'pvdtzwsp': {
      'en': 'Package List',
      'ar': 'سجل الطرود',
    },
    'ql1v92u3': {
      'en': 'Add Package',
      'ar': 'انشاء طرد',
    },
    'imnwq5ap': {
      'en': 'User Name',
      'ar': 'اسم المستخدم',
    },
    'h7dubc20': {
      'en': 'E-mail',
      'ar': 'البريد الالكتروني',
    },
    'xt0hr0ay': {
      'en': 'View Profile',
      'ar': 'عرض الملف الشخصي',
    },
    '86kagqb8': {
      'en': 'Reciever Data',
      'ar': 'بيانات المستلم',
    },
    'htudp3g7': {
      'en': 'Name',
      'ar': 'الاسم',
    },
    '0zhf6m1m': {
      'en': 'Phone',
      'ar': 'رقم الهاتف',
    },
    'fggcofnb': {
      'en': 'Location',
      'ar': 'الموقع',
    },
    'vo8pppmu': {
      'en': 'Sender Data',
      'ar': 'بيانات المرسل',
    },
    '1ydnrtua': {
      'en': 'Name',
      'ar': 'الاسم',
    },
    'nzuylcel': {
      'en': 'Phone',
      'ar': 'رقم الهاتف',
    },
    'uc9wo6mv': {
      'en': 'Location',
      'ar': 'الموقع',
    },
    'qy7q94ej': {
      'en': 'Package Data',
      'ar': 'بيانات الطرد',
    },
    '72w1eyyt': {
      'en': 'Tripoli',
      'ar': 'طرابلس',
    },
    '6wvck9q7': {
      'en': 'Benghazi',
      'ar': 'بنغازي',
    },
    '0yap279p': {
      'en': 'Sabha',
      'ar': 'سبها',
    },
    '96v01yrc': {
      'en': 'Tranmitter Office',
      'ar': 'المكتب المرسل',
    },
    'qyz0279x': {
      'en': 'Select an Office...',
      'ar': 'اختيار مكتب',
    },
    'j1psteap': {
      'en': 'Tripoli',
      'ar': 'طرابلس',
    },
    '69hsph95': {
      'en': 'Benghazi',
      'ar': 'بنغازي',
    },
    'lq1o3owj': {
      'en': 'Sabha',
      'ar': 'سبها',
    },
    '5a02wym2': {
      'en': 'Reciever Office',
      'ar': 'المكتب المستلم',
    },
    '1u5gxjn6': {
      'en': 'Select an Office...',
      'ar': 'اختيار مكتب',
    },
    '239n9wbv': {
      'en': 'Box',
      'ar': 'صندوق',
    },
    'avcgp3sg': {
      'en': 'Bag',
      'ar': 'كيس',
    },
    'dv3m5vlw': {
      'en': 'Envelop',
      'ar': 'مظروف',
    },
    't7826i2j': {
      'en': 'Other',
      'ar': 'اخرى',
    },
    'gbsi1mo4': {
      'en': 'Package Type',
      'ar': 'نوع الطرد',
    },
    'l9vpe1ij': {
      'en': 'Select Type...',
      'ar': 'نوع الطرد',
    },
    '1oao2le2': {
      'en': 'Send Date',
      'ar': 'تاريخ الارسال',
    },
    '40t8b6gr': {
      'en': 'Rev',
      'ar': 'الراجع',
    },
    'mf088mjj': {
      'en': 'Notes',
      'ar': 'ملاحظات',
    },
    '4w08s8m5': {
      'en': 'Save',
      'ar': 'حفظ',
    },
    'yfzzn0l9': {
      'en': 'Reciever Data',
      'ar': 'بيانات المستلم',
    },
    'luwh5co8': {
      'en': 'Reciever Name',
      'ar': 'اسم المستلم',
    },
    'jlfbud39': {
      'en': 'Reciever Phone',
      'ar': 'هاتف المستلم',
    },
    'dy6h4glp': {
      'en': 'Reciever Location',
      'ar': 'موقع المستلم',
    },
    'uqpqofbh': {
      'en': 'Transmitter Data',
      'ar': 'بيانات المرسل',
    },
    'u0ulbte6': {
      'en': 'Transmitter Name',
      'ar': 'اسم المرسل',
    },
    'lx7ou2eb': {
      'en': 'Transmitter Phone',
      'ar': 'رقم المرسل',
    },
    '0jz1ijub': {
      'en': 'Transmitter Location',
      'ar': 'موقع المرسل',
    },
    'iso96ope': {
      'en': 'Package Data',
      'ar': 'بيانات الطرد',
    },
    '6c6yyguh': {
      'en': 'Tripoli',
      'ar': 'طرابلس',
    },
    'jvk97onb': {
      'en': 'Benghazi',
      'ar': 'بنغازي',
    },
    'atirou90': {
      'en': 'Sabha',
      'ar': 'سبها',
    },
    'kgqzrtom': {
      'en': 'Tranmitter Office',
      'ar': 'المكتب المرسل',
    },
    '4st9u2y7': {
      'en': 'Select an Office...',
      'ar': 'اختر مكتب...',
    },
    'ifx1t6bh': {
      'en': 'east zone',
      'ar': 'المنطقة الشرقية',
    },
    'o4ycxorb': {
      'en': 'west zone',
      'ar': 'المنطقة الغربية',
    },
    'f6v17xf5': {
      'en': 'middle zone',
      'ar': 'المنطقة الوسطى',
    },
    'glxbncgu': {
      'en': 'south zone',
      'ar': 'المنطقة الجنوبية',
    },
    'rzglbbr6': {
      'en': 'Receiver Office',
      'ar': 'المكتب المستلم',
    },
    'iiul7dt8': {
      'en': 'Select an Office...',
      'ar': 'اختر مكتب...',
    },
    '1ek6y9mt': {
      'en': 'Clothes',
      'ar': 'ملابس',
    },
    'hj75vdbt': {
      'en': 'Shoes',
      'ar': 'أحذية',
    },
    'gysc1goo': {
      'en': 'Home accesories',
      'ar': 'منزلية',
    },
    'iseqre8x': {
      'en': 'Electronics',
      'ar': 'الكترونات',
    },
    'b477en4c': {
      'en': 'Documents',
      'ar': 'مستندات',
    },
    'rnk73p1l': {
      'en': 'Food',
      'ar': 'تغذية',
    },
    '8zemhn07': {
      'en': 'Other',
      'ar': 'أخرى',
    },
    'k9mtq8di': {
      'en': 'Package Type',
      'ar': 'نوع الطرد',
    },
    '9w6giijh': {
      'en': 'Select Type...',
      'ar': 'اختر نوع...',
    },
    'winw1eg0': {
      'en': 'breakable',
      'ar': 'قابلة للكسر',
    },
    '8la91xid': {
      'en': 'not breakable',
      'ar': 'غير قابلة للكسر',
    },
    'giu8zwyh': {
      'en': 'Breakable',
      'ar': 'قابلية الكسر',
    },
    '3et4askw': {
      'en': 'Select Type...',
      'ar': 'اختر نوع...',
    },
    'ey7zkjga': {
      'en': 'Send Date',
      'ar': 'تاريخ الارسال',
    },
    'uql15fbt': {
      'en': 'Rev',
      'ar': 'الراجع',
    },
    'raq4kbn7': {
      'en': 'Notes',
      'ar': 'الملاحظات',
    },
    'a5a0apkv': {
      'en': 'PackageID',
      'ar': 'الراجع',
    },
    'd5sa31ii': {
      'en': 'Save',
      'ar': 'حفظ',
    },
    '383l0n7m': {
      'en': 'New Package',
      'ar': 'طرد جديد',
    },
    'y6u42x0f': {
      'en': 'Log out',
      'ar': 'تسجيل الخروج',
    },
    '9befvebs': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
    'wutfwvxd': {
      'en': 'Track Package',
      'ar': 'تتبع طرد',
    },
    'n90ptmaq': {
      'en': 'Packages List',
      'ar': 'سجل الطرود',
    },
    'ptcwvc8a': {
      'en': 'Add Package',
      'ar': 'اضافة طرد',
    },
    'vreakwej': {
      'en': 'About US',
      'ar': 'معلومات عن المكتب',
    },
    'g47qwp3b': {
      'en': 'View Profile',
      'ar': 'عرض الملف الشخصي',
    },
    'jxwvs5hx': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // PackageList
  {
    '7i9ui25r': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
    '58il134j': {
      'en': 'Track Package',
      'ar': 'تتبع طرد',
    },
    'ta4gkroz': {
      'en': 'Package List',
      'ar': 'سجل الطرود',
    },
    '89yh6ls6': {
      'en': 'Add Package',
      'ar': 'طرد جديد',
    },
    'avzd1d6i': {
      'en': 'User Name',
      'ar': 'اسم المستخدم',
    },
    '3lobkj2i': {
      'en': 'E-mail',
      'ar': 'البريد الإلكتروني',
    },
    'gztxb58i': {
      'en': 'View Profile',
      'ar': 'عرض الملف الشخصي',
    },
    'l7rrkuae': {
      'en': 'Reference',
      'ar': 'رقم الطرد',
    },
    's22b54ca': {
      'en': 'State',
      'ar': 'الحالة',
    },
    '7157e6id': {
      'en': 'Recieve Date',
      'ar': 'تاريخ الاستلام',
    },
    '17dcxbo9': {
      'en': 'Deliver Date',
      'ar': 'تاريخ الاستلام',
    },
    'w6d2hvs6': {
      'en': 'Transmitter Office',
      'ar': 'المكتب المرسل',
    },
    'zsic7j5s': {
      'en': 'Reciver Office',
      'ar': 'المكتب المستلم',
    },
    'ikpvcm86': {
      'en': 'Reference',
      'ar': 'رقم الطرد',
    },
    'prk018el': {
      'en': 'State',
      'ar': 'الحالة',
    },
    'wv0bbc12': {
      'en': 'Recieve Date',
      'ar': 'تاريخ الاستلام',
    },
    'fyhzh78u': {
      'en': 'Deliver Date',
      'ar': 'تاريخ التسليم',
    },
    'huasastt': {
      'en': 'Transmitter Office',
      'ar': 'المكتب المرسل',
    },
    'hcy1qg4q': {
      'en': 'Reciver Office',
      'ar': 'المكتب المستلم',
    },
    'p1zih174': {
      'en': 'Refernce',
      'ar': 'رقم الطرد',
    },
    'xb7xva17': {
      'en': 'State',
      'ar': 'الحالة',
    },
    '70c1j03b': {
      'en': 'Send Date',
      'ar': 'تاريخ الارسال',
    },
    'p5i14007': {
      'en': 'Driver',
      'ar': 'السائق',
    },
    'wax78xfz': {
      'en': 'Packages List',
      'ar': 'سجل الطرود',
    },
    'yqjn96f1': {
      'en': 'Log out',
      'ar': 'تسجيل الخروج',
    },
    'y2gcq9dg': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
    'adni2f0f': {
      'en': 'Track Package',
      'ar': 'تتبع طرد',
    },
    '5qajdgoj': {
      'en': 'Package List',
      'ar': 'سجل الطرود',
    },
    'qsncry7o': {
      'en': 'Add Package',
      'ar': 'اضافة طرد',
    },
    'exl8umza': {
      'en': 'About US',
      'ar': 'معلومات عن المكتب',
    },
    'hehg50ef': {
      'en': 'View Profile',
      'ar': 'عرض الملف الشخصي',
    },
    'w05evspm': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // PackageTrack
  {
    'odb6ozu8': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
    '4c3y3gzg': {
      'en': 'Track Package',
      'ar': 'تتبع طرد',
    },
    'stxtz3k1': {
      'en': 'Package List',
      'ar': 'سجل الطرود',
    },
    'mvstetiw': {
      'en': 'Add Package',
      'ar': 'اضافة طرد',
    },
    'vdt8qf7m': {
      'en': 'User Name',
      'ar': 'اسم المستخدم',
    },
    '439phynl': {
      'en': 'E-mail',
      'ar': 'البريد الالكتروني',
    },
    'nw9nnd0k': {
      'en': 'View Profile',
      'ar': 'عرض الملف الشخصي',
    },
    '1mfirhup': {
      'en': 'Package Ref...',
      'ar': 'رقم الطرد',
    },
    '9ua58rht': {
      'en': 'Search',
      'ar': 'بحث',
    },
    'tgdh75c1': {
      'en': 'Reference',
      'ar': 'رقم الطرد',
    },
    '9w7y62xv': {
      'en': 'State',
      'ar': 'الحالة',
    },
    'hm39y311': {
      'en': 'Recieve Date',
      'ar': 'تاريخ الاستلام',
    },
    'pr8u2qy8': {
      'en': 'Deliver Date',
      'ar': 'تاريخ التسليم',
    },
    'i5od12oh': {
      'en': 'Transmitter Office',
      'ar': 'المكتب المرسل',
    },
    '8an848hp': {
      'en': 'Reciver Office',
      'ar': 'المكتب المستلم',
    },
    'sdxof1ac': {
      'en': 'Package Ref...',
      'ar': 'رقم الطرد',
    },
    'icyjmjg8': {
      'en': 'Search',
      'ar': 'بحث',
    },
    'nzzwzsve': {
      'en': 'Track Package',
      'ar': 'تتبع طرد',
    },
    'kqmli5kt': {
      'en': 'Log out',
      'ar': 'تسجيل الخروج',
    },
    'apsdaaxk': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
    'u5981mi1': {
      'en': 'Track Package',
      'ar': 'تتبع طرد',
    },
    '9k6gy86l': {
      'en': 'Package List',
      'ar': 'سجل الطرود',
    },
    'm81ae8df': {
      'en': 'Add Package',
      'ar': 'اضافة طرد',
    },
    'iieaig71': {
      'en': 'About US',
      'ar': 'معلومات عن المكتب',
    },
    '67puymlp': {
      'en': 'View Profile',
      'ar': 'عرض الملف الشخصي',
    },
    'f1ck7gj7': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // UserProfileEdit
  {
    'tefmlfej': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'rf6ucjrm': {
      'en': 'New Password',
      'ar': 'كلمة المرور الجديدة',
    },
    'nc9cxa3p': {
      'en': 'Phone',
      'ar': 'رقم الهاتف',
    },
    'q5es960k': {
      'en': 'New Phone Number',
      'ar': 'رقم الهاتف الجديد',
    },
    '40xu20d8': {
      'en': 'Company',
      'ar': 'الشركة',
    },
    'vdbtusv6': {
      'en': 'Your Company',
      'ar': 'الشركة',
    },
    'bjvdcpl4': {
      'en': 'Tripoli',
      'ar': 'طرابلس',
    },
    'aqfniyn9': {
      'en': 'Benghazi',
      'ar': 'بنغازي',
    },
    'xhwz04jl': {
      'en': 'Sabha',
      'ar': 'سبها',
    },
    'qm96q4fm': {
      'en': 'Select City...',
      'ar': 'اختر مدينة',
    },
    'tstg8ign': {
      'en': 'Select City...',
      'ar': 'اختر مدينة',
    },
    '2mkkfveq': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
    },
    'vi230m2r': {
      'en': 'Edit Your Profile',
      'ar': 'تعديل الملف الشخصي',
    },
  },
  // aboutNazik
  {
    'wfrvmiyw': {
      'en':
          'Welcome to our package delivery service in Tripoli, Libya! At NAZIK, we are committed to providing fast and reliable package delivery solutions tailored to the unique needs of small offices and businesses throughout Libya. With a deep understanding of the challenges faced by businesses in the region, we have designed our services to streamline the delivery process, ensuring that your packages reach their destination promptly and securely.\n\nOur dedicated team of professionals is well-versed in navigating the intricacies of Libyan logistics, allowing us to efficiently deliver packages to even the most remote areas. Whether you are sending important documents, products, or supplies, we take pride in our ability to offer a range of delivery options to suit your specific requirements. From same-day deliveries within Tripoli to shipments spanning the entire country, we are your trusted partner for all your package delivery needs.',
      'ar':
          'مرحبًا بكم في خدمة توصيل الطرود لدينا في طرابلس، ليبيا! في نازك، نحن ملتزمون بتقديم حلول سريعة وموثوقة لتوصيل الطرود مصممة خصيصًا لتلبية احتياجات الشركات الصغيرة وأصحاب الأعمال في جميع أنحاء ليبيا. بفهم عميق للتحديات التي تواجه الشركات في المنطقة، قمنا بتصميم خدماتنا لتبسيط عملية التوصيل، مضمونينًا أن طرودكم ستصل إلى وجهتها بسرعة وبأمان.\n\nفريقنا المتفاني من المحترفين لديه معرفة عميقة بكيفية التعامل مع تفاصيل اللوجستيات في ليبيا، مما يسمح لنا بتوصيل الطرود بكفاءة حتى في أبعد المناطق. سواء كنتم ترسلون وثائق مهمة أو منتجات أو مستلزمات، نفتخر بقدرتنا على تقديم مجموعة متنوعة من خيارات التوصيل لتلبية متطلباتكم الخاصة. من التوصيل في نفس اليوم داخل طرابلس إلى شحنات تمتد عبر البلاد بأكملها، نحن شريككم الموثوق لجميع احتياجات توصيل الطرود الخاصة بكم.',
    },
    'lniuwy3t': {
      'en': 'Developed by ',
      'ar': 'تم التطوير من قبل',
    },
    'zruuy8ak': {
      'en': 'Askeeb ',
      'ar': ' اسكيب ',
    },
    'au5vzrw3': {
      'en': '\n+218944580235',
      'ar': '\n+218944580235',
    },
    '01bcbq2z': {
      'en': 'User Profile',
      'ar': 'الملف الشخصي',
    },
  },
  // UserProfile
  {
    'hy9z0whi': {
      'en': 'Edit Your Information',
      'ar': 'تعديل الملف الشخصي',
    },
    'jvwawv8x': {
      'en': 'User Profile',
      'ar': 'الملف الشخصي',
    },
  },
  // Miscellaneous
  {
    '2qu6a2f0': {
      'en': '',
      'ar': '',
    },
    'nid9bd3c': {
      'en': '',
      'ar': '',
    },
    'rw41lpwq': {
      'en': '',
      'ar': '',
    },
    '2uevd8xb': {
      'en': '',
      'ar': '',
    },
    '3nxne0b3': {
      'en': '',
      'ar': '',
    },
    '5ogop8uv': {
      'en': '',
      'ar': '',
    },
    'gi4rr1eq': {
      'en': '',
      'ar': '',
    },
    '9lbpveng': {
      'en': '',
      'ar': '',
    },
    'eczxq70x': {
      'en': '',
      'ar': '',
    },
    '4b1zw1st': {
      'en': '',
      'ar': '',
    },
    'qkp65h6v': {
      'en': '',
      'ar': '',
    },
    '4ujiiltb': {
      'en': '',
      'ar': '',
    },
    '9gli4b0z': {
      'en': '',
      'ar': '',
    },
    'kp30fm5t': {
      'en': '',
      'ar': '',
    },
    'avzznjdd': {
      'en': '',
      'ar': '',
    },
    'rwidosmq': {
      'en': '',
      'ar': '',
    },
    'h6lty0ne': {
      'en': '',
      'ar': '',
    },
    'zklpda5j': {
      'en': '',
      'ar': '',
    },
    'k6dqjxhm': {
      'en': '',
      'ar': '',
    },
    '0h0u6osw': {
      'en': '',
      'ar': '',
    },
    '7k4dfwzv': {
      'en': '',
      'ar': '',
    },
    '984ei9w8': {
      'en': '',
      'ar': '',
    },
    'q71jyrx2': {
      'en': '',
      'ar': '',
    },
    'o3x46xbm': {
      'en': '',
      'ar': '',
    },
    'zec9u3l2': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
