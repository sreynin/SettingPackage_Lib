//
//  File.swift
//  
//
//  Created by SREININ on 21/9/23.
//

import Foundation
import UIKit

public struct WCFont {
    public  func easyFont(fontName: String, size: CGFloat) -> UIFont {
        
          func getDynamicFontsize(defualtSize: CGFloat) -> CGFloat {
            switch UIDevice().type {
            case .iPhoneSE, .iPhone5, .iPhone5S, .iPhone5C: return defualtSize
            case .iPhone6, .iPhone6S, .iPhone7, .iPhone8: return (defualtSize + 2)
            case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus: return (defualtSize + 2)
            case .iPhoneX, .iPhoneXR, .iPhoneXS, .iPhoneXSMax: return (defualtSize + 3)
            default: return (defualtSize + 4)
            }
        }
        
        let dynamicSize = getDynamicFontsize(defualtSize: size)
        return UIFont(name: fontName, size: dynamicSize) ?? UIFont.systemFont(ofSize: dynamicSize)
    }
}

public class UILabelDynamicSizeClass: UILabel {

    override public func awakeFromNib() {
        super.awakeFromNib()
        switch UIDevice().type {
        case .iPhoneSE, .iPhone5, .iPhone5S, .iPhone5C:
            self.font = self.font.withSize(self.font.pointSize - 0.8)
        case .iPhone6, .iPhone6S, .iPhone7, .iPhone8:
            self.font = self.font.withSize(self.font.pointSize + 0.8)
        case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus:
            self.font = self.font.withSize(self.font.pointSize + 1.2)
        case .iPhoneX, .iPhoneXR, .iPhoneXS, .iPhoneXSMax:
            self.font = self.font.withSize(self.font.pointSize + 1.5)
        default:
            self.font = self.font.withSize(self.font.pointSize + 2)
        }
    }
    
    public func overrideFontSize(fontSize:CGFloat){
        switch UIDevice().type {
        case .iPhoneSE, .iPhone5, .iPhone5S, .iPhone5C:
            self.font = self.font.withSize(self.font.pointSize - 0.8)
        case .iPhone6, .iPhone6S, .iPhone7, .iPhone8:
            self.font = self.font.withSize(self.font.pointSize + 0.8)
        case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus:
            self.font = self.font.withSize(self.font.pointSize + 1.2)
        case .iPhoneX, .iPhoneXR, .iPhoneXS, .iPhoneXSMax:
            self.font = self.font.withSize(self.font.pointSize + 1.5)
        default:
            self.font = self.font.withSize(self.font.pointSize + 2)
        }
    }
}

//for textfield
public class UITextFieldDynamicSizeClass: UITextField {
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        guard let pointSize = self.font?.pointSize else { return }
        switch UIDevice().type {
        case .iPhoneSE, .iPhone5, .iPhone5S, .iPhone5C:
            self.font = self.font?.withSize(pointSize - 0.8)
        case .iPhone6, .iPhone6S, .iPhone7, .iPhone8:
            self.font = self.font?.withSize(pointSize + 0.8)
        case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus:
            self.font = self.font?.withSize(pointSize + 1.2)
        case .iPhoneX, .iPhoneXR, .iPhoneXS, .iPhoneXSMax:
            self.font = self.font?.withSize(pointSize + 1.5)
        default:
            self.font = self.font?.withSize(pointSize + 2)
        }
    }
}

//for button
public class UIButtonDynamicSizeClass: UIButton {
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        guard let pointSize = self.titleLabel?.font.pointSize else { return }
        switch UIDevice().type {
        case .iPhoneSE, .iPhone5, .iPhone5S, .iPhone5C:
            self.titleLabel?.font = self.titleLabel?.font.withSize(pointSize - 0.8)
        case .iPhone6, .iPhone6S, .iPhone7, .iPhone8:
            self.titleLabel?.font = self.titleLabel?.font.withSize(pointSize + 0.8)
        case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus:
            self.titleLabel?.font = self.titleLabel?.font.withSize(pointSize + 1.2)
        case .iPhoneX, .iPhoneXR, .iPhoneXS, .iPhoneXSMax:
            self.titleLabel?.font = self.titleLabel?.font.withSize(pointSize + 1.5)
        default:
            self.titleLabel?.font = self.titleLabel?.font.withSize(pointSize + 2)
        }
    }
}

// for textView
public class UITextViewDynamicSizeClass: UITextView {
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        guard let pointSize = self.font?.pointSize else { return }
        switch UIDevice().type {
        case .iPhoneSE, .iPhone5, .iPhone5S, .iPhone5C:
            self.font = self.font?.withSize(pointSize - 0.8)
        case .iPhone6, .iPhone6S, .iPhone7, .iPhone8:
            self.font = self.font?.withSize(pointSize + 0.8)
        case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus:
            self.font = self.font?.withSize(pointSize + 1.2)
        case .iPhoneX, .iPhoneXR, .iPhoneXS, .iPhoneXSMax:
            self.font = self.font?.withSize(pointSize + 1.5)
        default:
            self.font = self.font?.withSize(pointSize + 2)
        }
    }
}

extension UITextViewDynamicSizeClass : UITextViewDelegate {
    
    /// Resize the placeholder when the UITextView bounds change
    override open var bounds: CGRect {
        didSet {
            self.textContainerInset = UIEdgeInsets ( top: 12 , left: 15 , bottom: 12 , right: 15 )
            self.resizePlaceholder()
        }
    }
    
    /// The UITextView placeholder text
    public var placeholder: String? {
        get {
            var placeholderText: String?
            
            if let placeholderLabel = self.viewWithTag(100) as? UILabel {
                placeholderText = placeholderLabel.text
            }
            
            return placeholderText
        }
        set {
            if let placeholderLabel = self.viewWithTag(100) as! UILabel? {
                placeholderLabel.text = newValue
                placeholderLabel.sizeToFit()
            } else {
                self.addPlaceholder(newValue!)
            }
        }
    }
    
    /// When the UITextView did change, show or hide the label based on if the UITextView is empty or not
    ///
    /// - Parameter textView: The UITextView that got updated
    public func textViewDidChange(_ textView: UITextView) {
        if let placeholderLabel = self.viewWithTag(100) as? UILabel {
            placeholderLabel.isHidden = self.text.count > 0
        }
    }
    // retrict only 100 characters
    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        return newText.count <= 100
    }
    
    /// Resize the placeholder UILabel to make sure it's in the same position as the UITextView text
    private func resizePlaceholder() {
        if let placeholderLabel = self.viewWithTag(100) as! UILabel? {
            //let labelX = self.textContainer.lineFragmentPadding
            let labelX: CGFloat = self.textContainerInset.left + 5
            //let labelY = self.textContainerInset.top - 2
            let labelY: CGFloat = self.textContainerInset.top
            let labelWidth = self.frame.width - (labelX * 2)
            let labelHeight = placeholderLabel.frame.height
            
            placeholderLabel.frame = CGRect(x: labelX, y: labelY, width: labelWidth, height: labelHeight)
        }
    }
    
    /// Adds a placeholder UILabel to this UITextView
    private func addPlaceholder(_ placeholderText: String) {
        let placeholderLabel = UILabel()
        
        placeholderLabel.text = placeholderText
        placeholderLabel.sizeToFit()
        
        placeholderLabel.font = self.font
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.tag = 100
        
        placeholderLabel.isHidden = self.text.count > 0
        
        self.addSubview(placeholderLabel)
        self.resizePlaceholder()
        self.delegate = self
    }
    
}

public class DynamicLabelSizeClass: UILabel {
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        switch UIDevice().type {
        case .iPhoneSE, .iPhone5, .iPhone5S, .iPhone5C:
            self.font = self.font.withSize(self.font.pointSize)
        case .iPhone6, .iPhone6S, .iPhone7, .iPhone8:
            self.font = self.font.withSize(self.font.pointSize + 2)
        case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus:
            self.font = self.font.withSize(self.font.pointSize + 2)
        case .iPhoneX, .iPhoneXR, .iPhoneXS, .iPhoneXSMax:
            self.font = self.font.withSize(self.font.pointSize + 3)
        default:
            self.font = self.font.withSize(self.font.pointSize + 4)
        }
    }
}

public class DynamicButtonSizeClass: UIButton {
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        guard let pointSize = self.titleLabel?.font.pointSize else { return }
        switch UIDevice().type {
        case .iPhoneSE, .iPhone5, .iPhone5S, .iPhone5C:
            self.titleLabel?.font = self.titleLabel?.font.withSize(pointSize)
        case .iPhone6, .iPhone6S, .iPhone7, .iPhone8:
            self.titleLabel?.font = self.titleLabel?.font.withSize(pointSize + 2)
        case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus:
            self.titleLabel?.font = self.titleLabel?.font.withSize(pointSize + 2)
        case .iPhoneX, .iPhoneXR, .iPhoneXS, .iPhoneXSMax:
            self.titleLabel?.font = self.titleLabel?.font.withSize(pointSize + 3)
        default:
            self.titleLabel?.font = self.titleLabel?.font.withSize(pointSize + 4)
        }
    }
}

