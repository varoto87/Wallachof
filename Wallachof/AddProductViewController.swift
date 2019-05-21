//
//  AddProductViewController.swift
//  Wallachof
//
//  Created by David Jorge on 21/05/2019.
//  Copyright © 2019 Dev2. All rights reserved.
//

import UIKit
import CoreData

class AddProductViewController: UIViewController {
    
    enum ImageSource {
        case photoLibrary
        case camera
    }
    var imagePicker: UIImagePickerController!
    
    
    @IBOutlet weak var imageTake: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadImage()
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    @IBAction func btnTakePicturePressed(_ sender: Any) {
        showPictureSourceAlert()
    }
    
    func selectImageFrom(_ source: ImageSource){
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        switch source {
        case .camera:
            imagePicker.sourceType = .camera
        case .photoLibrary:
            imagePicker.sourceType = .photoLibrary
        }
        present(imagePicker, animated: true, completion: nil)
    }
    
    //MARK: - Saving Image here
//    @IBAction func save(_ sender: AnyObject) {
//        guard let selectedImage = imageTake.image else {
//            print("Image not found!")
//            return
//        }
//        UIImageWriteToSavedPhotosAlbum(selectedImage, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
//    }
    
    func showPictureSourceAlert() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let actionCamera = UIAlertAction(title: "From Camera", style: .default) { (alert) in
                self.selectImageFrom(.camera)
            }
            alert.addAction(actionCamera)
            let actionAlbum = UIAlertAction(title: "From Photo Album", style: .default) { (alert) in
                self.selectImageFrom(.photoLibrary)
            }
            alert.addAction(actionAlbum)
            present(alert, animated: true)
        } else {
            selectImageFrom(.photoLibrary)
        }
    }
    
    func loadImage() {
        let request: NSFetchRequest<Product> = Product.fetchRequest()
        let persistentContainer = CoreDataManager.shared.persistentContainer
        let context = persistentContainer.viewContext
        
        if let products = try? context.fetch(request) {
            for product in products {
                if let jpegData = product.thumb {
                    imageTake.image = UIImage(data: Data(referencing: jpegData) )
                }
            }
        }
    }
}

extension AddProductViewController: UINavigationControllerDelegate {
    
}

extension AddProductViewController: UIImagePickerControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        imagePicker.dismiss(animated: true, completion: nil)
        guard let selectedImage = info[.originalImage] as? UIImage else {
            print("Image not found!")
            return
        }
        imageTake.image = selectedImage
        
        
        let persistentContainer = CoreDataManager.shared.persistentContainer
        let context = persistentContainer.viewContext
        
        let product = Product(context: context)
        product.name = "Picture Test"
        product.desc = "Nothing"
        product.price = 20.0
        if let jpegData = selectedImage.jpegData(compressionQuality: 0.8) {
            product.thumb = NSData(data: jpegData)
        }
        
        CoreDataManager.shared.saveContext()

    }
}

