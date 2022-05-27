// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Полная линия
  internal static let allOdds = L10n.tr("Localizable", "All odds")
  /// Лига Аргентины
  internal static let argentinaLeague = L10n.tr("Localizable", "Argentina League")
  /// Баланс
  internal static let balance = L10n.tr("Localizable", "Balance")
  /// История ставок
  internal static let betsHistory = L10n.tr("Localizable", "Bets history")
  /// Лига Бразилии
  internal static let brazilLeague = L10n.tr("Localizable", "Brazil league")
  /// Бундеслига
  internal static let bundesliga = L10n.tr("Localizable", "Bundesliga")
  /// Введите email
  internal static let enterEMail = L10n.tr("Localizable", "enter e-mail")
  /// Введите логин
  internal static let enterLogin = L10n.tr("Localizable", "enter login")
  /// Введите пароль
  internal static let enterPassword = L10n.tr("Localizable", "enter password")
  /// Повторите пароль
  internal static let enterPasswordAgain = L10n.tr("Localizable", "enter password again")
  /// Введите пароли заново! 🔴
  internal static let enterPasswordsAgain🔴 = L10n.tr("Localizable", "Enter passwords again 🔴")
  /// Эредивизи
  internal static let eredivisi = L10n.tr("Localizable", "Eredivisi")
  /// Событий/я: 
  internal static let eventS = L10n.tr("Localizable", "Event/s: ")
  /// Ошибка
  internal static let failure = L10n.tr("Localizable", "Failure")
  /// ФНЛ
  internal static let fnl = L10n.tr("Localizable", "FNL")
  /// Некоррктная сумма ставки!
  internal static let incorrectBetValue = L10n.tr("Localizable", "Incorrect bet value!")
  /// Некорректные данные 🥺
  internal static let incorrectData🥺 = L10n.tr("Localizable", "Incorrect data 🥺")
  /// Некорректно введена почта! 🔴
  internal static let incorrectEMail🔴 = L10n.tr("Localizable", "Incorrect e-mail 🔴")
  /// Некорректный логин!
  internal static let incorrectLogin = L10n.tr("Localizable", "incorrect login!")
  ///  Ла лига
  internal static let laLiga = L10n.tr("Localizable", "La liga")
  ///  Лига 1
  internal static let ligue1 = L10n.tr("Localizable", "Ligue 1")
  /// Матчи
  internal static let matches = L10n.tr("Localizable", "Matches")
  /// Лига Португалии
  internal static let portugalLeague = L10n.tr("Localizable", "Portugal league")
  /// Премьер Лига
  internal static let premierLeague = L10n.tr("Localizable", "Premier league")
  /// Зарегестрирован! 🥰
  internal static let registered🥰 = L10n.tr("Localizable", "Registered! 🥰")
  /// РПЛ
  internal static let rpl = L10n.tr("Localizable", "RPL")
  /// Серия А
  internal static let seriaA = L10n.tr("Localizable", "Seria A")
  /// Войти!
  internal static let signIn = L10n.tr("Localizable", "signIn!")
  /// Зарегистрироваться!
  internal static let signUp = L10n.tr("Localizable", "signUp!")
  /// Успешно!🥰
  internal static let succesful🥰 = L10n.tr("Localizable", "Succesful! 🥰")
  /// Такой логин уже существует!
  internal static let thisLoginIsAlreadyExists = L10n.tr("Localizable", "this login is already exists!")
  /// Недопустимая длина 😱
  internal static let wrongLength😱 = L10n.tr("Localizable", "Wrong length 😱")
  /// Ваша ставка подтверждена!
  internal static let yourBetHasBeenPlaced = L10n.tr("Localizable", "Your bet has been placed")

  internal enum IncorrectLogin {
    /// Некорретно введен логин, допускаются латинские буквы и цифры 🔴
    internal static let nOnlyLatinSymblosAndNumbersAllowed🔴 = L10n.tr("Localizable", "Incorrect Login. /n Only latin symblos and numbers allowed 🔴")
  }

  internal enum IncorrectPassword {
    /// Некорретно введен пароль, допускаются латинские буквы и цифры 🔴
    internal static let nOnlyLatinSymblosAndNumbersAllowed🔴 = L10n.tr("Localizable", "Incorrect Password. /n Only latin symblos and numbers allowed 🔴")
  }

  internal enum NetworkFailure {
    /// Ошибка соединения.. повториите вход🙁
    internal static let enterAgain = L10n.tr("Localizable", "Network failure. Enter again")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
