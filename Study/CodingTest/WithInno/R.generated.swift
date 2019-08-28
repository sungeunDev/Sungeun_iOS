//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try font.validate()
    try intern.validate()
  }
  
  /// This `R.font` struct is generated, and contains static references to 3 fonts.
  struct font: Rswift.Validatable {
    /// Font `JalnanOTF`.
    static let jalnanOTF = Rswift.FontResource(fontName: "JalnanOTF")
    /// Font `NotoSansCJKkr-Bold`.
    static let notoSansCJKkrBold = Rswift.FontResource(fontName: "NotoSansCJKkr-Bold")
    /// Font `NotoSansCJKkr-Regular`.
    static let notoSansCJKkrRegular = Rswift.FontResource(fontName: "NotoSansCJKkr-Regular")
    
    /// `UIFont(name: "JalnanOTF", size: ...)`
    static func jalnanOTF(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: jalnanOTF, size: size)
    }
    
    /// `UIFont(name: "NotoSansCJKkr-Bold", size: ...)`
    static func notoSansCJKkrBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: notoSansCJKkrBold, size: size)
    }
    
    /// `UIFont(name: "NotoSansCJKkr-Regular", size: ...)`
    static func notoSansCJKkrRegular(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: notoSansCJKkrRegular, size: size)
    }
    
    static func validate() throws {
      if R.font.jalnanOTF(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'JalnanOTF' could not be loaded, is 'JalnanOTF.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.notoSansCJKkrBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'NotoSansCJKkr-Bold' could not be loaded, is 'NotoSansCJKkr-Bold.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.notoSansCJKkrRegular(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'NotoSansCJKkr-Regular' could not be loaded, is 'NotoSansCJKkr-Regular.otf' added to the UIAppFonts array in this targets Info.plist?") }
    }
    
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 8 images.
  struct image {
    /// Image `icon-arrowLeft`.
    static let iconArrowLeft = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon-arrowLeft")
    /// Image `icon-arrowRight`.
    static let iconArrowRight = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon-arrowRight")
    /// Image `icon-cancel`.
    static let iconCancel = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon-cancel")
    /// Image `icon-filter`.
    static let iconFilter = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon-filter")
    /// Image `icon-like`.
    static let iconLike = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon-like")
    /// Image `icon-star`.
    static let iconStar = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon-star")
    /// Image `tabbar-favorite`.
    static let tabbarFavorite = Rswift.ImageResource(bundle: R.hostingBundle, name: "tabbar-favorite")
    /// Image `tabbar-home`.
    static let tabbarHome = Rswift.ImageResource(bundle: R.hostingBundle, name: "tabbar-home")
    
    /// `UIImage(named: "icon-arrowLeft", bundle: ..., traitCollection: ...)`
    static func iconArrowLeft(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.iconArrowLeft, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "icon-arrowRight", bundle: ..., traitCollection: ...)`
    static func iconArrowRight(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.iconArrowRight, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "icon-cancel", bundle: ..., traitCollection: ...)`
    static func iconCancel(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.iconCancel, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "icon-filter", bundle: ..., traitCollection: ...)`
    static func iconFilter(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.iconFilter, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "icon-like", bundle: ..., traitCollection: ...)`
    static func iconLike(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.iconLike, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "icon-star", bundle: ..., traitCollection: ...)`
    static func iconStar(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.iconStar, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "tabbar-favorite", bundle: ..., traitCollection: ...)`
    static func tabbarFavorite(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.tabbarFavorite, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "tabbar-home", bundle: ..., traitCollection: ...)`
    static func tabbarHome(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.tabbarHome, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 1 nibs.
  struct nib {
    /// Nib `ProductCell`.
    static let productCell = _R.nib._ProductCell()
    
    /// `UINib(name: "ProductCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.productCell) instead")
    static func productCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.productCell)
    }
    
    static func productCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> ProductCell? {
      return R.nib.productCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? ProductCell
    }
    
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 3 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `DetailInfoCell`.
    static let detailInfoCell: Rswift.ReuseIdentifier<DetailInfoCell> = Rswift.ReuseIdentifier(identifier: "DetailInfoCell")
    /// Reuse identifier `ImageCell`.
    static let imageCell: Rswift.ReuseIdentifier<ImageCell> = Rswift.ReuseIdentifier(identifier: "ImageCell")
    /// Reuse identifier `ProductCell`.
    static let productCell: Rswift.ReuseIdentifier<ProductCell> = Rswift.ReuseIdentifier(identifier: "ProductCell")
    
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 2 view controllers.
  struct segue {
    /// This struct is generated for `FavoritesViewController`, and contains static references to 2 segues.
    struct favoritesViewController {
      /// Segue identifier `goToDetailVC`.
      static let goToDetailVC: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, FavoritesViewController, DetailsViewController> = Rswift.StoryboardSegueIdentifier(identifier: "goToDetailVC")
      /// Segue identifier `goToSortingVC`.
      static let goToSortingVC: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, FavoritesViewController, SortingViewController> = Rswift.StoryboardSegueIdentifier(identifier: "goToSortingVC")
      
      /// Optionally returns a typed version of segue `goToDetailVC`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func goToDetailVC(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, FavoritesViewController, DetailsViewController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.favoritesViewController.goToDetailVC, segue: segue)
      }
      
      /// Optionally returns a typed version of segue `goToSortingVC`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func goToSortingVC(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, FavoritesViewController, SortingViewController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.favoritesViewController.goToSortingVC, segue: segue)
      }
      
      fileprivate init() {}
    }
    
    /// This struct is generated for `MainViewController`, and contains static references to 1 segues.
    struct mainViewController {
      /// Segue identifier `goToDetailVC`.
      static let goToDetailVC: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, MainViewController, DetailsViewController> = Rswift.StoryboardSegueIdentifier(identifier: "goToDetailVC")
      
      /// Optionally returns a typed version of segue `goToDetailVC`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func goToDetailVC(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, MainViewController, DetailsViewController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.mainViewController.goToDetailVC, segue: segue)
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
    try nib.validate()
  }
  
  struct nib: Rswift.Validatable {
    static func validate() throws {
      try _ProductCell.validate()
    }
    
    struct _ProductCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType, Rswift.Validatable {
      typealias ReusableType = ProductCell
      
      let bundle = R.hostingBundle
      let identifier = "ProductCell"
      let name = "ProductCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> ProductCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? ProductCell
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "icon-star", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'icon-star' is used in nib 'ProductCell', but couldn't be loaded.") }
        if #available(iOS 11.0, *) {
        }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try launchScreen.validate()
      try main.validate()
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      static func validate() throws {
        if #available(iOS 11.0, *) {
        }
      }
      
      fileprivate init() {}
    }
    
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UITabBarController
      
      let bundle = R.hostingBundle
      let detailsViewController = StoryboardViewControllerResource<DetailsViewController>(identifier: "DetailsViewController")
      let favoritesViewController = StoryboardViewControllerResource<FavoritesViewController>(identifier: "FavoritesViewController")
      let mainViewController = StoryboardViewControllerResource<MainViewController>(identifier: "MainViewController")
      let name = "Main"
      let sortingViewController = StoryboardViewControllerResource<SortingViewController>(identifier: "SortingViewController")
      
      func detailsViewController(_: Void = ()) -> DetailsViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: detailsViewController)
      }
      
      func favoritesViewController(_: Void = ()) -> FavoritesViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: favoritesViewController)
      }
      
      func mainViewController(_: Void = ()) -> MainViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: mainViewController)
      }
      
      func sortingViewController(_: Void = ()) -> SortingViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: sortingViewController)
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "icon-arrowLeft", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'icon-arrowLeft' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "icon-arrowRight", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'icon-arrowRight' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "icon-cancel", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'icon-cancel' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "icon-filter", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'icon-filter' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "icon-star", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'icon-star' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "tabbar-favorite", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'tabbar-favorite' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "tabbar-home", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'tabbar-home' is used in storyboard 'Main', but couldn't be loaded.") }
        if #available(iOS 11.0, *) {
        }
        if _R.storyboard.main().detailsViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'detailsViewController' could not be loaded from storyboard 'Main' as 'DetailsViewController'.") }
        if _R.storyboard.main().favoritesViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'favoritesViewController' could not be loaded from storyboard 'Main' as 'FavoritesViewController'.") }
        if _R.storyboard.main().mainViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'mainViewController' could not be loaded from storyboard 'Main' as 'MainViewController'.") }
        if _R.storyboard.main().sortingViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'sortingViewController' could not be loaded from storyboard 'Main' as 'SortingViewController'.") }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
