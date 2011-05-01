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
package org.lionart.commons.lang.reflect
{
    import flash.utils.Dictionary;
    import flash.utils.describeType;
    import flash.utils.getDefinitionByName;

    import org.lionart.commons.lang.reflect.metadata.MetaDataAnnotation;

    /**
     * A represntation on an ActionScript Class. Object is scanned using describeType
     * and properties are then filled.
     * @author Ghazi Triki
     *
     */
    public class Clazz extends Object
    {
        private var _packageName : String;
        private var _classDefinition : Class;
        private var _fields : Array;
        private var _fieldsLength : int;
        private var _name : String;
        private var _metaData : Array;
        private var _metadatasLength : int;
        private static var metaDataCache : Dictionary = new Dictionary();

        /**
         * @param clazzToScan class type to scan
         */
        public function Clazz( clazzToScan : Class )
        {
            if (clazzToScan)
            {
                var classXML : XML;
                classXML = describeType(clazzToScan);
                _name = classXML.@name;
                _packageName = name.substr(0, name.indexOf("::"));
                _classDefinition = clazzToScan;
                buildFields(classXML);
                buildMetaData(classXML);
            }
        }

        /**
         * @return The name of the class
         */
        public function get name() : String
        {
            return _name;
        }

        /**
         * @return The metadata array of the class
         */
        public function get metadata() : Array
        {
            return _metaData;
        }

        /**
         * @return The package name of the class
         */
        public function get packageName() : String
        {
            return _packageName;
        }

        /**
         * @return The class defintion
         */
        public function get classDefinition() : Class
        {
            return _classDefinition;
        }

        /**
         *
         * @return
         *
         */
        public function get fields() : Array
        {
            return _fields;
        }

        /**
         *
         * @param fieldName
         * @return
         *
         */
        public function getField( fieldName : String ) : Field
        {
            for (var i : int = 0; i < _fields.length; i++)
            {
                if (Field(fields[i]).name == fieldName)
                {
                    return fields[i];
                }
            }
            return null;
        }

        /**
         *
         * @param classXML
         *
         */
        private function buildFields( classXML : XML ) : void
        {
            var i : int = 0;
            _fields = new Array();

            var xmlNodes : XML = classXML.factory.variable;
            for (i; i < xmlNodes.length(); i++)
            {
                _fields.push(new Field(xmlNodes[i], false, false));
            }

            xmlNodes = classXML.variable;
            for (i = 0; i < xmlNodes.length(); i++)
            {
                _fields.push(new Field(xmlNodes[i], true, false));
            }

            xmlNodes = classXML.factory.accessor;
            for (i = 0; i < xmlNodes.length(); i++)
            {
                _fields.push(new Field(xmlNodes[i], true, true));
            }
        }

        /**
         *
         * @param metaDataName
         * @return
         *
         */
        public function hasMetaData( metaDataName : String ) : Boolean
        {
            return getMetaData(metaDataName) != null;
        }

        /**
         *
         * @param metaDataName
         * @return
         *
         */
        public function getMetaData( metaDataName : String ) : MetaDataAnnotation
        {
            for (var i : int = 0; i < _metaData.length; i++)
            {
                if ((metadata[i] as MetaDataAnnotation).name == metaDataName)
                {
                    return metadata[i];
                }
            }
            return null;
        }

        /**
         *
         * @param classXML
         *
         */
        private function buildMetaData( classXML : XML ) : void
        {
            var metaDataList : XMLList;
            var metaDataAr : * = new Array();
            if (classXML.factory && classXML.factory[0] && XML(classXML.factory[0]).metadata)
            {
                metaDataList = XML(classXML.factory[0]).metadata;
                for (var i : int = 0; i < metaDataList.length(); i++)
                {
                    _metaData.push(new MetaDataAnnotation(metaDataList[i]));
                }
            }
        }

        /**
         *
         * @param param1
         * @return
         *
         */
        public static function getClassFromName( param1 : String ) : Class
        {
            var dottedName : String = getDotPathFromName(param1);
            if (dottedName == "void" || dottedName == "*" || dottedName == "Object")
            {
                return null;
            }
            return getDefinitionByName(dottedName) as Class;
        }

        /**
         *
         * @param param1
         * @return
         *
         */
        private static function getDotPathFromName( param1 : String ) : String
        {
            var regExp : RegExp = /::""::/g;
            param1 = param1.replace(regExp, ".");
            return param1;
        }

    }
}


