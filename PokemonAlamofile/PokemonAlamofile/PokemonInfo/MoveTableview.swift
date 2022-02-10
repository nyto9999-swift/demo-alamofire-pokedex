//
//  MoveTableview.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/10.
//

import UIKit

public class MoveTableView: UITableView {

    override public func layoutSubviews() {
           super.layoutSubviews()
           if bounds.size != intrinsicContentSize {
               invalidateIntrinsicContentSize()
           }
       }

       override public var intrinsicContentSize: CGSize {
           return contentSize
       }

}
