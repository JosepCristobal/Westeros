//
//  EpisodeListViewController.swift
//  Westeros
//
//  Created by Josep Cristobal on 4/3/18.
//  Copyright © 2018 Josep Cristobal. All rights reserved.
//

import UIKit

class EpisodeListViewController: UITableViewController {
    // Mark - Properties
    let model: [Episode]
    
    // Mark - Initialization
    init(model:[Episode]){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Episodes"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Necesitamos un identificador para cada tipo de celda
        let cellId = "EpisodeCell"
        
        // Descubrir cual es la casa que debemos de mostrar
        let episode = model[indexPath.row]
        
        // Creamos una celda
        // Tienes alguna en cache? si no la tiene, crea una
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil{
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        }
        // Sincronizar modelo house con al cell que es la vista
        
        cell?.textLabel?.text = episode.fullName
        cell?.detailTextLabel?.text = "Air Date: \(episode.dateIssue.asString(style: .long))"
        return cell!
        
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Averigura que Episodio nos han pulsado
        let episode = model[indexPath.row]
        
        //Creamos un controlador de detalle de esta temporada
        let episodeDetailViewController = EpisodeDetailViewController(model: episode)
        
        //Hacemos un push
        navigationController?.pushViewController(episodeDetailViewController, animated: true)
        
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
}

