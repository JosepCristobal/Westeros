//
//  WikiViewController.swift
//  Westeros
//
//  Created by Josep Cristobal on 15/2/18.
//  Copyright © 2018 Josep Cristobal. All rights reserved.
//

import UIKit
import WebKit

class WikiViewController: UIViewController {
 
       // Mark: Outlets
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var Activity: UIActivityIndicatorView!
    
    // Mark: - Properties
    var model: House
    
    // Mark: Initialization
    init (model: House){
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    
    //Chapuza
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Mark: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Activity.isHidden = false
        Activity.startAnimating()
        webView.navigationDelegate = self
        //LLamamos a una funcion para sicronizar la vista
        syncModelWithView()

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
    
    // Mark: - Sync
    func syncModelWithView(){
        title = model.name
        webView.load(URLRequest(url: model.wikiUrl))
        
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
            model = house!
    
        // Sincronizar la vista
        syncModelWithView()
        
    }
    
}



extension WikiViewController: WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        Activity.stopAnimating()
        Activity.isHidden = true
    }
    // Limitamos la navegación a partir de nuestra página
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let type = navigationAction.navigationType
        switch type{
            
        case .linkActivated:
            decisionHandler(.cancel)
        case .formSubmitted:
            decisionHandler(.cancel)
        default:
            decisionHandler(.allow)
        }
    }
    
}
