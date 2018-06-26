//
//  ClassRoomViewController.swift
//  HideStackViewInTableCell
//
//  Created by Jefferson Setiawan on 26/06/18.
//  Copyright © 2018 Jefferson Setiawan. All rights reserved.
//

import UIKit

class ClassRoomViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
   
    public var classRooms: [ClassRoom] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        classRooms = [
            ClassRoom(id: 1, name: "Science 11st", isActive: true, students: [
                Student(id: 1, name: "Bryan"),
                Student(id: 2, name: "Charles"),
                Student(id: 3, name: "Foo")
            ]),
            ClassRoom(id: 2, name: "Social 11st", isActive: false, students: [
                Student(id: 1, name: "Adam"),
                Student(id: 2, name: "Eve"),
                Student(id: 3, name: "Bar")
            ])
        ]
        setupTableView()
    }
    
    private func setupTableView() {
        let nib = UINib(nibName: "ClassRoomTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ClassRoomTableViewCell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ClassRoomViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classRooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ClassRoomTableViewCell") as? ClassRoomTableViewCell else {
            return UITableViewCell()
        }
        let classRoom = self.classRooms[indexPath.row]
        cell.setup(classRoom: classRoom, toggleInProcess: {
            self.tableView.beginUpdates()
        }) {
            self.tableView.endUpdates()
        }
        return cell
    }
}
