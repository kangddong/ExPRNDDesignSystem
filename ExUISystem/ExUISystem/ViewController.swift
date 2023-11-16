//
//  ViewController.swift
//  ExUISystem
//
//  Created by 강동영 on 11/16/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ColorAsset.primary.toColor()
        ImageAsset.sampleImage.toImage()
        UIImage.asset(.arrowUpWhite)
        UIFont.asset(.body1)
    }


}
