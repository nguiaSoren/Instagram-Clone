//
//  SectionHeader.swift
//  Instagram Clone
//
//  Created by OBOUNOU LEKOGO NGUIA Benaja Soren on 8/1/20.
//  Copyright © 2020 OBOUNOU LEKOGO NGUIA Benaja Soren. All rights reserved.
//

import UIKit
import HMSegmentedControl

class ProfileVCSectionHeader: UICollectionReusableView {
      var label: UILabel = {
          let label: UILabel = UILabel()
          label.textColor = .white
          label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
          label.translatesAutoresizingMaskIntoConstraints = false
          label.sizeToFit()
          return label
      }()
 
    let customSegmentedControl:HMSegmentedControl = {
        let sectionImageArray = [#imageLiteral(resourceName: "grid view off "),#imageLiteral(resourceName: "tag-user off  ")]
         let sectionSelectedImages = [#imageLiteral(resourceName: "grid view on"),#imageLiteral(resourceName: "tag-user off ")]
        var segmented = HMSegmentedControl(sectionImages: sectionImageArray, sectionSelectedImages: sectionSelectedImages)
           segmented.selectionIndicatorColor = .black
           segmented.selectionIndicatorHeight = 3/2
           segmented.selectionStyle = .fullWidthStripe
           segmented.selectionIndicatorLocation = .bottom
         segmented.shouldStretchSegmentsToScreenSize = true
        segmented.backgroundColor = .tertiarySystemGroupedBackground
           return segmented
       }()
      

      
      override init(frame: CGRect) {
          super.init(frame: frame)
      
       
       // customSegmentedControl.sectionImages = sectionImageArray
          self.addSubview(customSegmentedControl)
          // label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true// I put self because we could not find someting like contentView(in the tableViewCell for Example)
          customSegmentedControl.frame = self.bounds
      }
      required init?(coder aDecoder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
  }
  
