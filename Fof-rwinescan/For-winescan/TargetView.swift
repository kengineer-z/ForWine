//
//  TargetView.swift
//  Fof-rwinescan
//
//  Created by 財津賢一郎 on 2022/08/15.
//

import SwiftUI

struct TargetView: View {
    let wine: String
    var body: some View {
        Text(wine)
    }
}

struct TargetView_Previews: PreviewProvider {
    static var previews: some View {
        TargetView(wine:"deta")
    }
}
