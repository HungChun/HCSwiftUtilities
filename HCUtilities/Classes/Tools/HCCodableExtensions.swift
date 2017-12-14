//
//  HCCodableExtensions.swift
//  TrainSchedule
//
//  Created by HungChun on 2017/12/5.
//  Copyright © 2017年 TSUMII STUDIO. All rights reserved.
//

import Foundation

public enum SaveFormatter
{
    case JSON, Plist
}
private let jsonFolder = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!.appendingPathComponent("HCJSON", isDirectory: true)
private let plistFolder = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!.appendingPathComponent("HCPLIST", isDirectory: true)
private func savePath(_ fileName: String, formatter: SaveFormatter) -> URL
{
    var folder: URL
    var path: URL
    switch formatter
    {
    case .JSON:
        folder = jsonFolder
        path = folder.appendingPathComponent(fileName).deletingPathExtension().appendingPathExtension("json")
    case .Plist:
        folder = plistFolder
        path = folder.appendingPathComponent(fileName).deletingPathExtension().appendingPathExtension("plist")
    }
    try? FileManager.default.createDirectory(at: folder, withIntermediateDirectories: false)
    return path
}
extension Decodable
{
    public static func from(_ fileName: String, formatter: SaveFormatter = .JSON) -> Self?
    {
        do
        {
            let path = savePath(fileName, formatter: formatter)
            let data = try Data(contentsOf: path)
            switch formatter
            {
            case .JSON:
                return try JSONDecoder().decode(self, from: data)
            case .Plist:
                return try PropertyListDecoder().decode(self, from: data)
            }
        }
        catch
        {
            return nil
        }
    }
}
extension Encodable
{
    public func save(to fileName: String, formatter: SaveFormatter = .JSON) -> Bool
    {
        do
        {
            let path = savePath(fileName, formatter: formatter)
            switch formatter
            {
            case .JSON:
                try JSONEncoder().encode(self).write(to: path, options: [])
            case .Plist:
                try PropertyListEncoder().encode(self).write(to: path, options: [])
            }
            return true
        }
        catch
        {
            return false
        }
    }
}
