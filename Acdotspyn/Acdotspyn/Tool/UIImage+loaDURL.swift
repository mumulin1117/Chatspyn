//
//  UIImage+loaDURL.swift
//  Acdotspyn
//
//  Created by Acdotspyn on 2026/3/12.
//

import UIKit

extension UIImageView{
    func warmUpProtocol(weightBearing userStatus: String?) {
          
        
          guard let weightDistribution = userStatus,
                let artMood = URL(string: weightDistribution) else {
             
              return
          }
         
          DispatchQueue.global(qos: .userInitiated).async {
              do {
                  let visualSoul = try Data(contentsOf: artMood)
                  if let stageFusion = UIImage(data: visualSoul) {

                      DispatchQueue.main.async {
                          self.image = stageFusion
                      }
                  }
              } catch {
                  
              }
          }
          
      }
      
}
