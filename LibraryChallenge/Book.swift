//
//  Book.swift
//  LibraryChallenge
//
//  Created by Edrease Peshtaz on 6/30/15.
//  Copyright (c) 2015 MysterioGroupSoftware. All rights reserved.
//

import Foundation

class Book: NSObject, NSCoding {
  
  var title: String
  
  init(title: String) {
    self.title = title
  }
  
  func enshelf (destinationShelf: Shelf) {
    destinationShelf.booksOnShelf.append(self)
  }
  
  func unshelf (shelfToRemoveFrom: Shelf) {
    shelfToRemoveFrom.booksOnShelf.removeLast()
  }
  
  required init(coder aDecoder: NSCoder) {
    title = aDecoder.decodeObjectForKey("title") as! String
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(title, forKey: "title")
  }
  
}



