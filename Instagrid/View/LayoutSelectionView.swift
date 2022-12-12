//
//  LayoutSelectionView.swift
//  Instagrid
//
//  Created by Lilian Grasset on 18/11/2022.
//

import UIKit

class LayoutSelectionView: UIView {

    @IBOutlet private var buttons: [UIButton]!

    private var selector: UIImageView!

    enum Layout {
        case layout1, layout2, layout3
    }

    var currentLayout: Layout = .layout1 {
        didSet {
            updateSelector()
        }
    }

    func configSelector() {
        selector = UIImageView(image: UIImage(named: "Selected"))
        selector.frame.size = buttons[0].frame.size
        currentLayout = .layout2
    }

    func updateSelector() {
        switch currentLayout {
        case .layout1:
            buttons[0].addSubview(selector)
        case .layout2:
            buttons[1].addSubview(selector)
        case .layout3:
            buttons[2].addSubview(selector)
        }
        selector.frame.size = buttons[0].frame.size
    }

    func changeLayout(_ sender: UIButton) {

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
