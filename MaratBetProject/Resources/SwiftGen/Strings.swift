// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
    static let signIn = L10n.tr("Localizable", "signIn!")
    static let signUp = L10n.tr("Localizable", "signUp!")
    static let enterEmail = L10n.tr("Localizable", "enter e-mail")
    static let enterLogin = L10n.tr("Localizable", "enter login")
    static let enterPassword = L10n.tr("Localizable", "enter password")
    static let enterRepassword = L10n.tr("Localizable", "enter password again")
    static let emptyData = L10n.tr("Localizable", "Incorrect data 🥺")
    static let incorrectLogin = L10n.tr("Localizable", "Incorrect Login. /n Only latin symblos and numbers allowed 🔴")
    static let incorrectEmail = L10n.tr("Localizable", "Incorrect e-mail 🔴")
    static let incorrectRepassword = L10n.tr("Localizable", "Enter passwords again 🔴")
    static let correctRegistration = L10n.tr("Localizable", "Registered! 🥰")
    static let incorrectLength = L10n.tr("Localizable", "Wrong length 😱")
    static let incorrectPassword = L10n.tr("Localizable", "Incorrect Password. /n Only latin symblos and numbers allowed 🔴")
    static let successLogin = L10n.tr("Localizable", "Succesful! 🥰")
    static let networkFali = L10n.tr("Localizable", "Network failure. Enter again")
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
