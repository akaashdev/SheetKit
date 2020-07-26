//
//  FriendsDataSource.swift
//  SheetKit_Example
//
//  Created by Akaash Dev on 10/11/19.
//  Copyright © 2019 Akaash Dev. All rights reserved.
//

import UIKit

struct Cast {
    let name: String
    let fileName: String
}

class FriendsCastDataSource: NSObject, UITableViewDataSource {
    
    let casts = getAllCasts()
    let kCellId = "friendsCellId"
    
    func registerCellTypes(in tableView: UITableView) {
        tableView.register(CastTableViewCell.self, forCellReuseIdentifier: kCellId)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return casts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellId, for: indexPath) as! CastTableViewCell
        cell.setup(casts[indexPath.row])
        return cell
    }
    
}


class CastTableViewCell: UITableViewCell {
    
    lazy var castImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 25
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var castLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [castImageView, castLabel].forEach { contentView.addSubview($0) }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        castImageView.frame = CGRect(x: 12, y: 12, width: 50, height: 50)
        
        let labelWidth = bounds.width - castImageView.frame.maxX - 24
        castLabel.frame = CGRect(x: castImageView.frame.maxX + 12, y: 0, width: labelWidth, height: 24)
        castLabel.center.y = castImageView.center.y
    }
    
    func setup(_ cast: Cast) {
        castImageView.image = UIImage(named: cast.fileName)
        castLabel.text = cast.name
    }
    
}


func getAllCasts() -> [Cast] {
    let names = [
     "Jennifer Aniston",
     "Courteney Cox",
     "Lisa Kudrow",
     "Matthew Perry",
     "Matt LeBlanc",
     "David Schwimmer",
     "Paul Rudd",
     "Winona Ryder",
     "Cole Sprouse",
     "Reese Witherspoon",
     "James Michael",
     "Maggie Wheeler",
     "Helen Baxendale",
     "Bruce Willis",
     "Paget Brewster",
     "Hank Azaria",
     "Jon Favreau",
     "Christina Applegate",
     "Aisha Tyler",
     "Jane Sibbett",
     "Elliott Gould",
     "Jane Lynch",
     "Sean Penn",
     "Jessica Hecht",
     "Giovanni Ribisi",
     "Eddie Cahill",
     "Christine Taylor",
     "Lauren Tom",
     "Debra Jo",
     "Noelle Sheldon",
     "Dermot Mulroney",
     "Danny DeVito",
     "Bonnie Somerville",
     "Alexandra Holden",
     "Michael Rapaport",
     "Christina Pickles",
     "Kathleen Turner",
     "Elle Macpherson",
     "Charles Thomas",
     "Morgan Fairchild",
     "George Newbern",
     "Melissa George",
     "Larry Hankin",
     "Teri Garr",
     "Mae Whitman",
     "June Gable",
     "Alison LaPlaca",
     "Mike Hagerty",
     "Joanna Gleason",
     "Dan Castellaneta",
     "Vincent Ventresca",
    ]
    return names.map {
        Cast(name: $0,
             fileName: $0.lowercased().replacingOccurrences(of: " ", with: "_"))
    }
}
