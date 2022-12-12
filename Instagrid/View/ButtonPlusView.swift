//
//  ButtonPlusView.swift
//  Instagrid
//
//  Created by Lilian Grasset on 24/11/2022.
//

import UIKit

class ButtonPlusView: UIButton {

    private func setStyle() {
        setImage(UIImage(named: "Plus")!, for: .normal)
        backgroundColor = .white
    }

    convenience init() {
        self.init(type: .custom)
        setStyle()
    }

}
