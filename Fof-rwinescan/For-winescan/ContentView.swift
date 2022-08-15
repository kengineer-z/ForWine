//
//  ContentView.swift
//  Fof-rwinescan
//
//  Created by 財津賢一郎 on 2022/08/15.
//

import SwiftUI

struct ContentView: View {
    //ファイルリストの入力
    let wines: [String] = ["Snorlax", "Slowpoke", "Pikachu", "Eevee","alpha","deta","be","clone","dome","geoth","asdf","yfd","ugf","wert","poiu"]
    let screen_width  = UIScreen.main.bounds.width
    //検索ワードの入力中の文字列を保持する状態変数
    @State var inputText: String = ""
    //検索ワードを保持する状態変数(日本語検索時)
    @State var dispSearchKey : String = ""
    //フィルタ処理の定義
    var filterdWines: [String] {
        //テキストが何も書かれていない場合
        //英語検索時が想定される場合に利用するコード
        if inputText.isEmpty {
            //そのままを返す
            return wines
        } else {
            //リストにフィルタを施す
            return wines.filter
            {
                //upercased:リストを大文字にする
                //contains:検索
                //text.uppercased():入力された文字を大文字にする
                $0.uppercased().contains(inputText.uppercased()
                )}
        }
        //日本語検索時が想定される場合に利用するコード
        //        if dispSearchKey.isEmpty {
        //            //そのままを返す
        //            return wines
        //        } else {
        //            //リストにフィルタを施す
        //            return wines.filter
        //            {
        //                //upercased:リストを大文字にする
        //                //contains:検索
        //                //text.uppercased():入力された文字を大文字にする
        //                $0.uppercased().contains(dispSearchKey.uppercased()
        //                )}
        //        }
    }
    var body: some View {
        NavigationView{
            List{
                //絞り込みを行う領域とリスト領域を分ける
                Section(header:Text("XXXを選択して下さい").font(.headline)){
                    //検索画面に表示される文字
                    //ここの領域を検索ワードとする（$inputText 状態変数）
                    TextField("Type your search",text: $inputText, prompt: Text("絞り込み検索..."))
                    //入力域の周りを枠で囲む
                        .overlay(RoundedRectangle(cornerRadius: 13)
                            .stroke(Color.gray)
                            .padding(-5))
                    //検索窓の空白領域
                        .padding(18)
                    //日本語入力が行われる場合は、確定後の検索とする
                    //    .onSubmit { dispSearchKey = inputText }
                    //スクロールビューの設定
                }
                //スクロールができる領域の設定
                ScrollView {
                    //必要な分だけ読み込み（縦スクロール）を実現
                    LazyVStack{
                        //フィルタ処理に合わせて抽出
                        ForEach(filterdWines, id: \.self) { wine in
                            //リスト文字とアンダーラインを表示
                            VStack{
                                //クリックされた場合どこに遷移するか
                                NavigationLink(destination: TargetView(wine: wine)){
                                    //Linkの中での表示構成
                                    HStack{
                                        //Wineの名前
                                        Text(wine) .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.leading, 12)
                                            .foregroundColor(.primary)
                                        //スペース
                                        Spacer()
                                        //絞り込んでいる感の可視化
                                        Image(systemName: "chevron.right")
                                            .font(Font.system(size:14,weight:.semibold))
                                            .foregroundColor(.secondary
                                            )
                                            .opacity(0.5)
                                        Spacer()
                                    }
                                }
                                //アンダーライン
                                Divider()
                            }
                        }
                        
                    }
                    
                }
                .listStyle(InsetGroupedListStyle())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
