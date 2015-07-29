//
//  ShelfViewController.swift
//  LibraryChallenge
//
//  Created by Edrease Peshtaz on 7/13/15.
//  Copyright (c) 2015 MysterioGroupSoftware. All rights reserved.
//

import UIKit

class ShelfViewController: UIViewController, UITableViewDataSource {
  
  var selectedLibrary: Library!
  
  @IBOutlet weak var tableView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    self.title = "Shelves"
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return selectedLibrary.shelvesInLibrary.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
    let shelfToDisplay = selectedLibrary.shelvesInLibrary[indexPath.row]
    cell.textLabel?.text = shelfToDisplay.nameOfShelf
    return cell
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "toBookViewController" {
      if let bookViewController = segue.destinationViewController as? BookViewController {
        if let indexPath = tableView.indexPathForSelectedRow() {
          let selectedRow = indexPath.row
          let selectedShelf = selectedLibrary.shelvesInLibrary[selectedRow]
          bookViewController.selectedShelf = selectedShelf
          let parentLibrary = selectedLibrary
          bookViewController.parentLibrary = parentLibrary
        }
      }
    }
  }
  
}
