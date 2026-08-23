//
//  DictionaryName.swift
//  OpenCC
//
//  Created by ddddxxx on 2019/9/16.
//

import Foundation

extension ChineseConverter {
    
    enum DictionaryName: CustomStringConvertible {
        
        case cjkCompatibilityIdeographs
        case hkPhrases
        case hkPhrasesRev
        case hkVariants
        case hkVariantsPhrases
        case hkVariantsRev
        case hkVariantsRevPhrases
        case jpShinjitaiCharacters
        case jpShinjitaiCharactersRev
        case jpShinjitaiPhrases
        case stCharacters
        case stPhrases
        case stPhrasesGeneratedFromRegionalPhrases
        case tsCharacters
        case tsCharactersExt
        case tsPhrases
        case twPhrases
        case twPhrasesRev
        case twVariants
        case twVariantsPhrases
        case twVariantsRev
        case twVariantsRevPhrases
        
        var description: String {
            switch self {
            case .cjkCompatibilityIdeographs: return "CJK_Compatibility_Ideographs"
            case .hkPhrases: return "HKPhrases"
            case .hkPhrasesRev: return "HKPhrasesRev"
            case .hkVariants: return "HKVariants"
            case .hkVariantsPhrases: return "HKVariantsPhrases"
            case .hkVariantsRev: return "HKVariantsRev"
            case .hkVariantsRevPhrases: return "HKVariantsRevPhrases"
            case .jpShinjitaiCharacters: return "JPShinjitaiCharacters"
            case .jpShinjitaiCharactersRev: return "JPShinjitaiCharactersRev"
            case .jpShinjitaiPhrases: return "JPShinjitaiPhrases"
            case .stCharacters: return "STCharacters"
            case .stPhrases: return "STPhrases"
            case .stPhrasesGeneratedFromRegionalPhrases: return "STPhrases_GeneratedFromRegionalPhrases"
            case .tsCharacters: return "TSCharacters"
            case .tsCharactersExt: return "TSCharactersExt"
            case .tsPhrases: return "TSPhrases"
            case .twPhrases: return "TWPhrases"
            case .twPhrasesRev: return "TWPhrasesRev"
            case .twVariants: return "TWVariants"
            case .twVariantsPhrases: return "TWVariantsPhrases"
            case .twVariantsRev: return "TWVariantsRev"
            case .twVariantsRevPhrases: return "TWVariantsRevPhrases"
            }
        }
    }
}

extension ChineseConverter.Options {
    
    var segmentationDictNames: [ChineseConverter.DictionaryName] {
        if contains(.reverseStandard), contains(.hkStandard) {
            return [.hkVariantsRevPhrases, .hkVariantsRev]
        } else if contains(.reverseStandard), contains(.twStandard) {
            return [.twVariantsRevPhrases, .twVariantsRev]
        } else if contains(.traditionalize) {
            return [.stPhrases, .stPhrasesGeneratedFromRegionalPhrases]
        } else if contains(.simplify) {
            return [.tsPhrases]
        } else if contains(.hkStandard) {
            return [.hkVariantsPhrases, .hkVariants]
        } else if contains(.twStandard) {
            return [.twVariantsPhrases, .twVariants]
        } else {
            return [.stPhrases, .stPhrasesGeneratedFromRegionalPhrases]
        }
    }
    
    var conversionChain: [[ChineseConverter.DictionaryName]] {
        var result: [[ChineseConverter.DictionaryName]] = [[.cjkCompatibilityIdeographs]]
        if contains(.reverseStandard) {
            if contains(.hkStandard) {
                result.append([.hkVariantsRevPhrases, .hkVariantsRev])
            } else if contains(.twStandard) {
                result.append([.twVariantsRevPhrases, .twVariantsRev])
            }
        } else if contains(.traditionalize) {
            result.append([.stPhrases, .stPhrasesGeneratedFromRegionalPhrases, .stCharacters])
            if contains(.twIdiom) {
                result.append([.twPhrases])
            }
            if contains(.hkStandard) {
                result.append([.hkVariantsPhrases, .hkVariants])
            } else if contains(.twStandard) {
                result.append([.twVariantsPhrases, .twVariants])
            }
        } else if contains(.simplify) {
            if contains(.hkStandard) {
                result.append([.hkVariantsRevPhrases, .hkVariantsRev])
            } else if contains(.twStandard) {
                if contains(.twIdiom) {
                    result.append([.twPhrasesRev, .twVariantsRevPhrases, .twVariantsRev])
                } else {
                    result.append([.twVariantsRevPhrases, .twVariantsRev])
                }
            }
            result.append([.tsPhrases, .tsCharactersExt, .tsCharacters])
        } else {
            if contains(.hkStandard) {
                result.append([.hkVariantsPhrases, .hkVariants])
            } else if contains(.twStandard) {
                result.append([.twVariantsPhrases, .twVariants])
            }
        }
        if result.count == 1 {
            result.append([.stPhrases, .stPhrasesGeneratedFromRegionalPhrases, .stCharacters])
        }
        return result
    }
}
