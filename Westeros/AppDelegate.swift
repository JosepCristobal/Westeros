//
//  AppDelegate.swift
//  Westeros
//
//  Created by Josep Cristobal on 8/2/18.
//  Copyright © 2018 Josep Cristobal. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // Codigo insertado en la tercera sesion
        //Asignamos la variable window
        window = UIWindow(frame: UIScreen.main.bounds)
        
        
        //Asignamos a la propiedad del Window
        window?.backgroundColor = .cyan
        //Hay que hacerla visible
        window?.makeKeyAndVisible()
        
        
        
        
        //Vamos a crear unos modelo
        let houses = Repository.local.houses
        let seasons = RepositorySeasons.localS.seasons
      
        
        
        // Vamos a recuperar datos desde un repositorio
        //let starkSigil = Sigil(image:UIImage(named:"codeIsComing.png")!, description: "Lobo Huargo")
        //let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno!")
        //let lanisterSigil = Sigil(image: UIImage(named:"lannister.jpg")!, description: "Leon Rampante")
       // let lanisterHouse = House(name: "Lanister", sigil: lanisterSigil, words: "Oye mi rugido!")
        
        // Vamos a crear los controladores
        //let starkHouseViewController = HouseDetailViewController(model: starkHouse)
        
        //let lanisterHouseViewController = HouseDetailViewController(model: lanisterHouse)
        //let controllers = houses.map {
            //house in
           // return HouseDetailViewController(model: house).wrappedInNavigtion()
        //}
        
      //  var controllers = [UIViewController]()
      //  for house in houses{
      //     controllers.append(HouseDetailViewController(model: house).wrappedInNavigtion())
       // }
        
        
        //var navigationsControllers = [UINavigationController]()
        //for controller in controllers {
        //    navigationsControllers.append(controller.wrappedInNavigtion())
        //}
        
        
        // Creamos los navigations
        
        //let lanisterNavigationController = UINavigationController(rootViewController: lanisterHouseViewController)
        //let starkNavigationController = UINavigationController(rootViewController: starkHouseViewController)
        //let lanisterNavigationController = UINavigationController(rootViewController: lanisterHouseViewController)
        //let root = UIViewController()
        
        
        // Creamos los combinadores
        
        // Creamos los controladores (MasterVC, detailVC)
        let houseListViewController = HouseViewListController(model: houses)
        let lastSelectedHouse = houseListViewController.lastSelectedHouse()
        let houseDetailViewController = HouseDetailViewController(model: lastSelectedHouse)
        
        //Proves SeasonListViewController
        let seasonListViewController = SeasonListViewController(model: seasons)
        
        // Asignar los delegados
        houseListViewController.delegate = houseDetailViewController
        
        //Crear el UISplitVC y le asignamos los viewControlles (master y detail)
        
        let splitViewController = UISplitViewController()
        splitViewController.viewControllers = [
        houseListViewController.wrappedInNavigtion(),
        houseDetailViewController.wrappedInNavigtion()]
        // Primero el master y despues el detail
        
        
        
        //Creamos la tabla
       // let houseListViewController = HouseViewListController(model: houses)
        
        //Asignamos el rootVC
        //Necesario para que funcione
        //Proves de Seasons
        
        
         window?.rootViewController = seasonListViewController.wrappedInNavigtion()
       // window?.rootViewController = splitViewController
        
        
        //UINavigationBar.appearance().backgroundColor = .blue
        
        
        
        
        let tabBarViewController = UITabBarController()
       // tabBarViewController.viewControllers = controllers
        tabBarViewController.viewControllers = houses
                .map{HouseDetailViewController(model: $0)}
                .map{$0.wrappedInNavigtion()}
        //tabBarViewController.viewControllers = navigationsControllers
        //tabBarViewController.viewControllers = [
       //     starkHouseViewController.wrappedInNavigtion(), lanisterHouseViewController.wrappedInNavigtion()
        //]
        
        // Asignamos el rootVC
      //  window?.rootViewController = tabBarViewController
        
        return true
    }




}

