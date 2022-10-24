//
//  ViewController.swift
//  PinchGestureImage
//
//  Created by 강수희 on 2022/10/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgPinch: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(self.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }

    @objc func doPinch(_ pinch: UIPinchGestureRecognizer) {
        imgPinch.transform = imgPinch.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1
    }

}

