//
//  SynthView.swift
//  Bliptronic5000
//
//  Created by Robert Deans on 3/25/17.
//  Copyright © 2017 Robert Deans. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class SynthView: UIView {
    
    var columnStackView1 = UIStackView()
    var columnStackView2 = UIStackView()
    var columnStackView3 = UIStackView()
    var columnStackView4 = UIStackView()
    var columnStackView5 = UIStackView()
    var columnStackView6 = UIStackView()
    var columnStackView7 = UIStackView()
    var columnStackView8 = UIStackView()
    
    var horizontalStackView = UIStackView()

    
    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
        configure()
        constrain()
    }
    
    func configure() {
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .equalCentering
        horizontalStackView.isLayoutMarginsRelativeArrangement = true
        
        let stackviewArray = [columnStackView1, columnStackView2, columnStackView3, columnStackView4, columnStackView5, columnStackView6, columnStackView7, columnStackView8]
        
        var columnCounter = 1
        for column in stackviewArray {
            column.axis = .vertical
            column.distribution = .equalCentering
            column.isLayoutMarginsRelativeArrangement = true

            
            var rowCounter = 1
            for _ in 1...8 {
                
                let blipView = BlipView(column: columnCounter, row: rowCounter)
                blipView.snp.makeConstraints {
                    $0.height.equalTo(blipView.snp.width)
                }
                blipView.backgroundColor = UIColor().generateRandomColor()
                
                column.addArrangedSubview(blipView)

                rowCounter += 1
            }

            horizontalStackView.addArrangedSubview(column)
            column.snp.makeConstraints {
                $0.height.equalToSuperview()
                $0.width.equalToSuperview().dividedBy(8)
            }
            columnCounter += 1
        }
    }
    
    func constrain() {
//        addSubview(columnStackView1)
//        columnStackView1.snp.makeConstraints {
//            $0.leading.top.bottom.equalToSuperview()
//            $0.width.equalToSuperview().dividedBy(8)
//        }
        addSubview(horizontalStackView)
        horizontalStackView.snp.makeConstraints {
            $0.centerX.centerY.height.width.equalToSuperview()
        }
        
    }
    
}
