//
//  ButtonPlusView.swift
//  Instagrid
//
//  Created by Lilian Grasset on 24/11/2022.
//

import UIKit

class ButtonPlusView: UIButton {

    enum Style {
        case small, large
    }

    public var style: Style = .small {
        didSet {
            setStyle(style)
        }
    }

    private func setStyle(_ style: Style) {

        setImage(UIImage(named: "Plus")!, for: .normal)
        backgroundColor = .white
    }

    convenience init(style: Style) {
        self.init(type: .custom)
        setStyle(style)
    }

}
