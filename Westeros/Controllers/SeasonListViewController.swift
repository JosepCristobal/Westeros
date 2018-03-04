//
//  SeasonListViewController.swift
//  Westeros
//
//  Created by Josep Cristobal on 3/3/18.
//  Copyright © 2018 Josep Cristobal. All rights reserved.
//

import UIKit

class SeasonListViewController: UITableViewController {
    
    let model: [Seasons]
    
    // Mark: - Initializacion
    init(model: [Seasons]){
        self.model = model
        super.init(style: .plain)
        title = "Seasons"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
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
        return model.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Necesitamos un identificador para cada tipo de celda
        let cellId = "SeasonCell"
        
        // Descubrir cual es la casa que debemos de mostrar
        let season = model[indexPath.row]
        
        // Creamos una celda
        // Tienes alguna en cache? si no la tiene, crea una
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil{
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        }
        // Sincronizar modelo house con al cell que es la vista
        
        cell?.textLabel?.text = season.name
        cell?.detailTextLabel?.text = "Air Date: \(season.releaseDate)"
        return cell!
        
    }
    
    
    
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
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

    
}
