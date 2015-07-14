//
//  Library.swift
//  LibraryChallenge
//
//  Created by Edrease Peshtaz on 6/30/15.
//  Copyright (c) 2015 MysterioGroupSoftware. All rights reserved.
//

import Foundation

class Library {
  
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
}

