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
        
        //Asignamos la variable window
        window = UIWindow(frame: UIScreen.main.bounds)
        
        
        //Asignamos a la propiedad del Window
        window?.backgroundColor = .cyan
        //Hay que hacerla visible
        window?.makeKeyAndVisible()
        
        
        //Vamos a crear unos modelo
        let houses = Repository.local.houses
        let seasons = RepositorySeasons.localS.seasons
        
        // Creamos los combinadores
        
        // Creamos los controladores (MasterVC, detailVC)
        let houseListViewController = HouseViewListController(model: houses)
        let lastSelectedHouse = houseListViewController.lastSelectedHouse()
        let houseDetailViewController = HouseDetailViewController(model: lastSelectedHouse)
        
        //Proves SeasonListViewController
        let seasonListViewController = SeasonListViewController(model: seasons)
        let lastSelectedSeason = seasonListViewController.lastSelectedSeason()
        let seasonDetailViewController = SeasonDetailViewController(model: lastSelectedSeason)
        
        
        // Practica. Ahora vamos a incluir HouseList y SeasonList en un tabbar
         let tabBarViewControllerR = UITabBarController()
        tabBarViewControllerR.title = "Westeros"
            tabBarViewControllerR.viewControllers = [
                houseListViewController.wrappedInNavigtion(),
                seasonListViewController.wrappedInNavigtion()]
        
        // Asignar los delegados
        houseListViewController.delegate = houseDetailViewController
        seasonListViewController.delegateS = seasonDetailViewController
        
        
        //Crear el UISplitVC y le asignamos los viewControlles (master y detail)
        
        let splitViewController = UISplitViewController()
        splitViewController.viewControllers = [
            tabBarViewControllerR.wrappedInNavigtion(),
        houseDetailViewController.wrappedInNavigtion(),
        seasonDetailViewController.wrappedInNavigtion()]
        // Primero el master y despues el detail
        // Mark - UITableViewDelegate
        
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            // Estamos en iPad
            window?.rootViewController = splitViewController
        } else if UIDevice.current.userInterfaceIdiom == .phone {
            // Estamos en iPhone
            window?.rootViewController = tabBarViewControllerR.wrappedInNavigtion()
        }
      
        return true
    }




}


