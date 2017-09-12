//
//  FirstViewController.swift
//  GestureRecognizerDemo
//
//  Created by Isaac Kim on 9/10/17.
//  Copyright © 2017 Isaac Kim. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var squareView: UIView!

    func handlePan(recognizer: UIPanGestureRecognizer){
        let translationInView = recognizer.translation(in: self.view)
        recognizer.view!.center = CGPoint(x:view.center.x + translationInView.x, y:view.center.y + translationInView.y)
    }
    
    func handleTap(recognizer:UITapGestureRecognizer){
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        recognizer.view?.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    func handleRotation(recognizer: UIRotationGestureRecognizer){
        if let view = recognizer.view{
            view.transform = view.transform.rotated(by: recognizer.rotation)
            recognizer.rotation = 0
        }
    }
    
    func handlePinch(recognizer: UIPinchGestureRecognizer){
        if let view = recognizer.view{
            view.transform = view.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
            recognizer.scale = 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
     
        // x and y indicates the position, whereas width and height shows the size of it. It will show rectangle in the middle of the screen. 
        
        squareView = UIView(frame: CGRect(x:150, y:250, width:100, height:100))
        squareView.backgroundColor = .blue
        view.addSubview(squareView)
        
         let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
        
        let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation(recognizer:)))
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(recognizer:)))
        
        
        squareView.gestureRecognizers = [panGesture, tapGuesture, rotateGesture, pinchGesture]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

