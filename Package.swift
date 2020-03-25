// swift-tools-version:4.2
//
//  Package.swift
//  IsoCountryAndLanguageCodes
//
//  Created by Sidney de Koning on 09/01/15.
//  Copyright (c) 2015 Funky Monkey, www.funky-monkey.nl. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "IsoCountryAndLanguageCodes",
    products: [
        .library(
            name: "IsoCountryAndLanguageCodes",
            targets: ["IsoCountryAndLanguageCodes"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "IsoCountryAndLanguageCodes",
            dependencies: [],
            path: "Sources")
    ]
)
