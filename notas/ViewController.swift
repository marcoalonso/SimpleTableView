//
//  ViewController.swift
//  notas
//
//  Created by marco rodriguez on 31/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tablaNotas: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tablaNotas.delegate = self
        tablaNotas.dataSource = self
        // Do any additional setup after loading the view.
    }


    @IBAction func addNotaButton(_ sender: UIBarButtonItem) {
        print("Nueva nota")
        
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tablaNotas.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        celda.textLabel?.text = "Hola a todos"
        return celda
    }
    
    
}

