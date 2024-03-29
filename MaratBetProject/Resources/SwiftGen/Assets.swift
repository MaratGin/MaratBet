// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let accentColor = ColorAsset(name: "AccentColor")
  internal static let argentina = ImageAsset(name: "Argentina")
  internal static let brasil = ImageAsset(name: "Brasil")
  internal static let bundesliga = ImageAsset(name: "Bundesliga")
  internal static let epl = ImageAsset(name: "EPL")
  internal static let eredivisi = ImageAsset(name: "Eredivisi")
  internal static let fnl = ImageAsset(name: "FNL")
  internal static let getBack = ImageAsset(name: "GetBack")
  internal static let hazard = ImageAsset(name: "Hazard")
  internal static let image = ImageAsset(name: "Image")
  internal static let laLiga = ImageAsset(name: "LaLiga")
  internal static let ligue1 = ImageAsset(name: "Ligue1")
  internal static let morocco = ImageAsset(name: "Morocco")
  internal static let neymar = ImageAsset(name: "Neymar")
  internal static let nigeria = ImageAsset(name: "Nigeria")
  internal static let pique = ImageAsset(name: "Pique")
  internal static let portugal = ImageAsset(name: "Portugal")
  internal static let rpl = ImageAsset(name: "RPL")
  internal static let seriaA = ImageAsset(name: "SeriaA")
  internal static let antenna = SymbolAsset(name: "antenna")
  internal static let arrow = SymbolAsset(name: "arrow")
  internal static let balanceIcon = ImageAsset(name: "balanceIcon")
  internal static let basketball = ImageAsset(name: "basketball")
  internal static let bitcoinsignCircle = SymbolAsset(name: "bitcoinsign.circle")
  internal static let chart = SymbolAsset(name: "chart")
  internal static let checkmark = ImageAsset(name: "checkmark")
  internal static let crossmark = ImageAsset(name: "crossmark")
  internal static let envelope = SymbolAsset(name: "envelope")
  internal static let flame = SymbolAsset(name: "flame")
  internal static let football = ImageAsset(name: "football")
  internal static let footballqq = ImageAsset(name: "footballqq")
  internal static let friendsIcon = ImageAsset(name: "friendsIcon")
  internal static let hockeyFly = ImageAsset(name: "hockey-fly")
  internal static let hockey = ImageAsset(name: "hockey")
  internal static let hockeyMAn = ImageAsset(name: "hockeyMAn")
  internal static let hockeyq = ImageAsset(name: "hockeyq")
  internal static let homeIcon = ImageAsset(name: "homeIcon")
  internal static let house = SymbolAsset(name: "house")
  internal static let key = SymbolAsset(name: "key")
  internal static let leave = SymbolAsset(name: "leave")
  internal static let lightbulbFill = SymbolAsset(name: "lightbulb.fill")
  internal static let lock = ImageAsset(name: "lock")
  internal static let mail = ImageAsset(name: "mail")
  internal static let person2 = SymbolAsset(name: "person.2")
  internal static let person = SymbolAsset(name: "person")
  internal static let profileIcon = ImageAsset(name: "profileIcon")
  internal static let qrcode = SymbolAsset(name: "qrcode")
  internal static let refresh = SymbolAsset(name: "refresh")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct SymbolAsset {
  internal fileprivate(set) var name: String

  #if os(iOS) || os(tvOS) || os(watchOS)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
  internal typealias Configuration = UIImage.SymbolConfiguration
  internal typealias Image = UIImage

  @available(iOS 12.0, tvOS 12.0, watchOS 5.0, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load symbol asset named \(name).")
    }
    return result
  }

  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
  internal func image(with configuration: Configuration) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, with: configuration) else {
      fatalError("Unable to load symbol asset named \(name).")
    }
    return result
  }
  #endif
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
