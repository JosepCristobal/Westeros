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
        cell?.detailTextLabel?.text = "Air Date: \(season.releaseDate.asString(style: .long))"
        return cell!
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Averigura que Temporada nos han pulsado
        let season = model[indexPath.row]
        
        //Creamos un controlador de detalle de esta temporada
        let seasonDetailViewController = SeasonDetailViewController(modelS: season)
        
        //Hacemos un push
        navigationController?.pushViewController(seasonDetailViewController, animated: true)
        
    }
   
}
extension Date {
    func asString(style: DateFormatter.Style) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = style
        return dateFormatter.string(from: self)
        /*
         let myDate = Date()
         myDate.asString(style: .full)   // Wednesday, January 10, 2018
         myDate.asString(style: .long)   // January 10, 2018
         myDate.asString(style: .medium) // Jan 10, 2018
         myDate.asString(style: .short)  // 1/10/18
         */
    }
}
