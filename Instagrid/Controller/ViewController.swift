//
//  ViewController.swift
//  Instagrid
//
//  Created by Lilian Grasset on 14/11/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var layoutSelector: LayoutSelectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeImagesLayout(_ sender: UIButton) {
        layoutSelector.changeLayout(sender)
    }
    
}
