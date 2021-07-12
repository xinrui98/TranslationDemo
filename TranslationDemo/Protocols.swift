//
//  Protocols.swift
//  TranslationDemo
//
//  Created by Xinrui gao on 9/7/21.
//

import Foundation
import UIKit

//protocols of localization or changing lanaguage
protocol Localizable {
    var localized: String { get }
}
protocol XIBLocalizable {
    var xibLocKey: String? { get set }
}

//to change the texts according to selected lanaguge
extension String: Localizable {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
//To check the current selected language by user and show that languge to user
extension String {
    func localizedString() -> String {
        let loc = UserDefaults.standard.string(forKey: "locale") ?? "en"
        guard let bundlePath = Bundle.main.path(forResource: loc, ofType: "lproj"), let bundle = Bundle(path: bundlePath) else {
            return NSLocalizedString(self, comment: "")
        }
        //NSLocalizedString(key, comment) only reads Localizable.strings file by default. For additional details, the tableName captures the name of the strings file you created, the bundle is the bundle containing the strings file, the value is the string you want to be displayed in case a wrong key was provided, and the comment is used to provide additional context to the translators.
        return NSLocalizedString(self, tableName: nil, bundle: bundle, comment: "")
    }
}
//To show the inspect propety of UI Label on storyboard
extension UILabel: XIBLocalizable {
    @IBInspectable var xibLocKey: String? {
        get { return nil }
        set(key) {
            text = key?.localizedString()
        }
    }
}
//To show the inspect propety of UI button on storyboard
extension UIButton: XIBLocalizable {
    @IBInspectable var xibLocKey: String? {
        get { return nil }
        set(key) {
            setTitle(key?.localizedString(), for: .normal)
        }
    }
}
