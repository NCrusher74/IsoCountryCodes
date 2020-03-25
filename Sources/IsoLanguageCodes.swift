//
//  IsoLanguageCodes.swift

//  Original Code by Sidney de Koning on 09/01/15.
//  Copyright (c) 2015 Funky Monkey, www.funky-monkey.nl. All rights reserved.
//  Adapted by Nolaine Crusher on 3/24/20.

import Foundation

public class IsoLanguageCodes {

    public class func find(key: String) -> IsoLanguageInfo? {
        let languages = IsoLanguages.allLanguages.filter({ $0.iso6392B == key.lowercased() ||
            $0.iso6392T == key.lowercased() || $0.iso6391 == key })
        return languages.first
    }

    public class func searchByIsoName(_ name: String) -> IsoLanguageInfo? {
        let options: String.CompareOptions = [.diacriticInsensitive, .caseInsensitive]
        let name = name.folding(options: options, locale: .current)
        let languages = IsoLanguages.allLanguages.filter({
            $0.isoName.folding(options: options, locale: .current) == name
        })
        // If we cannot find a full name match, try a partial match
        return languages.count == 1 ? languages.first : searchByPartialIsoName(name)
    }

    private class func searchByPartialIsoName(_ name: String) -> IsoLanguageInfo? {
        guard name.count > 3 else {
            return nil
        }
        let options: String.CompareOptions = [.diacriticInsensitive, .caseInsensitive]
        let name = name.folding(options: options, locale: .current)
        let languages = IsoLanguages.allLanguages.filter({
            $0.isoName.folding(options: options, locale: .current).contains(name)
        })
        // It is possible that the results are ambiguous, in that case return nothing
        // (e.g., there are two Koreas and two Congos)
        guard languages.count == 1 else {
            return nil
        }
        return languages.first
    }

    public class func searchByNativeName(_ name: String) -> IsoLanguageInfo? {
        let options: String.CompareOptions = [.diacriticInsensitive, .caseInsensitive]
        let name = name.folding(options: options, locale: .current)
        let languages = IsoLanguages.allLanguages.filter({
            $0.nativeName.folding(options: options, locale: .current) == name
        })
        // If we cannot find a full name match, try a partial match
        return languages.count == 1 ? languages.first : searchByPartialNativeName(name)
    }

    private class func searchByPartialNativeName(_ name: String) -> IsoLanguageInfo? {
        guard name.count > 3 else {
            return nil
        }
        let options: String.CompareOptions = [.diacriticInsensitive, .caseInsensitive]
        let name = name.folding(options: options, locale: .current)
        let languages = IsoLanguages.allLanguages.filter({
            $0.nativeName.folding(options: options, locale: .current).contains(name)
        })
        // It is possible that the results are ambiguous, in that case return nothing
        // (e.g., there are two Koreas and two Congos)
        guard languages.count == 1 else {
            return nil
        }
        return languages.first
    }

    public class func searchByIso6392T(_ iso6392TCode: String) -> IsoLanguageInfo? {
        let languages = IsoLanguages.allLanguages.filter({ $0.iso6392T == iso6392TCode })
        return languages.first
    }

    public class func searchByiso6392B(_ iso6392BCode: String) -> [IsoLanguageInfo] {
        let languages = IsoLanguages.allLanguages.filter({ $0.iso6392B == iso6392BCode })
        return languages
    }

    public class func searchByIso6391(_ iso6391Code: String) -> [IsoLanguageInfo] {
        let languages = IsoLanguages.allLanguages.filter({ $0.iso6391 == iso6391Code })
        return languages
    }
}
