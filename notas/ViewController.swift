//
//  ViewController.swift
//  notas
//
//  Created by marco rodriguez on 31/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    var defaultsBD = UserDefaults.standard
    
    var notas = ["Ir al super", "Estudiar", "Leer el libro"]

    @IBOutlet weak var tablaNotas: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tablaNotas.delegate = self
        tablaNotas.dataSource = self
        
        notas = defaultsBD.array(forKey: "notas") as! [String]
    }


    @IBAction func addNotaButton(_ sender: UIBarButtonItem) {
        var notaTextField = UITextField()
        
        let alerta = UIAlertController(title: "Agregar Nueva Nota", message: "", preferredStyle: .alert)
        
        
        alerta.addTextField { (agregarNotaAction) in
            agregarNotaAction.placeholder = "Escribe aqui..."
            notaTextField = agregarNotaAction
        }
        
        let accionAceptar = UIAlertAction(title: "Ok", style: .default) { (_) in
            print("Nueva nota")
            guard let nuevaNota = notaTextField.text else { return }
            self.notas.append(nuevaNota)
            self.tablaNotas.reloadData()
            self.defaultsBD.set(self.notas, forKey: "notas")
        }
        
        
        let accionCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        
        alerta.addAction(accionAceptar)
        alerta.addAction(accionCancelar)
        
        present(alerta, animated: true, completion: nil)
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tablaNotas.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        celda.textLabel?.text = notas[indexPath.row]
        return celda
    }
    
    
}

