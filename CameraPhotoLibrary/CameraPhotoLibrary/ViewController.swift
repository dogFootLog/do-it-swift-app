//
//  ViewController.swift
//  CameraPhotoLibrary
//
//  Created by 강수희 on 2022/10/21.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var imgView: UIImageView!
    
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    var captureImage: UIImage!
    var videoURL: URL!
    var flagImageSave = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnCaptureImageFromCamera(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            flagImageSave = true
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [UTType.image.identifier as String]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        } else {
            myAlert("Camera inaccessable", message: "Application cannot access the camera")
        }
    }
    
    @IBAction func btnLoadImageFromLibrary(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [UTType.image.identifier as String]
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true, completion: nil)
        } else {
            myAlert("Photo album inaccessible", message: "Application cannot access the photo album")
        }
    }
    
    @IBAction func btnRecordVideoFromCamera(_ sender: UIButton) {
            if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
                flagImageSave = true
                
                imagePicker.delegate = self
                imagePicker.sourceType = .camera
                imagePicker.mediaTypes = [UTType.movie.identifier as String]
                imagePicker.allowsEditing = false
                
                present(imagePicker, animated: true, completion: nil)
            } else {
                myAlert("Camera inaccessable", message: "Application cannot access the camera")
            }
    }
    
    @IBAction func btnLoadVideoFromLibrary(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [UTType.movie.identifier as String]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        } else {
            myAlert("Photo album inaccessible", message: "Application cannot access the photo album")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        
        if mediaType.isEqual(to: UTType.image.identifier as NSString as String) {
            captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            
            if flagImageSave {
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }
            
            imageView.image = captureImage
        }
    }
    
    func myAlert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

