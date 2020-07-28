//
//  AddVC.swift
//  ToDoList
//
//  Created by Nikolay Tkachenko on 28.07.2020.
//  Copyright © 2020 Nikolay Tkachenko. All rights reserved.
//

import UIKit

class AddVC: UIViewController {
    
    @IBOutlet weak var completed: UISwitch!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var switchImportant: UISwitch!
    
    var toDoTableVC : ToDoTableViewController?  = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func inputText(_ sender: Any) {
        
    }
    
    @IBAction func switcComplete(_ sender: Any) {
        
    }
    
    @IBAction func btnAdd(_ sender: UIButton) {
        
        let newToDo = ToDo()
        if let name = textField.text{
            newToDo.name = name
            newToDo.important = switchImportant.isOn
            toDoTableVC?.toDos.append(newToDo)
            toDoTableVC?.tableView.reloadData()
            navigationController?.popViewController(animated: true)
        }
        
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
