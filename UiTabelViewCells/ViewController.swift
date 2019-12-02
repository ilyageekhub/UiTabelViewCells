//
//  ViewController.swift
//  UiTabelViewCells
//
//  Created by Admin on 29.11.2019.
//  Copyright © 2019 Ilya Ilushenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
     var sections = ["Учні", "Вільні слухачі", "Вибули"]

       var students = [
           "Бондар Павло",
           "Вождай Ігор",
           "Демченко Михайло",
           "Запорожець Максим",
           "Ілюшенко Ілля",
           "Nedopaka Alexander",
           "Таченко Дмитро",
           "Гуріненко Валентин"]

       var off = ["Горошнюк Вячеслав",
               "БЕРЕЗА МАРИНА",]

       var free = ["Пухлій Віталій",
                "Сагайдак Ілля",
                "Шурман Андрій",
                "Лавренко Віталій",
                "Братчикова Дар'я",
                "Крістіна",]
     
    @IBOutlet weak var tableviewList: UITableView!


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return students.count
        case 1:
            return free.count
        case 2:
            return off.count
        default:
            return 0
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
               case 0:
                let name = students [indexPath.row]
                let cell = tableView.dequeueReusableCell(withIdentifier: "StudentsCell") as! StudentsCell
                cell.title.text = name
            return cell
               case 1:
                    let name = free [indexPath.row]
                    let cell = tableView.dequeueReusableCell(withIdentifier: "FreeCell") as! FreeCells
                    cell.title.text = name
                    cell.onButtonHandler = { [indexPath] in
                        self.students.append(self.free [indexPath.row])
                        self.free.remove(at: indexPath.row)
                        self.tableviewList.reloadData()
                    }
                    return cell
               case 2:
                    let name = off [indexPath.row]
                    let cell = tableView.dequeueReusableCell(withIdentifier: "OffCell") as! OffCell
                    cell.title.text = name
                    return cell
               default:
                   return UITableViewCell()
               }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         return sections [section]
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            switch indexPath.section{
                  case 0:
                    self.free.append(self.students [indexPath.row])
                    self.students.remove(at: indexPath.row)
                    self.tableviewList.reloadData()
                  case 1:
                      self.off.append(self.free [indexPath.row])
                      self.free.remove(at: indexPath.row)
                      self.tableviewList.reloadData()
                  case 2:
                      self.off.remove(at: indexPath.row)
                      self.tableviewList.reloadData()
                  default:
                      break
                  }
        }
    }
    
   

   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableviewList.delegate = self
        tableviewList.dataSource = self
        tableviewList.register(UINib(nibName: "FreeCells", bundle: nil), forCellReuseIdentifier: "FreeCell")
    }


}

