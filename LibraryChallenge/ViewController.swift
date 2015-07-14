//
//  ViewController.swift
//  LibraryChallenge
//
//  Created by Edrease Peshtaz on 6/30/15.
//  Copyright (c) 2015 MysterioGroupSoftware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var seattleLibrary = Library(libraryName: "Seattle Public")
  var fictionShelf = Shelf(nameOfShelf: "fiction")
  let bookOne = Book(title: "Call of the Wild")
  let bookTwo = Book(title: "The Shining")
  var staffPicksShelf = Shelf(nameOfShelf: "staff picks")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    bookOne.enshelf(fictionShelf)
    bookTwo.enshelf(fictionShelf)
    bookTwo.unshelf(fictionShelf)
    fictionShelf.addShelfToLibrary(seattleLibrary)
    fictionShelf.listBooks()
    seattleLibrary.listShelves()
    staffPicksShelf.addShelfToLibrary(seattleLibrary)
    bookTwo.enshelf(staffPicksShelf)
    seattleLibrary.listShelves()
    seattleLibrary.listBooksInLibrary()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}

