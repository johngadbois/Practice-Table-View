//
//  ViewController.swift
//  Table View Practice
//
//  Created by John Gadbois on 1/13/16.
//  Copyright © 2016 John Gadbois. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var myTableView: UITableView!
    
    var superheroes = ["Batman", "Superman", "Aquaman", "Wonder Woman", "The Flash", "Spiderman"]
    var realNames = ["Bruce Wayne", "Clark Kent", "Arthur Curry", "Diana", "Barry Allen", "Peter Parker"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "Add Superhero", message: nil, preferredStyle: .Alert)
        myAlert.addTextFieldWithConfigurationHandler { (nameTextField) -> Void in
            nameTextField.placeholder = "Superhero Name"
        }
        myAlert.addTextFieldWithConfigurationHandler { (realTextField) -> Void in
            realTextField.placeholder = "Real Name"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        let addAction = UIAlertAction(title: "Add", style: UIAlertActionStyle.Default) { (addAction) -> Void in
            let superheroTF = myAlert.textFields![0] as UITextField
            let realNameTF = myAlert.textFields![1] as UITextField
            self.superheroes.append(superheroTF.text!)
            self.realNames.append(realNameTF.text!)
            self.myTableView.reloadData()
        }
        myAlert.addAction(addAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        myCell.textLabel?.text = superheroes[indexPath.row]
        myCell.detailTextLabel?.text = realNames[indexPath.row]
        return myCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return superheroes.count
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            superheroes.removeAtIndex(indexPath.row)
            realNames.removeAtIndex(indexPath.row)
            myTableView.reloadData()
        }
    }

}

