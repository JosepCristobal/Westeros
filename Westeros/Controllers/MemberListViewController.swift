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
    var model: [Person]
    
    // Mark - Initialization
    init(model:[Person]){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Members"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //Es muy importante subcribirse y a la vez desubcribirse
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Nos damos de alta en las notificaciones
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(houseDidChange), name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // Damos de baja las notificaciones
        super.viewWillDisappear(animated)
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }

 // MARK - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Asignamos delegado
        tableView.delegate = self
        
        // Asignamos a la fuente de datos
        tableView.dataSource = self
        
    }
    
    
    // MARK: - Notifications
    @objc func houseDidChange(notification: Notification){
        // Extraer el userInfo de la notificacion
        //let info = notification.userInfo! //mas elegante
        guard let info = notification.userInfo else{
            return
        }
        // Sacar la casa del userInfo
        let house = info[HOUSE_KEY] as? House
        
        // Actualizar el modelo
        model = house!.sortedMembers
        tableView.reloadData()
        
        // Sincronizar la vista
        //syncModelWithView()
        
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



