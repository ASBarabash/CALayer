//
//  SecondViewController.swift
//  CALayer
//
//  Created by Alexandr Barabash on 22.05.2022.
//

import UIKit

class SecondViewController: UIViewController, CAAnimationDelegate {
    
    var shapeLayer: CAShapeLayer! {
        didSet {
            shapeLayer.lineWidth = 20 // толщина линии, которой будет совершаться обводка
            shapeLayer.lineCap = .butt // закругленные углы
            shapeLayer.fillColor = nil // чтобы фигура не была замкнута
            shapeLayer.strokeEnd = 1 // конечная точка отрисовки (от 0 до 1)
            let color = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1).cgColor
            shapeLayer.strokeColor = color // задаем цвет обводки
        }
    }
    
    var overShapeLayer: CAShapeLayer! {
        didSet {
            overShapeLayer.lineWidth = 20 // толщина линии, которой будет совершаться обводка
            overShapeLayer.lineCap = .butt // закругленные углы
            overShapeLayer.fillColor = nil // чтобы фигура не была замкнута
            overShapeLayer.strokeEnd = 0 // конечная точка отрисовки (от 0 до 1)
            let color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
            overShapeLayer.strokeColor = color // задаем цвет обводки
        }
    }
    
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
        
        configShapeLayer(shapeLayer)
        configShapeLayer(overShapeLayer)
    }
    
    func configShapeLayer(_ shapeLayer: CAShapeLayer) {
        shapeLayer.frame = view.bounds // задаем границы, в пределах которых мы можем рисовать наш shapeLayer
        let path = UIBezierPath() // создаем траекторию
        path.addArc(withCenter: imageView.center, radius: imageView.frame.width / 2, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        shapeLayer.path = path.cgPath // присваиваем траекторию
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradienLayer = CAGradientLayer()
        view.layer.insertSublayer(gradienLayer, at: 0)
        
        shapeLayer = CAShapeLayer()
        view.layer.addSublayer(shapeLayer) // добавляем в качестве подслоя
        
        overShapeLayer = CAShapeLayer()
        view.layer.addSublayer(overShapeLayer) // добавляем в качестве подслоя
        
    }
    
    @IBAction func tapped() {
        
        let animation = CABasicAnimation(keyPath: "strokeEnd") // указываем свойство, которое хотим анимировать
        animation.toValue = 1 // значение до которого хотим анимировать от 0 до 1
        animation.duration = 2 // продолжительность анимации
        
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut) // как проходит анимация
        animation.fillMode = CAMediaTimingFillMode.both // чтобы анимация не удалялась сразу после завершения
        animation.isRemovedOnCompletion = false // чтобы свойство сработало ( чтобы не удалялось по завершению )

        animation.delegate = self // подписание под протокол
        
        overShapeLayer.add(animation, forKey: nil)
        
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        dismiss(animated: true)
    } // если подписаны под протокол CAAnimationDelegate то доступен метод
}
