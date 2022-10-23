//
//  ViewController.swift
//  DrawGraphics
//
//  Created by 강수희 on 2022/10/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func prepareDraw() -> CGContext {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        return context
    }
    
    func setStroke(_ context: CGContext, color: CGColor = UIColor.black.cgColor, width: Double = 1.0) {
        context.setLineWidth(width)
        context.setStrokeColor(color)
    }
    
    func finishDraw(_ context: CGContext) {
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }

    @IBAction func btnDrawLine(_ sender: UIButton) {
        let context = prepareDraw()
        
        // Draw Line
        setStroke(context, color: UIColor.red.cgColor, width: 2.0)
        
        context.move(to: CGPoint(x: 70, y: 50))
        context.addLine(to: CGPoint(x: 270, y: 250))
        
        context.strokePath()
        
        // Draw Triangle
        setStroke(context, color: UIColor.blue.cgColor, width: 4.0)
        
        context.move(to: CGPoint(x: 170, y: 200))
        context.addLine(to: CGPoint(x: 270, y: 350))
        context.addLine(to: CGPoint(x: 70, y: 350))
        context.addLine(to: CGPoint(x: 170, y: 200))
        
        context.strokePath()
        
        finishDraw(context)
    }
    
    @IBAction func btnDrawRectangle(_ sender: UIButton) {
        let context = prepareDraw()
        
        // Draw Rectangle
        setStroke(context, color: UIColor.red.cgColor, width: 2.0)
        
        context.addRect(CGRect(x: 70, y: 100, width: 200, height: 200))
        
        context.strokePath()
        
        finishDraw(context)
    }
    
    @IBAction func btnDrawCircle(_ sender: UIButton) {
        let context = prepareDraw()
        
        // Draw Circle
        setStroke(context, color: UIColor.green.cgColor, width: 2.0)
        
        context.addEllipse(in: CGRect(x: 70, y: 50, width: 200, height: 100))
        
        context.strokePath()
        
        // Draw Circle2
        setStroke(context, color: UIColor.darkGray.cgColor, width: 5.0)
        
        context.addEllipse(in: CGRect(x: 70, y: 50, width: 200, height: 200))
        
        context.strokePath()
        
        finishDraw(context)
    }
    
    @IBAction func btnDrawArc(_ sender: UIButton) {
        let context = prepareDraw()
        
        // Draw Arc
        setStroke(context, color: UIColor.brown.cgColor, width: 3.0)
        
        context.move(to: CGPoint(x: 100, y: 50))
        context.addArc(tangent1End: CGPoint(x: 250, y: 50), tangent2End: CGPoint(x: 250, y: 200), radius: CGFloat(50))
        context.addLine(to: CGPoint(x: 250, y: 200))
        
        context.move(to: CGPoint(x: 100, y: 250))
        context.addArc(tangent1End: CGPoint(x: 270, y: 250), tangent2End: CGPoint(x: 100, y: 400), radius: CGFloat(20))
        context.addLine(to: CGPoint(x: 100, y: 400))
        
        context.strokePath()
        
        finishDraw(context)
    }
    
    @IBAction func btnDrawFill(_ sender: UIButton) {
        let context = prepareDraw()
        
        // Draw Rectangle
        setStroke(context, color: UIColor.red.cgColor, width: 2.0)
        context.setFillColor(UIColor.red.cgColor)
        
        let rectangle = CGRect(x: 70, y: 100, width: 200, height: 200)
        context.addRect(rectangle)
        context.fill(rectangle)
        context.strokePath()
        
        finishDraw(context)
    }
}

