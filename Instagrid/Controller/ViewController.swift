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
        layoutSelector.configSelector()
        imageGrid.setLayout(layoutSelector.currentLayout)
    }

    @IBAction func changeImagesLayout(_ sender: UIButton) {
        layoutSelector.changeLayout(sender)
        imageGrid.setLayout(layoutSelector.currentLayout)
    }

    @IBAction func sharePicture(_ sender: UISwipeGestureRecognizer) {
        guard let screenshot = takeScreenshot() else { return }
        share(screenshot: screenshot)
    }

    private func takeScreenshot() -> UIImage? {
        UIGraphicsBeginImageContext(imageGrid.bounds.size)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        imageGrid.layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

    private func share(screenshot: UIImage) {
        let activityViewController = UIActivityViewController(activityItems: [screenshot], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.view.backgroundColor = #colorLiteral(red: 0.07140407711, green: 0.3981980085, blue: 0.5966526866, alpha: 1)
        present(activityViewController, animated: true)
    }
}
