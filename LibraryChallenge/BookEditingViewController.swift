//
//  BookEditingViewController.swift
//  LibraryChallenge
//
//  Created by Edrease Peshtaz on 7/19/15.
//  Copyright (c) 2015 MysterioGroupSoftware. All rights reserved.
//

import UIKit

class BookEditingViewController: UIViewController, UITextFieldDelegate {

  var selectedBook: Book!
  var shelfToAddTo: Shelf!
  
  @IBOutlet weak var bookEditingTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    bookEditingTextField.delegate = self
    if selectedBook != nil {
      bookEditingTextField.text = selectedBook.title
      self.title = "Edit Book"
    } else {
      bookEditingTextField.text = nil
      bookEditingTextField.placeholder = "Add book"
      self.title = "Add Book"
    }
  }
  
  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    
    if selectedBook != nil {
      selectedBook.title = bookEditingTextField.text
    } else {
      if bookEditingTextField.text != "" {
      var newBook = Book(title: bookEditingTextField.text)
      shelfToAddTo.booksOnShelf.append(newBook)
      }
    }
  }

  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return false
  }

}
