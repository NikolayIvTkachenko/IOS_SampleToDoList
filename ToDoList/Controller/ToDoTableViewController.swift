//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Nikolay Tkachenko on 28.07.2020.
//  Copyright © 2020 Nikolay Tkachenko. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    var toDos : [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toDo1 = ToDo()
        toDo1.name = "Buy Milk"
        toDo1.important = true
        
        let toDo2 = ToDo()
        toDo2.name = "Walk the Dog"
        toDo2.important = false
        
        //toDos.append(toDo1)
        //toDos.append(toDo2)
        toDos = [toDo1, toDo2]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //tableView.reloadData()
    }

    @IBAction func addRecord(_ sender: UIBarButtonItem) {
        
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: K.cell, for: indexPath)

        let cell = UITableViewCell()
        let toDo = toDos[indexPath.row]
        
        if toDo.important {
            cell.textLabel?.text = " ‼️ " + toDo.name
        } else {
            cell.textLabel?.text = toDo.name
        }
        
        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedToDo = self.toDos[indexPath.row]
        performSegue(withIdentifier: K.segueGoToComplete, sender: selectedToDo)
    }
    
    // Override to support conditional editing of the table view.
    /*override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddVC {
            addVC.toDoTableVC = self
        }
        
        if let completeVC = segue.destination as? CompleteVC {
            if let toDo = sender as? ToDo {
                completeVC.toDo = toDo
                completeVC.toDoTableVC = self
            }
        }
        
    }
    

}
