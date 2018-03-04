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
    //MARK: - Notifications
    //Es muy importante subcribirse y a la vez desubcribirse
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Nos damos de alta en las notificaciones
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(seasonDidChange), name: Notification.Name(SEASON_DID_CHANGE_NOTIFICATION_NAME), object: nil)
        syncModelWithView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // Damos de baja las notificaciones
        super.viewWillDisappear(animated)
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }

    
    // MARK: - Notifications
    @objc func seasonDidChange(notification: Notification){
        // Extraer el userInfo de la notificacion
        guard let info = notification.userInfo else{
            return
        }
        // Sacar la casa del userInfo
        let season = info[SEASON_KEY] as? Seasons
        
        // Actualizar el modelo
        model = season!.sortedMembers[0]
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
