//
//  SeasonDetailViewController.swift
//  Westeros
//
//  Created by Josep Cristobal on 4/3/18.
//  Copyright © 2018 Josep Cristobal. All rights reserved.
//

import UIKit

class SeasonDetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var nameSeason: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Properties
    var model: Seasons
    
    // MARK: - Initialitzation
    
    init (model: Seasons){
        //Primero Limpias tu propio desorden
        self.model = model
        //LLamas a super
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        title = "Seasons"
    }
    // Código generado por ...
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //Añadimos un boton para poder navegar a Episode
        setupUI()
       syncModelWithView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncModelWithView()
    }

    //MARK: - Sync
    //Sincronizamos modelo con vista
    func syncModelWithView(){
        nameSeason.text = model.name
        releaseDateLabel.text = "Air date: \(model.releaseDate.asString(style: .long)) "
        descriptionLabel.text = "Number of episodes: \(model.count) "
    }
    
    //"House \(model.name)"
    
    
    //MARK: - UI
    func setupUI(){
        let episode = UIBarButtonItem(title: "Episodes", style: .plain, target: self, action:
            #selector(displayEpisodes))
        navigationItem.rightBarButtonItems = [episode]
    }

    @objc func displayEpisodes(){
        //Creamos el EpisodesVC
        let episodeListViewController = EpisodeListViewController(model: model.sortedMembers)
        
        //Hacemos Push
        navigationController?.pushViewController(episodeListViewController, animated:true)
        
    }
  

}

//Esperamos la llamada del Delegado

extension SeasonDetailViewController: SeasonListViewControllerDelegate{
    func seasonListViewConroller(_ vc: SeasonListViewController, didSelectSeason season: Seasons) {
        self.model = season
        syncModelWithView()
    }
}




extension Date {
    func toString(style: DateFormatter.Style) -> String {
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
