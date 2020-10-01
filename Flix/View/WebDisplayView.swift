//
//  WebDisplayView.swift
//  Flix
//
//  Created by Lillian Chen on 9/30/20.
//

import SwiftUI

struct WebDisplayView: View {
    let url: URL
    @StateObject var webViewStateModel: WebViewStateModel = WebViewStateModel()
    
    var body: some View {
        LoadingView(isShowing: .constant(webViewStateModel.loading)) {
            WebView(url: url, webViewStateModel: webViewStateModel)
        }
        .navigationBarTitle(webViewStateModel.pageTitle, displayMode: .inline)
    }
}
