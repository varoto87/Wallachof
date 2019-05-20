//
//  ViewController.swift
//  Wallachof
//
//  Created by Dev2 on 20/05/2019.
//  Copyright © 2019 Dev2. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        UserDefaults.standard.set("Hola", forKey: "Mundo")
    }


    @IBAction func btnTestPressed(_ sender: Any) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        let dinoDetector = Product(context: context)
        dinoDetector.name = "Dino Detector Ultimate 🦖"
        dinoDetector.desc = "Detector de dinosaurios de última generación"
        dinoDetector.price = 2000.0
        
        appDelegate.saveContext()
        
    }
}

