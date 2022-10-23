//
//  ViewController.swift
//  TapTouch
//
//  Created by 강수희 on 2022/10/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var txtMessage: UILabel!
    @IBOutlet var txtTapCount: UILabel!
    @IBOutlet var txtTouchCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setDashboard(_ touches: Set<UITouch>, message: String) {
        let touch = touches.first! as UITouch
        txtMessage.text = message
        txtTapCount.text = String(touch.tapCount)
        txtTouchCount.text = String(touches.count)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       setDashboard(touches, message: "Touches Began")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        setDashboard(touches, message: "Touches Moved")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        setDashboard(touches, message: "Touches Ended")
    }

}

