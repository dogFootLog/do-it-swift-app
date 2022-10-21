//
//  ViewController.swift
//  CameraPhotoLibrary
//
//  Created by 강수희 on 2022/10/21.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnCaptureImageFromCamera(_ sender: UIButton) {
    }
    
    @IBAction func btnLoadImageFromLibrary(_ sender: UIButton) {
    }
    
    @IBAction func btnRecordVideoFromCamera(_ sender: UIButton) {
    }
    
    @IBAction func btnLoadVideoFromLibrary(_ sender: UIButton) {
    }
    
}

