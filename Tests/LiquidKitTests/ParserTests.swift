//
//  ParserTests.swift
//  Liquid
//
//  Created by YourtionGuo on 28/06/2017.
//
//

import XCTest
@testable import LiquidKit

class ParserTests: XCTestCase {
    
    func testParseText() {
        let lexer = Lexer(templateString: "aab  cc dd")
        let tokens = lexer.tokenize()
        let parser = TokenParser(tokens: tokens, context: Context())
        let res = parser.parse()
        XCTAssertEqual(res, ["aab  cc dd"])
    }
    
    func testParseVariable() {
        let dic = ["a": "A", "b": "BB", "c": "CCcCC"]
        let lexer = Lexer(templateString: "aab {{ a }} {{b}}c{{c}} d")
        let tokens = lexer.tokenize()
        let parser = TokenParser(tokens: tokens, context: Context(dictionary: dic))
        let res = parser.parse()
        XCTAssertEqual(res, ["aab ", "A", " ","BB","c", "CCcCC"," d"])
    }
    
    func testParseVariablePerformance() {
        let dic = ["a": "A", "b": "BB", "c": "CCcCC"]
        let lexer = Lexer(templateString: "aab {{ a }} {{b}}c{{c}} d")
        let tokens = lexer.tokenize()
        let parser = TokenParser(tokens: tokens, context: Context(dictionary: dic))
        measure {
            _ = parser.parse()
        }
    }
}