//
//  SecondViewController.swift
//  CALayer
//
//  Created by Alexandr Barabash on 22.05.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    var gradienLayer: CAGradientLayer! {
        didSet {
            gradienLayer.startPoint = CGPoint(x: 1, y: 0)
            gradienLayer.endPoint = CGPoint(x: 0, y: 1)
            gradienLayer.colors = [UIColor.white.cgColor, UIColor.blue.cgColor]
            gradienLayer.locations = [0.2, 0.8]
        }
    }

    @IBOutlet var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.height / 2
            imageView.layer.masksToBounds = true
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.layer.borderWidth = 10
        }
    }
    @IBOutlet var button: UIButton! {
        didSet {
            button.layer.shadowOffset = CGSize(width: 0, height: 10)
            button.layer.shadowOpacity = 2
            button.layer.shadowRadius = 10
        }
    }
    
    override func viewDidLayoutSubviews() {
        gradienLayer.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        gradienLayer = CAGradientLayer()
        view.layer.insertSublayer(gradienLayer, at: 0)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
