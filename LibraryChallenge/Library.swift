//
//  Library.swift
//  LibraryChallenge
//
//  Created by Edrease Peshtaz on 6/30/15.
//  Copyright (c) 2015 MysterioGroupSoftware. All rights reserved.
//

import Foundation

class Library: NSObject, NSCoding {
  
  var libraryName: String
  var shelvesInLibrary = [Shelf]()
  
  init (libraryName: String) {
    self.libraryName = libraryName
  }
  
  func listShelves() {
    for shelf in shelvesInLibrary {
      println(shelf.nameOfShelf)
    }
  }
  
  func listBooksInLibrary() {
    for shelf in shelvesInLibrary {
      shelf.listBooks()
    }
  }
  
  required init(coder aDecoder: NSCoder) {
    libraryName = aDecoder.decodeObjectForKey("libraryName") as! String
    shelvesInLibrary = aDecoder.decodeObjectForKey("shelvesInLibrary") as! [Shelf]
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(libraryName, forKey: "libraryName")
    aCoder.encodeObject(shelvesInLibrary, forKey: "shelvesInLibrary")
  }
  
}

