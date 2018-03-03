//
//  MemberListViewController.swift
//  Westeros
//
//  Created by Josep Cristobal on 19/2/18.
//  Copyright © 2018 Josep Cristobal. All rights reserved.
//

import UIKit

class MemberListViewController: UIViewController {

    
    // Mark: - Outlet
    @IBOutlet weak var tableView: UITableView!
    
    // Mark - Properties
    let model: [Person]
    
    // Mark - Initialization
    init(model:[Person]){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Members"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 // MARK - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Asignamos delegado
        tableView.delegate = self
        
        // Asignamos a la fuente de datos
        tableView.dataSource = self
        
    }

}
// Mark - UITableViewDataSource
extension MemberListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "MemberCell"
        // Descubrir la persona que tenemos que mostrar
        let person = model[indexPath.row]
        // Preguntar por una celda (a una cache) o Crearla
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        ?? UITableViewCell(style: .default, reuseIdentifier: cellId)
        // Si la celda no existe, la creamos
        // if cell == nil{
           // cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        //}
        
        // Sincronizar celda y persona
        cell.textLabel?.text = person.fullName
        
        // Devolver la celda
        return cell
        
    }
}

// Mark - UITableViewDelegate
extension MemberListViewController: UITableViewDelegate{
    
    
}



