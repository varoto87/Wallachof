//
//  Product+CoreDataProperties.swift
//  Wallachof
//
//  Created by David Jorge on 21/05/2019.
//  Copyright © 2019 Dev2. All rights reserved.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var desc: String?
    @NSManaged public var name: String?
    @NSManaged public var price: Double
    @NSManaged public var publicDate: NSDate?
    @NSManaged public var sold: Bool
    @NSManaged public var thumb: NSData?
    @NSManaged public var pictures: NSSet?

}

// MARK: Generated accessors for pictures
extension Product {

    @objc(addPicturesObject:)
    @NSManaged public func addToPictures(_ value: ProductPicture)

    @objc(removePicturesObject:)
    @NSManaged public func removeFromPictures(_ value: ProductPicture)

    @objc(addPictures:)
    @NSManaged public func addToPictures(_ values: NSSet)

    @objc(removePictures:)
    @NSManaged public func removeFromPictures(_ values: NSSet)

}
