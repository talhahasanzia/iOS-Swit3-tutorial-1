//
//  ViewController.swift
//  Google Assistant
//
//  Created by ta1ha on 17/07/2017.
//  Copyright © 2017 ta1ha. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,
    UINavigationControllerDelegate // from UIImagePickerController, its  imagePickerDelegate, which is set to this page using this delegate
    // when user picks an image he should know where to navigate now
{
    
    //MARK: Properties
    
    
    
    var messageOut="sample message from variable"
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var outputLabel: UILabel!
   
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBAction func addMealAction(_ sender: UIButton) {
        outputLabel.text=inputTextField.text;
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(messageOut)
        
        
        inputTextField.delegate=self
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
        outputLabel.text=textField.text
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        outputLabel.text=textField.text
        return true
    }
    
    @IBAction func imageViewTapGesture(_ sender: UITapGestureRecognizer) {
        // Hide the keyboard.
        inputTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
      func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
}

