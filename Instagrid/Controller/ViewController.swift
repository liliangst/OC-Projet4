//
//  ViewController.swift
//  Instagrid
//
//  Created by Lilian Grasset on 14/11/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var layoutSelector: LayoutSelectionView!
    @IBOutlet weak var imageGrid: ImageGridView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        layoutSelector.currentLayout = .layout2
        imageGrid.setLayout(layoutSelector.currentLayout)
    }

    @IBAction func changeImagesLayout(_ sender: UIButton) {
        layoutSelector.changeLayout(sender)
        imageGrid.setLayout(layoutSelector.currentLayout)
    }

}
