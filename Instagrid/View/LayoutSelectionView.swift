//
//  LayoutSelectionView.swift
//  Instagrid
//
//  Created by Lilian Grasset on 18/11/2022.
//

import UIKit

class LayoutSelectionView: UIView {

    @IBOutlet private var buttons: [UIButton]!

    @IBOutlet private var selector: UIImageView!

    enum Layout {
        case layout1, layout2, layout3
    }

    var currentLayout: Layout = .layout1 {
        didSet {
            updateSelector()
        }
    }

    private func updateSelector() {
        switch currentLayout {
        case .layout1:
            selector.frame.origin = buttons[0].frame.origin
        case .layout2:
            selector.frame.origin = buttons[1].frame.origin
        case .layout3:
            selector.frame.origin = buttons[2].frame.origin
        }
    }

    public func changeLayout(_ sender: UIButton) {

        for (index, button) in buttons.enumerated() where button == sender {
            switch index {
            case 0:
                currentLayout = .layout1
            case 1:
                currentLayout = .layout2
            case 2:
                currentLayout = .layout3
            default:
                currentLayout = .layout2
            }
        }
    }

}
