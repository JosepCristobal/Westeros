//
//  HauseDetailViewController.swift
//  Westeros
//
//  Created by Josep Cristobal on 12/2/18.
//  Copyright © 2018 Josep Cristobal. All rights reserved.
//

import UIKit

class HouseDetailViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var houseNameLabel: UILabel!
    @IBOutlet weak var sigilImageView: UIImageView!
    @IBOutlet weak var wordsLabel: UILabel!
    
    // MARK: - Properties
    var model: House

    // MARK: - Initialitzation
    
    init (model: House){
        //Primero Limpias tu propio desorden
        self.model = model
        //LLamas a super
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        title = model.name
    }
    
    //Chapuza de los de Cupertino relacionado con los Nils
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //Añadiremos un boton para poder navegar a la Wiki
        setupUI()
        
        syncModelWithView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncModelWithView()
    }
    
    //Mark: -Sync
    func syncModelWithView(){
        //Model -> View
        houseNameLabel.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsLabel.text = model.words
        
    }
    
    // Mark: UI
    func setupUI(){
        let wikiButton = UIBarButtonItem(title: "Wiki", style: .plain, target: self, action:
        #selector(displayWiki))
        let members = UIBarButtonItem(title: "Members", style: .plain, target: self, action:
            #selector(displayMembers))
        navigationItem.rightBarButtonItems = [wikiButton, members]
    }

    @objc func displayWiki(){
        //Creamos el WikiVC
        let wikiViewController = WikiViewController(model: model)
        
        //Hacemos Push
        navigationController?.pushViewController(wikiViewController, animated:true)
        
    }
    @objc func displayMembers(){
        // Creamos el VC
        let memberListViewController = MemberListViewController(model: model.sortedMembers )
        // Hacemos el push
        navigationController?.pushViewController(memberListViewController, animated: true)
    }
}

//Esperaremos la llamada del delegado
extension HouseDetailViewController: HouseViewListControllerDelegate{
    func houseViewListController(_ vc: HouseViewListController, didSelectHouse house: House) {
        self.model = house
        syncModelWithView()
    }
    
    
    
}
