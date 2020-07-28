//
//  CompleteVC.swift
//  ToDoList
//
//  Created by Nikolay Tkachenko on 29.07.2020.
//  Copyright © 2020 Nikolay Tkachenko. All rights reserved.
//

import UIKit

class CompleteVC: UIViewController {

    @IBOutlet weak var recordText: UILabel!
    var toDo = ToDo()
    
    var toDoTableVC : ToDoTableViewController?  = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if toDo.important {
            recordText.text = " ‼️ " + toDo.name
        }else{
            recordText.text = toDo.name
        }
        
        
    }
    
    @IBAction func completeBtn(_ sender: Any) {
        if let toDos = toDoTableVC?.toDos{
            var index = 0
            for x in toDos {
                if x.name == toDo.name {
                    toDoTableVC?.toDos.remove(at: index)
                    toDoTableVC?.tableView.reloadData()
                    navigationController?.popViewController(animated: true)
                }
                index += 1
            }
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
