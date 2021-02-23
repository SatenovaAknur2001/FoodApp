//
//  CustomTextField.swift
//  FoodApp
//
//  Created by Акнур on 2/23/21.
//  Copyright © 2021 Aknur. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    @discardableResult
    func customButton(setTitle: String, setTitleState: UIControl.State, color: UIColor, background: UIColor, radius: CGFloat, enableButton: Bool) -> UIButton {
        self.setTitle(setTitle, for: setTitleState)
        self.setTitleColor(color, for: setTitleState)
        self.backgroundColor = background
        self.layer.cornerRadius = radius
        self.isEnabled = enableButton
        return UIButton()
    }
}
class CustomTextField: UITextField {
    let padding : CGFloat
    init(padding : CGFloat) {
        self.padding = padding
        super.init(frame : .zero)
        layer.cornerRadius = 25
        textAlignment = .center
        UIFont.boldSystemFont(ofSize: 15)
        backgroundColor = .white
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding, dy: 0)
        
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding, dy: 0)
    }
    
    override var intrinsicContentSize: CGSize {
        return .init(width: 0, height: 50)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @discardableResult
    func customTextField(textColor: UIColor,placeholder: String,font: String,fontSize: CGFloat,textAlignment: NSTextAlignment,backgroundColor: UIColor,isSecureTextEntry: Bool,typeStyle: UIKeyboardType) -> UITextField {
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.placeholder = placeholder
        self.font = UIFont(name: font, size: fontSize)
        self.backgroundColor = backgroundColor
        self.isSecureTextEntry = isSecureTextEntry
        self.keyboardType = typeStyle
        return UITextField()
    }

}
extension UIView {
    func customeTabBar(masks: Bool, opacity: Float, shadowColor: UIColor, shadowRadius: CGFloat, colors: UIColor, rd: CGFloat, maskedCorners: CACornerMask, clipsBounds: Bool, offset: CGSize){
        self.layer.masksToBounds = masks
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowRadius = shadowRadius
        self.backgroundColor = colors
        self.layer.cornerRadius = rd
        self.layer.maskedCorners = maskedCorners
        self.clipsToBounds = clipsBounds
    }
}
