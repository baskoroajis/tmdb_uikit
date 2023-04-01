//
//  LocalStorageUtils.swift
//  IMDBUIkit
//
//  Created by Baskoro on 28/03/23.
//

import UIKit
import CoreData

class LocalStorage {
    
    static func saveObjectItem(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.coreDataStack.managedContext
        
        let dummyMovieData = MovieLocal(context: managedContext)
        dummyMovieData.setValue(121321, forKey:"id")
        dummyMovieData.setValue("overview test!", forKey: #keyPath(MovieLocal.overview))
        
        appDelegate.coreDataStack.saveContext()
        
        print("save object item called!")
    }
    
    static func fetchData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.coreDataStack.managedContext
        
        let movieFetch: NSFetchRequest<MovieLocal> = MovieLocal.fetchRequest()
//            let sortByDate = NSSortDescriptor(key: #keyPath(Note.dateAdded), ascending: false)
//            noteFetch.sortDescriptors = [sortByDate]
            do {
//                let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
                let results = try managedContext.fetch(movieFetch)
                print("success fetch data movie", results)
            } catch let error as NSError {
                print("Fetch error: \(error) description: \(error.userInfo)")
            }
        
    }
}
