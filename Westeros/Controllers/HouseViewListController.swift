//
//  HouseViewListController.swift
//  Westeros
//
//  Created by Josep Cristobal on 15/2/18.
//  Copyright © 2018 Josep Cristobal. All rights reserved.
//

import UIKit

let HOUSE_DID_CHANGE_NOTIFICATION_NAME = "HouseDidChange"
let HOUSE_KEY = "HouseKey"
let LAST_HOUSE = "LAST_HOUSE"

protocol HouseViewListControllerDelegate{
    // should, will, did
    // En ete caso utilizaremos para capturar click
    func houseViewListController(_ vc: HouseViewListController, didSelectHouse: House)
}


class HouseViewListController: UITableViewController {
    // Mark: - Properties
    // Nos lo pasaran el init [House]
    // Lo modelamos como un array
    let model: [House]
    var delegate: HouseViewListControllerDelegate?
    
    
    // Mark: - Initializacion
    init(model: [House]){
        self.model = model
        super.init(style: .plain)
        title = "Westeros"
    }
    // Impelmentamos la chapuza
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    //Mark: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let lastRow = UserDefaults.standard.integer(forKey: LAST_HOUSE)
        let indexPath = IndexPath(row: lastRow, section: 0)
        
        tableView.selectRow(at: indexPath, animated: true, scrollPosition: .top)
    }
    
    
    // MARK: - Table view data source
// Cuantas secciones tendremos?
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
// Cuantas filas tendremos?
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.count
    }

    
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Necesitamos un identificador para cada tipo de celda
        let cellId = "HouseCell"
        
        // Descubrir cual es la casa que debemos de mostrar
        let house = model[indexPath.row]
        
        // Creamos una celda
        // Tienes alguna en cache? si no la tiene, crea una
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        // Sincronizar modelo house con al cell que es la vista
        cell?.imageView?.image = house.sigil.image
        cell?.textLabel?.text = house.name
        return cell!
        
    }
    
    // MARK : Table View Delegate
    // should, will, did
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       //Averiguar que casa han pulsado
        let house = model [indexPath.row]
        
        //Comentado, lo hacemos porque llamaremos al delegado
        // Crear un controlador de detalle de esta casa
        //let houseDetailViewController = HouseDetailViewController(model: house)
        
        // Hacer un push
        //navigationController?.pushViewController(houseDetailViewController, animated: true)
        
        // Avisamos al delegado
        delegate?.houseViewListController(self, didSelectHouse: house)
        
        // Mando la misma info a través de notificaciones
        // Tenemos una clase llamada notification center
        let notificationCenter = NotificationCenter.default
        //Utilizamos este tipo para poder pasar la casa
        let notification = Notification(name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: self, userInfo: [HOUSE_KEY: house])
        notificationCenter.post(notification)
        
        //let lastRow = UserDefaults.standard.integer(forKey: LAST_HOUSE)
        //let indexPath = IndexPath(row: lastRow, section: 0)
        
        //tableView.selectRow(at: indexPath, animated: true, scrollPosition: .top)
        
    }
}
    
extension HouseViewListController{
    //Tenemos la casa las guardada
        func saveLastSelectedHouse(at row: Int){
            let defaults = UserDefaults.standard
            defaults.set(row, forKey: LAST_HOUSE)
            // Po si las moscas
            defaults.synchronize()
        }
    func lastSelectedHouse() -> House{
        //Extraer la row del User Default
        let row = UserDefaults.standard.integer(forKey: LAST_HOUSE)
        //Averigura la casa de este row
        let house = model[row]
        
        //Devolverla
        return house
    }
}
    
    
    
  

