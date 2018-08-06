//
//  UIViewControllerExtension.swift
//  UberDragons
//
//  Created by JoseFigueiredo on 28/08/2017.
//  Copyright © 2017 JoseFigueiredo. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title: String = "Error", message: String, confirmCompletion: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: confirmCompletion)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
