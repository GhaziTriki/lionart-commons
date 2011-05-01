/*
 Copyright (C) 2011 Ghazi Triki <ghazi.nocturne@gmail.com>

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program. If not, see <http://www.gnu.org/licenses/>.
*/
package org.lionart.commons.utils
{

    /**
     *
     * @author Ghazi Triki
     *
     */
    public final class CharSetUtils
    {
        private static const SUPPORTED_CHAR_SETS:Array=[
            "ASMO-708", // Arabic (ASMO 708)
            "DOS-720", // Arabic (DOS)
            "iso-8859-6", "arabic", "csISOLatinArabic", "ECMA-114", "ISO_8859-6", "ISO_8859-6:1987", "iso-ir-127", // Arabic (ISO)
            "x-mac-arabic", // Arabic (Mac)
            "windows-1256", "cp1256", // Arabic (Windows)
            "ibm775", "CP500", // Baltic (DOS)
            "iso-8859-4", "csISOLatin4", "ISO_8859-4", "ISO_8859-4:1988", "iso-ir-110", "l4", "latin4", // Baltic (ISO)
            "windows-1257", // Baltic (Windows)
            "ibm852", "cp852", // Central European (DOS)
            "iso-8859-2", "csISOLatin2", "iso_8859-2", "iso_8859-2:1987", "iso8859-2", "so-ir-101", "l2", "latin2", // Central European (ISO)
            "x-mac-ce", // Central European (Mac)
            "windows-1250", "x-cp1250", // Central European (Windows)
            "gb18030", // Chinese National Standard 
            "EUC-CN", "	x-euc-cn", // Chinese Simplified (EUC)
            "gb2312", "chinese", "CN-GB", "csGB2312", "csGB231280", "csISO58GB231280", "GB_2312-80", "GB231280", "GB2312-80", "GBK", "iso-ir-58", // Chinese Simplified (GB2312)
            "gb18030", // Chinese Simplified (GB18030)
            "hz-gb-2312", // Chinese Simplified (HZ)
            "x-mac-chinesesimp", // Chinese Simplified (Mac)
            "big5", "cn-big5", "csbig5", "x-x-big5", // Chinese Traditional (Big5)
            "x-Chinese-CNS", // Chinese Traditional (CNS)
            "x-Chinese-Eten", // Chinese Traditional (Eten)
            "x-mac-chinesetrad", // Chinese Traditional (Mac)
            "cp866", "ibm866", // Cyrillic (DOS)
            "iso-8859-5", "csISOLatin5", "csISOLatinCyrillic", "cyrillic", "ISO_8859-5", "ISO_8859-5:1988", "iso-ir-144", "l5", // Cyrillic (ISO)
            "koi8-r", "csKOI8R", "koi", "koi8", "koi8r", // Cyrillic (KOI8-R)
            "koi8-u", "koi8-ru", // Cyrillic (KOI8-U)
            "x-mac-cyrillic", // Cyrillic (Mac)
            "windows-1251", "x-cp1251", // Cyrillic (Windows)
            "x-Europa", // Europa
            "x-IA5-German", // German (IA5)
            "ibm737", // Greek (DOS)
            "iso-8859-7", "csISOLatinGreek", "ECMA-118", "ELOT_928", "greek", "greek8", "ISO_8859-7", "ISO_8859-7:1987", "iso-ir-126", // Greek (ISO)
            "x-mac-greek", // Greek (Mac)
            "windows-1253", // Greek (Windows)
            "ibm869", // Greek, Modern (DOS)
            "DOS-862", // Hebrew (DOS)
            "iso-8859-8-i", "logical", // Hebrew (ISO-Logical)
            "iso-8859-8", "csISOLatinHebrew", "hebrew", "ISO_8859-8", "ISO_8859-8:1988", "ISO-8859-8", "iso-ir-138", "visual", // Hebrew (ISO-Visual)
            "windows-1255", "ISO_8859-8-I", "ISO-8859-8", "visual", // Hebrew (Windows)
            "x-EBCDIC-Arabic", // IBM EBCDIC (Arabic)
            "x-EBCDIC-CyrillicRussian", // IBM EBCDIC (Cyrillic Russian)
            "x-EBCDIC-CyrillicSerbianBulgarian", // IBM EBCDIC (Cyrillic Serbian-Bulgarian)
            "x-EBCDIC-DenmarkNorway", // BM EBCDIC (Denmark-Norway)
            "x-ebcdic-denmarknorway-euro", // IBM EBCDIC (Denmark-Norway-Euro)
            "x-EBCDIC-FinlandSweden", // IBM EBCDIC (Finland-Sweden)
            "x-ebcdic-finlandsweden-euro", // IBM EBCDIC (Finland-Sweden-Euro)
            "x-ebcdic-france-euro", "X-EBCDIC-France", // IBM EBCDIC (France-Euro)
            "x-EBCDIC-Germany", // IBM EBCDIC (Germany)
            "x-ebcdic-germany-euro", // IBM EBCDIC (Germany-Euro)
            "x-EBCDIC-GreekModern", // IBM EBCDIC (Greek Modern)
            "x-EBCDIC-Greek", // IBM EBCDIC (Greek)
            "x-EBCDIC-Hebrew", // IBM EBCDIC (Hebrew)
            "x-EBCDIC-Icelandic", // IBM EBCDIC (Icelandic)
            "x-ebcdic-icelandic-euro", // IBM EBCDIC (Icelandic-Euro)
            "x-ebcdic-international-euro", // IBM EBCDIC (International-Euro)
            "x-EBCDIC-Italy", // IBM EBCDIC (Italy)
            "x-ebcdic-italy-euro", // IBM EBCDIC (Italy-Euro)
            "x-EBCDIC-JapaneseAndKana", // IBM EBCDIC (Japanese and Japanese Katakana)
            "x-EBCDIC-JapaneseAndJapaneseLatin", // IBM EBCDIC (Japanese and Japanese-Latin)
            "x-EBCDIC-JapaneseAndUSCanada", // IBM EBCDIC (Japanese and US-Canada)
            "x-EBCDIC-JapaneseKatakana", // IBM EBCDIC (Japanese katakana)
            "x-EBCDIC-KoreanAndKoreanExtended", // IBM EBCDIC (Korean and Korean Extended)
            "x-EBCDIC-KoreanExtended", // IBM EBCDIC (Korean Extended)
            "CP870", // IBM EBCDIC (Multilingual Latin-2)
            "x-EBCDIC-SimplifiedChinese", // IBM EBCDIC (Simplified Chinese)
            "X-EBCDIC-Spain", // IBM EBCDIC (Spain)
            "x-ebcdic-spain-euro", // IBM EBCDIC (Spain-Euro)
            "x-EBCDIC-Thai", // IBM EBCDIC (Thai)
            "x-EBCDIC-TraditionalChinese", // IBM EBCDIC (Traditional Chinese)
            "CP1026", // IBM EBCDIC (Turkish Latin-5)
            "x-EBCDIC-Turkish", // IBM EBCDIC (Turkish)
            "x-EBCDIC-UK", // IBM EBCDIC (UK)
            "x-ebcdic-uk-euro", // IBM EBCDIC (UK-Euro)
            "ebcdic-cp-us", // IBM EBCDIC (US-Canada)
            "x-ebcdic-cp-us-euro", // IBM EBCDIC (US-Canada-Euro)
            "ibm861", // Icelandic (DOS)
            "x-mac-icelandic", // Icelandic (Mac)
            "x-iscii-as", // ISCII Assamese
            "x-iscii-be", // ISCII Bengali
            "x-iscii-de", // ISCII Devanagari
            "x-iscii-gu", // ISCII Gujarathi
            "x-iscii-ka", // ISCII Kannada
            "x-iscii-ma", // ISCII Malayalam
            "x-iscii-or", // ISCII Oriya
            "x-iscii-pa", // ISCII Panjabi
            "x-iscii-ta", // ISCII Tamil
            "x-iscii-te", // ISCII Telugu
            "euc-jp", "csEUCPkdFmtJapanese", "Extended_UNIX_Code_Packed_Format_for_Japanese", "x-euc", "x-euc-jp", // Japanese (EUC)
            "iso-2022-jp", // Japanese (JIS) 
            "iso-2022-jp", "_iso-2022-jp$SIO", // Japanese (JIS-Allow 1 byte Kana - SO/SI)
            "csISO2022JP", "_iso-2022-jp", // Japanese (JIS-Allow 1 byte Kana)
            "x-mac-japanese", // Japanese (Mac) 
            "shift_jis", "csShiftJIS", "csWindows31J", "ms_Kanji", "shift-jis", "x-ms-cp932", "x-sjis", // Japanese (Shift-JIS)
            "ks_c_5601-1987", "csKSC56011987", "euc-kr", "iso-ir-149", "korean", "ks_c_5601", "ks_c_5601_1987", "ks_c_5601-1989", "KSC_5601", "KSC5601", // Korean	
            "euc-kr", "csEUCKR", // Korean (EUC)
            "iso-2022-kr", "csISO2022KR", // Korean (ISO)
            "Johab", // Korean (Johab)
            "x-mac-korean", // Korean (Mac) 
            "iso-8859-3", "csISO", "Latin3", "ISO_8859-3", "ISO_8859-3:1988", "iso-ir-109", "l3", "latin3", // Latin 3 (ISO)
            "iso-8859-15", "csISO", "Latin9", "ISO_8859-15", "l9", "latin9", // Latin 9 (ISO) 
            "x-IA5-Norwegian", // Norwegian (IA5) 
            "IBM437", "437", "cp437", "csPC8", "CodePage437", // OEM United States
            "x-IA5-Swedish", // Swedish (IA5) 
            "windows-874", "DOS-874", "iso-8859-11", "TIS-620", // Thai (Windows)
            "ibm857", // Turkish (DOS) 
            "iso-8859-9", "csISO", "Latin5", "ISO_8859-9", "ISO_8859-9:1989", "iso-ir-148", "l5", "latin5", // Turkish (ISO)
            "x-mac-turkish", // Turkish (Mac)
            "windows-1254", "ISO_8859-9", "ISO_8859-9:1989", "iso-8859-9", "iso-ir-148", "latin5", // Turkish (Windows)
            "unicode", "utf-16", // Unicode
            "unicodeFFFE", // Unicode (Big-Endian)
            "utf-7", "csUnicode11UTF7", "unicode-1-1-utf-7", "x-unicode-2-0-utf-7", // Unicode (UTF-7)
            "utf-8", "unicode-1-1-utf-8", "unicode-2-0-utf-8", "x-unicode-2-0-utf-8", // Unicode (UTF-8)
            "us-ascii", "ANSI_X3.4-1968", "ANSI_X3.4-1986", "ascii", "cp367", "csASCII", "IBM367", "ISO_646.irv:1991", "ISO646-US", "iso-ir-6us", // US-ASCII
            "windows-1258", // Vietnamese (Windows) 
            "ibm850", // Western European (DOS)
            "x-IA5", // Western European (IA5)
            "iso-8859-1", "cp819", "csISO", "Latin1", "ibm819", "iso_8859-1", "iso_8859-1:1987", "iso8859-1", "iso-ir-100", "l1", "latin1", // Western European (ISO)
            "macintosh", // Western European (Mac)
            "Windows-1252", "ANSI_X3.4-1968", "ANSI_X3.4-1986", "ascii", "cp367", "cp819", "csASCII", "IBM367", "ibm819", "ISO_646.irv:1991", "iso_8859-1", "iso_8859-1:1987", "ISO646-US", "iso8859-1", "iso-8859-1", "iso-ir-100", "iso-ir-6", "latin1", "us", "us-ascii", "x-ansi" // Western European (Windows)
            ];

        /**
         * Verifies if character is supported by Flash Player
         * @param charSetName Character Set name
         * @return true if Character Set is supporte
         *
         */
        public static function isSupportedCharSet( charSetName : String ):Boolean
        {
            return CharSetUtils.SUPPORTED_CHAR_SETS.indexOf(charSetName) > -1;
        }
    }
}

