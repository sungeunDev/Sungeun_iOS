//
//  XMLParser.swift
//  ParseXMLPractice
//
//  Created by sungnni on 2018. 9. 4..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import Foundation
import SWXMLHash

struct RSSItem: XMLIndexerDeserializable {
    var title: String
    var description: String
    var pubDate: String
}

class FeedParserWithSWXMHash {
    private var rssItems: [RSSItem] = []
    private var currentElement: XMLIndexer?
    private var currentTitle: String = ""
    private var currentDescription: String = ""
    private var currentPubDate: String = ""
    
    private var parserCompletionHandler: (([RSSItem]) -> Void)?
    
    let xlmSample = """
    <item>
    <title>Privacy Policy Reminder</title>
    <link>https://developer.apple.com/news/?id=08312018a</link>
    <guid>https://developer.apple.com/news/?id=08312018a</guid>
    <description>As a reminder, in June the App Store Review Guidelines were updated to require a privacy policy for all new apps and app updates as part of the app review process. Starting October 3, 2018, App Store Connect will require a privacy policy for all new apps and app updates before they can be submitted for distribution on the App Store or through TestFlight external testing. In addition, your app’s privacy policy link or text will only be editable when you submit a new version of your app. Learn more about privacy policy guidelines</description>
    <pubDate>Fri, 31 Aug 2018 13:30:00 PDT</pubDate>
    <content:encoded><![CDATA[<p>As a reminder, in June the App Store Review Guidelines were updated to require a privacy policy for all new apps and app updates as part of the app review process. Starting October 3, 2018, App Store Connect will require a privacy policy for all new apps and app updates before they can be submitted for distribution on the App Store or through TestFlight external testing. In addition, your app’s privacy policy link or text will only be editable when you submit a new version of your app. </p><p><span class="nowrap"><a class="icon icon-after icon-chevronright" href="https://developer.apple.com/app-store/review/guidelines/#privacy">Learn more about privacy policy guidelines</a></span></p>]]></content:encoded>
    </item>
"""
    
    func parserFeed(url: String, completionHandler: (([RSSItem]) -> Void)?) {
        let task = URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
//            guard let data = data else { return }
            let xml = SWXMLHash.parse(self.xlmSample)
            self.currentElement = xml["item"]["title"]
//            self.deserialize(self.currentElement)
            print(self.currentElement?.element?.text)
        }
        task.resume()
    }
    
    private func deserialize(_ node: XMLIndexer?) {
        guard let node = node else { return }
        currentTitle = (node["title"].element?.text)!
        currentDescription = (node["description"].element?.text)!
        currentPubDate = (node["pubDate"].element?.text)!
        
        print(currentTitle)

        let rssItem = RSSItem(title: currentTitle, description: currentDescription, pubDate: currentPubDate)
        self.rssItems.append(rssItem)
        print(rssItem)
    }
    
    
}


// download xml from server
// parse xml to foundation objectsb
// call back

class FeedParser: NSObject, XMLParserDelegate {
    private var rssItems: [RSSItem] = []
    private var currentElement: String = ""
    private var currentTitle: String = "" {
        didSet {
            currentTitle = currentTitle.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var currentDescription: String = "" {
        didSet {
            currentDescription = currentDescription.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var currentPubDate: String = "" {
        didSet {
            currentPubDate = currentPubDate.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var parserCompletionHandler: (([RSSItem]) -> Void)?
    
    func parserFeed(url: String, completionHandler: (([RSSItem]) -> Void)?) {
        self.parserCompletionHandler = completionHandler
        // completionHandler(rssItems) >> 이걸로 여기에서 처리하지 않는 이유는
        // 우리는 XMLParserDelegate를 통해서 파싱을 핸들링할거기 때문!
        
        // 데이터 요청은 Other Queue
        let request = URLRequest(url: URL(string: url)!)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                if let error = error {
                    print(error.localizedDescription)
                }
                return
            }
            /// parse our xml data
            let parser = XMLParser(data: data)
            parser.delegate = self
            parser.parse() // start parsing this document
        }
        task.resume() // download the data
    }
    
    // MARK : - XML Parser Delegate
    
    // whenever the opening tag gets parsed
    func parser(
        _ parser: XMLParser,
        didStartElement elementName: String,
        namespaceURI: String?,
        qualifiedName qName: String?,
        attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        if currentElement == "item" {
            currentTitle = ""
            currentDescription = ""
            currentPubDate = ""
        }
    }
    
    // whenever the data inside attack a string gets a wire gets parsed (내부 데이터가 파싱될때마다)
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch currentElement {
        case "title": currentTitle += string
        case "description": currentDescription += string
        case "pubDate": currentPubDate += string
        default: break
        }
    }
    
    // when parser reached the closing tag
    func parser(_ parser: XMLParser,
                didEndElement elementName: String,
                namespaceURI: String?,
                qualifiedName qName: String?) {
        if elementName == "item" {
            let rssItem = RSSItem(title: currentTitle, description: currentDescription, pubDate: currentPubDate)
            self.rssItems.append(rssItem)
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        parserCompletionHandler?(rssItems)
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
         print(parseError.localizedDescription)
    }
}
