//
//  ImageGridView.swift
//  Instagrid
//
//  Created by Lilian Grasset on 24/11/2022.
//

import UIKit

class ImageGridView: UIView {

    private var verticalStack: UIStackView!
    private var horizontalStacks: [UIStackView]!

    private var buttons: [[ButtonPlusView]]!

    var controller: ViewController!

    func setLayout(_ layout: LayoutSelectionView.Layout) {
        switch layout {
        case .layout1:
            initLayout1()
        case .layout2:
            initLayout2()
        case .layout3:
            initLayout3()
        }
        initListener()
    }

    private func clearView() {
        subviews.forEach({$0.removeFromSuperview()})
    }

    private func configStacks() {
        clearView()

        horizontalStacks = [UIStackView(arrangedSubviews: buttons[0]),
                            UIStackView(arrangedSubviews: buttons[1])]
        for stack in horizontalStacks {
            stack.axis = .horizontal
            stack.alignment = .fill
            stack.distribution = .fillEqually
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.spacing = CGFloat(16)
        }

        verticalStack = UIStackView(arrangedSubviews: horizontalStacks)
        verticalStack.axis = .vertical
        verticalStack.alignment = .fill
        verticalStack.distribution = .fillEqually
        verticalStack.spacing = CGFloat(15)

        addSubview(verticalStack)
        verticalStack.translatesAutoresizingMaskIntoConstraints = false

        verticalStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        verticalStack.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        verticalStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15).isActive = true
        verticalStack.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true

    }

    private func initLayout1() {
        buttons = [[ButtonPlusView(style: .large)],
                   [ButtonPlusView(style: .small), ButtonPlusView(style: .small)]]
        configStacks()
    }

    private func initLayout2() {
        buttons = [[ButtonPlusView(style: .small), ButtonPlusView(style: .small)],
                   [ButtonPlusView(style: .large)]]
        configStacks()
    }

    private func initLayout3() {
        buttons = [[ButtonPlusView(style: .small), ButtonPlusView(style: .small)],
                   [ButtonPlusView(style: .small), ButtonPlusView(style: .small)]]

        configStacks()
    }

    private func initListener() {
        buttons.forEach { buttonRow in
            buttonRow.forEach { button in
                button.addTarget(controller, action: #selector(controller.pickImage(sender:)), for: .touchUpInside)
            }
        }
    }
}
