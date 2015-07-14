//
//  Shelf.swift
//  LibraryChallenge
//
//  Created by Edrease Peshtaz on 6/30/15.
//  Copyright (c) 2015 MysterioGroupSoftware. All rights reserved.
//

import Foundation

class Shelf {
  

  let nameOfShelf: String
  var booksOnShelf = [Book]()
  
  init(nameOfShelf: String) {
    self.nameOfShelf = nameOfShelf
  }
  
  func addShelfToLibrary(parentLibrary: Library) {
    parentLibrary.shelvesInLibrary.append(self)
  }
  
  func listBooks() {
    for book in booksOnShelf {
      println(book.title)
    }
  }

}

 