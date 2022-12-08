//
//  ViewController.swift
//  Instagrid
//
//  Created by Lilian Grasset on 14/11/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var layoutSelector: LayoutSelectionView!
    @IBOutlet var swipeGestureRecognizer: UISwipeGestureRecognizer!
    @IBOutlet weak var imageGrid: ImageGridView!

    // Image picker
    var currentButton: ButtonPlusView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        layoutSelector.configSelector()
        imageGrid.controller = self
        imageGrid.setLayout(layoutSelector.currentLayout)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            swipeGestureRecognizer.direction = .left
        } else {
            swipeGestureRecognizer.direction = .up
        }
    }

    @IBAction func changeImagesLayout(_ sender: UIButton) {
        layoutSelector.changeLayout(sender)
        imageGrid.setLayout(layoutSelector.currentLayout)
    }

}

// Image picker
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @objc func pickImage(sender: ButtonPlusView) {
        let imagePicker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            guard let mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary) else { return }

            imagePicker.mediaTypes = mediaTypes
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            imagePicker.delegate = self

            currentButton = sender

            present(imagePicker, animated: true)
        }
    }

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        self.dismiss(animated: true)

        if let pickedImage = info[.originalImage] as? UIImage {
            currentButton.imageView?.contentMode = .scaleAspectFill
            currentButton.setImage(pickedImage, for: .normal)
        }
    }
}

// Share image grid
extension ViewController {

    @IBAction func sharePicture(_ sender: UISwipeGestureRecognizer) {
        guard let screenshot = takeScreenshot() else { return }
        share(screenshot: screenshot)
    }

    private func takeScreenshot() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(imageGrid.bounds.size, true, 8)
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
