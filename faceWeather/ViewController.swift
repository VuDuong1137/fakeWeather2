//
//  ViewController.swift
//  faceWeather
//
//  Created by Dương chãng on 2/15/20.
//  Copyright © 2020 macshop. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let ViewTo: UIView = {
        let ViewTo = UIView()
        ViewTo.translatesAutoresizingMaskIntoConstraints = false
        //ViewTo.backgroundColor = .green
        return ViewTo
    }()
    
    let lable1: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Nam Định"
        //lable.layer.borderColor = UIColor.red.cgColor
        //lable.layer.borderWidth = 3
        lable.textColor = .red
        lable.font = UIFont.systemFont(ofSize: 40)
        // lable.backgroundColor = .blue
        return lable
    }()
    let lable2: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Tỉnh"
        //lable.backgroundColor = .blue
        lable.font = UIFont.systemFont(ofSize: 25)
        return lable
    }()
    let lable3: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "30º"
        //lable.backgroundColor = .blue
        lable.font = UIFont.systemFont(ofSize: 100)
        return lable
        
    }()
    let lable4: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "MonDay"
        // lable.backgroundColor = .blue
        lable.font = UIFont.systemFont(ofSize: 25)
        return lable
    }()
    let lable5: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Day"
        lable.font = UIFont.systemFont(ofSize: 25)
        return lable
    }()
    let lable6: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "26º"
        lable.font = UIFont.systemFont(ofSize: 25)
        return lable
    }()
    let lable7: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "22"
        lable.font = UIFont.systemFont(ofSize: 25)
        return lable
    }()
    
    let Table: UITableView = {
        let Tableview = UITableView()
        Tableview.translatesAutoresizingMaskIntoConstraints = false
        return Tableview
    }()
    let collectionView: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        return collectionview
    }()
    
    var thoitiets : [weather] = []
    let cellTableview : String = "cell"
    let cellcolectionview: String = "cell2"
    var thoitiet: [weather2] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setuplayout()
        setupdataTableView()
        delegadatasoud()
        setupdatCplection()
        delegatdatasouncolectinView()
        Table.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: cellTableview)
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellcolectionview)
        // xet cuộn ngang cho collec tion view
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
        
        
        
        //    // để trong cai nyaf cũng ok
        //    func  condoc() {
        //
        //        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
        //             flowLayout.scrollDirection = .horizontal
        //         }
    }
    func setuplayout(){
        view.addSubview(ViewTo)
        ViewTo.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        ViewTo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        ViewTo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        ViewTo.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.height / 1.5).isActive = true
        
        ViewTo.addSubview(lable1)
        lable1.topAnchor.constraint(equalTo: ViewTo.topAnchor, constant: 50).isActive = true
        lable1.leadingAnchor.constraint(equalTo: ViewTo.leadingAnchor, constant: 125).isActive = true
        lable1.heightAnchor.constraint(equalToConstant: 50).isActive = true
        lable1.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        ViewTo.addSubview(lable2)
        lable2.topAnchor.constraint(equalTo: lable1.bottomAnchor, constant: 10).isActive = true
        lable2.leadingAnchor.constraint(equalTo: lable1.leadingAnchor, constant: 60).isActive = true
        lable2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        lable2.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        ViewTo.addSubview(lable3)
        lable3.topAnchor.constraint(equalTo: lable2.bottomAnchor, constant: 10).isActive = true
        lable3.leadingAnchor.constraint(equalTo: lable1.leadingAnchor, constant: 20).isActive = true
        lable3.heightAnchor.constraint(equalToConstant: 100).isActive = true
        lable3.widthAnchor.constraint(equalToConstant: 180).isActive = true
        
        ViewTo.addSubview(lable4)
        ViewTo.addSubview(lable5)
        ViewTo.addSubview(lable6)
        ViewTo.addSubview(lable7)
        
        lable4.topAnchor.constraint(equalTo: lable3.bottomAnchor, constant: 10).isActive = true
        lable4.leadingAnchor.constraint(equalTo: ViewTo.leadingAnchor, constant: 20).isActive = true
        lable4.heightAnchor.constraint(equalToConstant: 30).isActive = true
        lable4.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        lable5.topAnchor.constraint(equalTo: lable3.bottomAnchor, constant: 10).isActive = true
        lable5.leadingAnchor.constraint(equalTo: lable4.trailingAnchor, constant: 20).isActive = true
        lable5.heightAnchor.constraint(equalToConstant: 30).isActive = true
        lable5.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        lable6.topAnchor.constraint(equalTo: lable3.bottomAnchor, constant: 10).isActive = true
        lable6.leadingAnchor.constraint(equalTo: lable5.trailingAnchor, constant: 50).isActive = true
        lable6.heightAnchor.constraint(equalToConstant: 30).isActive = true
        lable6.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        lable7.topAnchor.constraint(equalTo: lable3.bottomAnchor, constant: 10).isActive = true
        lable7.leadingAnchor.constraint(equalTo: lable6.trailingAnchor, constant: 20).isActive = true
        lable7.heightAnchor.constraint(equalToConstant: 30).isActive = true
        lable7.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = .red
        collectionView.topAnchor.constraint(equalTo: ViewTo.bottomAnchor, constant: 10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -450).isActive = true
        
        view.addSubview(Table)
        Table.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 2).isActive = true
        Table.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        Table.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        Table.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10).isActive = true
        
    }
    
    func setupdataTableView() {
        let thoitiet1 = weather(tenthu: "Monday", anh: "anh1", nhietdo: "30º", ngay: "20")
        let thoitiet2 = weather(tenthu: "Friday", anh: "anh2", nhietdo: "34º", ngay: "01")
        let thoitiet3 = weather(tenthu: "Tuesday", anh: "anh3", nhietdo: "33º", ngay: "10")
        
        let thoitiet4 = weather(tenthu: "sunday", anh: "anh3", nhietdo: "29º", ngay: "20")
        let thoitiet5 = weather(tenthu: "Friday", anh: "anh1", nhietdo: "22º", ngay: "01")
        let thoitiet6 = weather(tenthu: "Friday", anh: "anh2", nhietdo: "29º", ngay: "04")
        let thoitiet7 = weather(tenthu: "Friday", anh: "anh3", nhietdo: "30º", ngay: "06")
        let thoitiet8 = weather(tenthu: "Friday", anh: "anh1", nhietdo: "33º", ngay: "07")
        let thoitiet9 = weather(tenthu: "Friday", anh: "anh2", nhietdo: "34º", ngay: "01")
        
        thoitiets = [thoitiet1, thoitiet2, thoitiet3, thoitiet4, thoitiet5, thoitiet6, thoitiet7, thoitiet8, thoitiet9]
    }
    
    
    func delegadatasoud() {
        Table.delegate = self
        Table.dataSource = self
        
    }
    func setupdatCplection() {
        let dulieu1 = weather2(Tenthu2: "Monday", anh2: "anh2", ngay2: "26º")
        let dulieu2 = weather2(Tenthu2: "Sunday", anh2: "anh1", ngay2: "28º")
        let dulieu3 = weather2(Tenthu2: "Friday", anh2: "anh3", ngay2: "25º")
        let dulieu4 = weather2(Tenthu2: "Thurday", anh2: "anh3", ngay2: "30º")
        let dulieu5 = weather2(Tenthu2: "Monday", anh2: "anh1", ngay2: "28º")
        let dulieu6 = weather2(Tenthu2: "Friday", anh2: "anh2", ngay2: "29º")
        let dulieu7 = weather2(Tenthu2: "Monday", anh2: "anh3", ngay2: "25º")
        let dulieu8 = weather2(Tenthu2: "Sunday", anh2: "anh2", ngay2: "25º")
        
        thoitiet = [dulieu1, dulieu2, dulieu3, dulieu4, dulieu5, dulieu6, dulieu7, dulieu8]
    }
    
    func delegatdatasouncolectinView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
    }
    
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    // hàm sô section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    // hiển thị số dòng trong 1 section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return thoitiets.count
    }
    // nọi dung tuengf dòng trong một section
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellTableview, for: indexPath) as! TableViewCell
        cell.anhs = thoitiets[indexPath.row]
        return cell
    }
        // themdelete
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete{
                thoitiets.remove(at: indexPath.row)
                tableView.reloadData()
            }
        }
    
        // hmaf chọn một cell
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let mainVc = ViewController2()
            let navigation = UINavigationController(rootViewController: mainVc)
            navigation.modalPresentationStyle = .fullScreen
            present(navigation, animated: true, completion: nil)
        }
        func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
            let delelele = UITableViewRowAction(style: .normal, title: "delete")
            { [weak self]  (_,_) in guard let StrongSelf = self else {return}
                StrongSelf.thoitiet.remove(at: indexPath.row)
                StrongSelf.Table.reloadData()
        }
            let edid = UITableViewRowAction(style: .normal, title: "edid")
            {[weak self] (_,_) in guard let strongself = self else{return}
            }
            delelele.backgroundColor = .red
            edid.backgroundColor = .blue
            return [delelele, edid]
}
}
    extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return thoitiet.count
        }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellcolectionview, for: indexPath) as! CollectionViewCell
            cell.anh2 = thoitiet[indexPath.row]
            return cell
        }
        
        // kịch thước của 1 item
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 100, height: 150)
        }
        
        // khonagr cáh dáy vs top
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
            
        }
        // khoảng cáh bên cạnh nhau
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            
            return 0
        }
        
        
    }
