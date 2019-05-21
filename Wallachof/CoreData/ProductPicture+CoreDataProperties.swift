//
//  ProductPicture+CoreDataProperties.swift
//  Wallachof
//
//  Created by David Jorge on 21/05/2019.
//  Copyright © 2019 Dev2. All rights reserved.
//
//

import Foundation
import CoreData


extension ProductPicture {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductPicture> {
        return NSFetchRequest<ProductPicture>(entityName: "ProductPicture")
    }

    @NSManaged public var image: NSData?
    @NSManaged public var product: Product?

}
