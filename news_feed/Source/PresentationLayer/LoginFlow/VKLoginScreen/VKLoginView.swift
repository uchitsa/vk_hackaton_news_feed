//
//  VKLoginView.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation
import UIKit
import WebKit

public class VKLoginView: UIView {
    let webView: WKWebView

    // MARK: Life cycle

    override init(frame: CGRect) {
        let configuration = WKWebViewConfiguration()
        configuration.preferences = WKPreferences()
        configuration.websiteDataStore = WKWebsiteDataStore.nonPersistent()

        webView = WKWebView(frame: frame, configuration: configuration)
        if #available(iOS 11.0, *) {
            webView.scrollView.contentInsetAdjustmentBehavior = .never
        }

        super.init(frame: frame)

        addSubview(webView)
    }

    required init?(coder _: NSCoder) { fatalError() }

    // MARK: - layout

    override public func layoutSubviews() {
        super.layoutSubviews()

        webView.frame = bounds
    }

    // MARK: - Private
}
