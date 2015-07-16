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

}
