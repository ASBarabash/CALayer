//
//  ViewController.swift
//  CALayer
//
//  Created by Alexandr Barabash on 21.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var gradientLayer: CAGradientLayer! {
        didSet {
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
//            gradientLayer.colors = [UIColor.blue.cgColor, UIColor.yellow.cgColor, UIColor.red.cgColor]
            //или
            let startColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1).cgColor
            let endColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1).cgColor
            gradientLayer.colors = [startColor, endColor]
            //распределение
            gradientLayer.locations = [0, 0.2, 1]
            
        }
    }

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
    
    override func viewDidLayoutSubviews() {
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
//        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 20 + 16 + imageView.frame.size.height / 2)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        imageView.layer.cornerRadius = 10
        gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0)
        
    }


}

