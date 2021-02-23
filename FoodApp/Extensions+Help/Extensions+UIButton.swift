//
//  Extensions+UIButton.swift
//  FoodApp
//
//  Created by Акнур on 2/23/21.
//  Copyright © 2021 Aknur. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func customButton(setTitle: String, setTitleState: UIControl.State, color: UIColor, background: UIColor, radius: CGFloat) -> UIButton {
        self.setTitle(setTitle, for: setTitleState)
        self.setTitleColor(color, for: setTitleState)
        self.backgroundColor = background
        self.layer.cornerRadius = radius
        return UIButton()
    }
}
