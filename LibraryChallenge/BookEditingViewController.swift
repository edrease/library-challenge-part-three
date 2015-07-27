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

  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return false
  }
  
  func textFieldDidEndEditing(textField: UITextField) {
    if selectedBook != nil {
      selectedBook.title = textField.text
    } else {
      var newBook = Book(title: textField.text)
      shelfToAddTo.booksOnShelf.append(newBook)
    }
  }
}
