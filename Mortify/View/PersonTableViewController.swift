//
//  PersonTableViewController.swift
//  Mortify
//
//  Created by Влад Бокин on 17.06.2022.
//

import UIKit

class PersonTableViewController: UITableViewController {

    var personArray = ["Vlad", "Ilya"]

    override func viewDidLoad() {
        super.viewDidLoad()
   
       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return personArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "meCell", for: indexPath)

        var content = cell.defaultContentConfiguration()
        content.text = personArray[indexPath.row]
        
        cell .contentConfiguration = content
        return cell
    }
    

    
}
