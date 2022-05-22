//
//  ViewController.swift
//  CALayer
//
//  Created by Alexandr Barabash on 21.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.height / 2
            imageView.layer.masksToBounds = true
            imageView.layer.borderColor = UIColor.red.cgColor
            imageView.layer.borderWidth = 10
        }
    }
    
    @IBOutlet var button: UIButton! {
        didSet {
            button.layer.shadowOffset = CGSize(width: 0, height: 10) //смещение
            button.layer.shadowOpacity = 1 // прозрачность
            button.layer.shadowRadius = 10 // рассеяность
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        imageView.layer.cornerRadius = 10
        
    }


}

