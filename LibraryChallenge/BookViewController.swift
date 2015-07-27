//
//  BookViewController.swift
//  LibraryChallenge
//
//  Created by Edrease Peshtaz on 7/15/15.
//  Copyright (c) 2015 MysterioGroupSoftware. All rights reserved.
//

import UIKit

class BookViewController: UIViewController, UITableViewDataSource {
  
  var selectedShelf: Shelf!
  

  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    self.title = "Books"
    
    if let booksFromArchive = loadFromArchive() {
      selectedShelf.booksOnShelf = booksFromArchive
    } else {
      saveToArchive()
    }
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    tableView.reloadData()
    saveToArchive()
  }
  
  override func viewWillDisappear(animated: Bool) {
    saveToArchive()
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return selectedShelf.booksOnShelf.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
    let bookToDisplay = selectedShelf.booksOnShelf[indexPath.row]
    cell.textLabel?.text = bookToDisplay.title
    return cell
  }
  
  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == UITableViewCellEditingStyle.Delete {
      selectedShelf.booksOnShelf.removeAtIndex(indexPath.row)
      tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
    }
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "toBookEditing" {
      if let bookEditingViewController = segue.destinationViewController as? BookEditingViewController {
        if let indexPath = tableView.indexPathForSelectedRow() {
          let selectedRow = indexPath.row
          let selectedBook = selectedShelf.booksOnShelf[selectedRow]
          bookEditingViewController.selectedBook = selectedBook
        }
      }
    } else if segue.identifier == "toAddBook" {
      if let bookEditingViewController = segue.destinationViewController as? BookEditingViewController {
        let shelfToAddTo = selectedShelf
        bookEditingViewController.shelfToAddTo = shelfToAddTo
      }
    }
  }
  
  func saveToArchive() {
    if let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).last as? String {
      NSKeyedArchiver.archiveRootObject(selectedShelf.booksOnShelf, toFile: documentsPath + "/archive")
    }
  }
  
  func loadFromArchive() -> [Book]? {
    if let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).last as? String {
      if let booksListFromArchive = NSKeyedUnarchiver.unarchiveObjectWithFile(documentsPath + "/archive") as? [Book] {
        return booksListFromArchive
      }
    }
    return nil
  }
  
}
