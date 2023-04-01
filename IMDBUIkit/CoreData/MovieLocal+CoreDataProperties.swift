//
//  MovieLocal+CoreDataProperties.swift
//  IMDBUIkit
//
//  Created by Baskoro on 28/03/23.
//
//

import Foundation
import CoreData


extension MovieLocal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieLocal> {
        return NSFetchRequest<MovieLocal>(entityName: "MovieLocal")
    }

    @NSManaged public var adult: Bool
    @NSManaged public var originalLanguage: String?
    @NSManaged public var id: Int64
    @NSManaged public var originalTitle: String?
    @NSManaged public var overview: String?
    @NSManaged public var posterPath: String?

}

extension MovieLocal : Identifiable {

}
