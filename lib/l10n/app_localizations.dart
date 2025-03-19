import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Path of Healing'**
  String get appTitle;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @treatments.
  ///
  /// In en, this message translates to:
  /// **'Treatments'**
  String get treatments;

  /// No description provided for @centers.
  ///
  /// In en, this message translates to:
  /// **'Centers'**
  String get centers;

  /// No description provided for @appointments.
  ///
  /// In en, this message translates to:
  /// **'Appointments'**
  String get appointments;

  /// No description provided for @products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get products;

  /// No description provided for @activeAppointments.
  ///
  /// In en, this message translates to:
  /// **'Active Appointments'**
  String get activeAppointments;

  /// No description provided for @pastAppointments.
  ///
  /// In en, this message translates to:
  /// **'Past Appointments'**
  String get pastAppointments;

  /// No description provided for @makeAppointment.
  ///
  /// In en, this message translates to:
  /// **'Make Appointment'**
  String get makeAppointment;

  /// No description provided for @appointmentDate.
  ///
  /// In en, this message translates to:
  /// **'Appointment Date'**
  String get appointmentDate;

  /// No description provided for @appointmentTime.
  ///
  /// In en, this message translates to:
  /// **'Appointment Time'**
  String get appointmentTime;

  /// No description provided for @appointmentStatus.
  ///
  /// In en, this message translates to:
  /// **'Appointment Status'**
  String get appointmentStatus;

  /// No description provided for @confirmed.
  ///
  /// In en, this message translates to:
  /// **'Confirmed'**
  String get confirmed;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @cancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelled;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @leechTherapy.
  ///
  /// In en, this message translates to:
  /// **'Leech Therapy'**
  String get leechTherapy;

  /// No description provided for @cupping.
  ///
  /// In en, this message translates to:
  /// **'Cupping'**
  String get cupping;

  /// No description provided for @acupuncture.
  ///
  /// In en, this message translates to:
  /// **'Acupuncture'**
  String get acupuncture;

  /// No description provided for @mesotherapy.
  ///
  /// In en, this message translates to:
  /// **'Mesotherapy'**
  String get mesotherapy;

  /// No description provided for @leechTherapyDesc.
  ///
  /// In en, this message translates to:
  /// **'Leech therapy is an alternative medicine treatment that involves placing leeches on specific parts of the body to suck blood. It is used to treat various conditions including cardiovascular diseases, arthritis, and skin problems.'**
  String get leechTherapyDesc;

  /// No description provided for @cuppingDesc.
  ///
  /// In en, this message translates to:
  /// **'Cupping therapy is an ancient form of alternative medicine where a therapist puts special cups on your skin for a few minutes to create suction. People get it for many purposes, including to help with pain, inflammation, blood flow.'**
  String get cuppingDesc;

  /// No description provided for @acupunctureDesc.
  ///
  /// In en, this message translates to:
  /// **'Pain and stress are reduced by stimulating certain points of the body with thin needles. It contributes positively to general health by balancing the nervous system.'**
  String get acupunctureDesc;

  /// No description provided for @mesotherapyDesc.
  ///
  /// In en, this message translates to:
  /// **'This method, which is applied by injecting vitamins, minerals and various drug mixtures under the skin, is generally preferred in skin renewal, cellulite and hair loss treatment.'**
  String get mesotherapyDesc;

  /// No description provided for @arganOil.
  ///
  /// In en, this message translates to:
  /// **'Argan Oil'**
  String get arganOil;

  /// No description provided for @arganOilDesc.
  ///
  /// In en, this message translates to:
  /// **'Natural argan oil for hair and skin care'**
  String get arganOilDesc;

  /// No description provided for @almondOil.
  ///
  /// In en, this message translates to:
  /// **'Almond Oil'**
  String get almondOil;

  /// No description provided for @almondOilDesc.
  ///
  /// In en, this message translates to:
  /// **'Natural almond oil that nourishes and moisturizes the skin'**
  String get almondOilDesc;

  /// No description provided for @vitaminC.
  ///
  /// In en, this message translates to:
  /// **'Vitamin C'**
  String get vitaminC;

  /// No description provided for @vitaminCDesc.
  ///
  /// In en, this message translates to:
  /// **'Vitamin C supplement that strengthens the immune system'**
  String get vitaminCDesc;

  /// No description provided for @roseWater.
  ///
  /// In en, this message translates to:
  /// **'Rose Water'**
  String get roseWater;

  /// No description provided for @roseWaterDesc.
  ///
  /// In en, this message translates to:
  /// **'Natural rose water that revitalizes and refreshes the skin'**
  String get roseWaterDesc;

  /// No description provided for @vitaminECream.
  ///
  /// In en, this message translates to:
  /// **'Vitamin E Cream'**
  String get vitaminECream;

  /// No description provided for @vitaminECreamDesc.
  ///
  /// In en, this message translates to:
  /// **'Nourishing and renewing vitamin E care cream'**
  String get vitaminECreamDesc;

  /// No description provided for @lavenderOil.
  ///
  /// In en, this message translates to:
  /// **'Lavender Oil'**
  String get lavenderOil;

  /// No description provided for @lavenderOilDesc.
  ///
  /// In en, this message translates to:
  /// **'Relaxing and soothing natural lavender oil'**
  String get lavenderOilDesc;

  /// No description provided for @aloeVeraCream.
  ///
  /// In en, this message translates to:
  /// **'Aloe Vera Cream'**
  String get aloeVeraCream;

  /// No description provided for @aloeVeraCreamDesc.
  ///
  /// In en, this message translates to:
  /// **'Moisturizing and soothing aloe vera cream'**
  String get aloeVeraCreamDesc;

  /// No description provided for @saltSoap.
  ///
  /// In en, this message translates to:
  /// **'Salt Soap'**
  String get saltSoap;

  /// No description provided for @saltSoapDesc.
  ///
  /// In en, this message translates to:
  /// **'Natural Himalayan salt soap that purifies the skin'**
  String get saltSoapDesc;

  /// No description provided for @addToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart'**
  String get addToCart;

  /// No description provided for @doctor.
  ///
  /// In en, this message translates to:
  /// **'Doctor:'**
  String get doctor;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date:'**
  String get date;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time:'**
  String get time;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @map.
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get map;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPassword;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @surname.
  ///
  /// In en, this message translates to:
  /// **'Surname'**
  String get surname;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @invalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password!'**
  String get invalidCredentials;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address'**
  String get invalidEmail;

  /// No description provided for @invalidPassword.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get invalidPassword;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get welcomeBack;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get services;

  /// No description provided for @learnMore.
  ///
  /// In en, this message translates to:
  /// **'Learn More'**
  String get learnMore;

  /// No description provided for @popularTreatments.
  ///
  /// In en, this message translates to:
  /// **'Popular Treatments'**
  String get popularTreatments;

  /// No description provided for @traditionalMedicine.
  ///
  /// In en, this message translates to:
  /// **'Traditional and Complementary Medicine Applications'**
  String get traditionalMedicine;

  /// No description provided for @call.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get call;

  /// No description provided for @directions.
  ///
  /// In en, this message translates to:
  /// **'Get Directions'**
  String get directions;

  /// No description provided for @errorLoadingMap.
  ///
  /// In en, this message translates to:
  /// **'Error loading map'**
  String get errorLoadingMap;

  /// No description provided for @backToLogin.
  ///
  /// In en, this message translates to:
  /// **'Back to Login'**
  String get backToLogin;

  /// No description provided for @comment.
  ///
  /// In en, this message translates to:
  /// **'Comment'**
  String get comment;

  /// No description provided for @enterComment.
  ///
  /// In en, this message translates to:
  /// **'Write your comment...'**
  String get enterComment;

  /// No description provided for @nearbyPlaces.
  ///
  /// In en, this message translates to:
  /// **'Nearby Places'**
  String get nearbyPlaces;

  /// No description provided for @culturalPlaces.
  ///
  /// In en, this message translates to:
  /// **'Cultural Places'**
  String get culturalPlaces;

  /// No description provided for @historicalPlaces.
  ///
  /// In en, this message translates to:
  /// **'Historical Places'**
  String get historicalPlaces;

  /// No description provided for @naturalPlaces.
  ///
  /// In en, this message translates to:
  /// **'Natural Places'**
  String get naturalPlaces;

  /// No description provided for @restaurants.
  ///
  /// In en, this message translates to:
  /// **'Restaurants'**
  String get restaurants;

  /// No description provided for @cafes.
  ///
  /// In en, this message translates to:
  /// **'Cafes and Patisseries'**
  String get cafes;

  /// Distance to a place
  ///
  /// In en, this message translates to:
  /// **'{distance} km away'**
  String distance(Object distance);

  /// No description provided for @selectCenter.
  ///
  /// In en, this message translates to:
  /// **'Select Center'**
  String get selectCenter;

  /// Selected medical center name
  ///
  /// In en, this message translates to:
  /// **'Selected Center: {name}'**
  String selectedCenter(String name);

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @prp.
  ///
  /// In en, this message translates to:
  /// **'PRP'**
  String get prp;

  /// No description provided for @kupaTerapi.
  ///
  /// In en, this message translates to:
  /// **'Cupping Therapy'**
  String get kupaTerapi;

  /// No description provided for @sulukTedavisi.
  ///
  /// In en, this message translates to:
  /// **'Leech Therapy'**
  String get sulukTedavisi;

  /// No description provided for @fitoterapi.
  ///
  /// In en, this message translates to:
  /// **'Phytotherapy'**
  String get fitoterapi;

  /// No description provided for @kayropraktik.
  ///
  /// In en, this message translates to:
  /// **'Chiropractic'**
  String get kayropraktik;

  /// No description provided for @biyorezonans.
  ///
  /// In en, this message translates to:
  /// **'Bioresonance'**
  String get biyorezonans;

  /// No description provided for @apiterapi.
  ///
  /// In en, this message translates to:
  /// **'Apitherapy'**
  String get apiterapi;

  /// No description provided for @hirudoterapi.
  ///
  /// In en, this message translates to:
  /// **'Hirudotherapy'**
  String get hirudoterapi;

  /// No description provided for @homeopati.
  ///
  /// In en, this message translates to:
  /// **'Homeopathy'**
  String get homeopati;

  /// No description provided for @proloterapi.
  ///
  /// In en, this message translates to:
  /// **'Prolotherapy'**
  String get proloterapi;

  /// No description provided for @healAndExplore.
  ///
  /// In en, this message translates to:
  /// **'Heal and Explore'**
  String get healAndExplore;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'tr': return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
