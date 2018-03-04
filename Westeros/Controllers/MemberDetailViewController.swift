//
//  MemberDetailViewController.swift
//  Westeros
//
//  Created by Josep Cristobal on 4/3/18.
//  Copyright © 2018 Josep Cristobal. All rights reserved.
//

import UIKit

class MemberDetailViewController: UIViewController {
    // MARK: - Properties
    var model: Person
    
    @IBOutlet weak var MemberLabel: UILabel!
    // MARK: - Initialitzation
    
    init (model: Person){
        //Primero Limpias tu propio desorden
        self.model = model
        //LLamas a super
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        title = "Members"
    }
    // Código generado por ...
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        syncModelWithView()

        // Do any additional setup after loading the view.
    }
    func syncModelWithView(){
        MemberLabel.text = model.fullName
        
    }
    
}
