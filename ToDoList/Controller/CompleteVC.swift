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
    var toDo : ToDoItem? = nil
    
    //var toDoTableVC : ToDoTableViewController?  = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if toDo != nil {
            if toDo!.important {
                if let name = toDo?.name {
                    recordText.text = " ‼️ " + name
                }
                
            }else{
                recordText.text = toDo!.name
            }
        }
    }
    
    @IBAction func completeBtn(_ sender: Any) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            if toDo != nil {
                context.delete(toDo!)
                do{
                    try context.save()
                }catch let error {
                    print(error)
                }
                navigationController?.popViewController(animated: true)
            }
        }
        
        /*if let toDos = toDoTableVC?.toDos{
            var index = 0
            for x in toDos {
                if x.name == toDo.name {
                    toDoTableVC?.toDos.remove(at: index)
                    toDoTableVC?.tableView.reloadData()
                    navigationController?.popViewController(animated: true)
                }
                index += 1
            }
        }*/
        
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
