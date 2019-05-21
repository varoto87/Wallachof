//
//  AddProductViewController.swift
//  Wallachof
//
//  Created by Dev2 on 21/05/2019.
//  Copyright © 2019 Dev2. All rights reserved.
//

import UIKit

class AddProductViewController: UIViewController {

    @IBOutlet weak var imgProduct: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapDetected(_ sender: UITapGestureRecognizer) {
        
        debugPrint("Han hecho tap \(sender.numberOfTouches)")
        
    }
}
