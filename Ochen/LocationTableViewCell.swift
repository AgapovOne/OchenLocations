//
//  LocationTableViewCell.swift
//  Ochen
//
//  Created by Алексей Агапов on 14/07/16.
//  Copyright © 2016 ru.testing.project. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell {
  
  @IBOutlet weak var locationImage: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
}
