//
//  EpisodeDetailViewController.swift
//  Westeros
//
//  Created by Josep Cristobal on 4/3/18.
//  Copyright © 2018 Josep Cristobal. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var DescriptionLabel: UILabel!
    @IBOutlet weak var DataInsueLabel: UILabel!
   
    // MARK: - Properties
    var model: Episode
    
    // MARK: - Initialitzation
    
    init (model: Episode){
        //Primero Limpias tu propio desorden
        self.model = model
        //LLamas a super
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        title = "Episode"
    }
    // Código generado por ...
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        syncModelWithView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncModelWithView()
    }
    
    //MARK: - Sync
    //Sincronizamos modelo con vista
    func syncModelWithView(){
        TitleLabel.text = model.fullName
        DescriptionLabel.text = "Season: \(model.season.name) date \(model.season.releaseDate.asString(style: .long))"
        DataInsueLabel.text = "Air date: \(model.dateIssue.asString(style: .long)) "
    }
   
  
    


}
