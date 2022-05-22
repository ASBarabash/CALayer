//
//  ViewController.swift
//  CALayer
//
//  Created by Alexandr Barabash on 21.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var shapeLayer: CAShapeLayer! {
        didSet {
            shapeLayer.lineWidth = 20 // толщина линии, которой будет совершаться обводка
            shapeLayer.lineCap = .round // закругленные углы
            shapeLayer.fillColor = nil // чтобы фигура не была замкнута
            shapeLayer.strokeEnd = 1 // конечная точка отрисовки (от 0 до 1)
            let color = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1).cgColor
            shapeLayer.strokeColor = color // задаем цвет обводки
        }
    }
    
    var overShapeLayer: CAShapeLayer! {
        didSet {
            overShapeLayer.lineWidth = 20 // толщина линии, которой будет совершаться обводка
            overShapeLayer.lineCap = .round // закругленные углы
            overShapeLayer.fillColor = nil // чтобы фигура не была замкнута
            overShapeLayer.strokeEnd = 0.2 // конечная точка отрисовки (от 0 до 1)
            let color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
            overShapeLayer.strokeColor = color // задаем цвет обводки
        }
    }
    
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
        configShapeLayer(shapeLayer)
        configShapeLayer(overShapeLayer)
        
    }
    
    func configShapeLayer(_ shapeLayer: CAShapeLayer) {
        shapeLayer.frame = view.bounds // задаем границы, в пределах которых мы можем рисовать наш shapeLayer
        let path = UIBezierPath() // создаем траекторию
        path.move(to: CGPoint(x: self.view.frame.width / 2 - 100, y: self.view.frame.height / 2))
        path.addLine(to: CGPoint(x: self.view.frame.width / 2 + 100, y: self.view.frame.height / 2))
        shapeLayer.path = path.cgPath // присваиваем траекторию
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        imageView.layer.cornerRadius = 10
        gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        shapeLayer = CAShapeLayer()
        view.layer.addSublayer(shapeLayer) // добавляем в качестве подслоя
        
        overShapeLayer = CAShapeLayer()
        view.layer.addSublayer(overShapeLayer) // добавляем в качестве подслоя
        
    }

    @IBAction func tapped() {
        overShapeLayer.strokeEnd += 0.2
        if overShapeLayer.strokeEnd == 1 {
            performSegue(withIdentifier: "showSecondScreen", sender: self)
        }
    }
    
}

