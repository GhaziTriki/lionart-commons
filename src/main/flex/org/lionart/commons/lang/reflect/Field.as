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
    import org.lionart.commons.lang.reflect.metadata.MetaDataAnnotation;

    /**
     *
     * @author Ghazi Triki
     *
     */
    public class Field extends Object
    {
        private var _definedBy : Class;
        private var _isStatic : Boolean;
        private var _type : Class;
        private var _elementType : Class;
        private var _name : String;
        private var _metaData : Array;
        private var _isProperty : Boolean;

        /**
         *
         * @param xmlDesc
         * @param isStatic
         * @param isProperty
         *
         */
        public function Field( xmlDesc : XML, isStatic : Boolean, isProperty : Boolean )
        {
            _name = xmlDesc.@name;
            _type = Clazz.getClassFromName(xmlDesc.@type);
            _isStatic = isStatic;
            _isProperty = isProperty;
            buildMetaData(xmlDesc);
            return;
        }

        /**
         *
         * @param param1
         * @return
         *
         */
        public function hasMetaData( param1 : String ) : Boolean
        {
            return getMetaData(param1) != null;
        }

        /**
         *
         * @return
         *
         */
        public function get isProperty() : Boolean
        {
            return _isProperty;
        }

        /**
         *
         * @return
         *
         */
        public function get metadata() : Array
        {
            return _metaData;
        }

        /**
         *
         * @return
         *
         */
        public function get type() : Class
        {
            return _type;
        }

        /**
         *
         * @return
         *
         */
        public function get isStatic() : Boolean
        {
            return _isStatic;
        }

        /**
         *
         * @return
         *
         */
        public function get name() : String
        {
            return _name;
        }

        /**
         *
         * @param fieldXML
         *
         */
        private function buildMetaData( fieldXML : XML ) : void
        {
            var _loc_1 : XMLList = null;
            var _loc_2 : int = 0;
            if (fieldXML && fieldXML.metadata)
            {
                for (var i : int = 0; fieldXML.metadata.length(); i++)
                {
                    _metaData.push(new MetaDataAnnotation(fieldXML.metadata[i]));
                }
            }
        }

        /**
         *
         * @param param1
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
         * @return
         *
         */
        public function get elementType() : Class
        {
            if (_elementType)
            {
                return _elementType;
            }
            var metaDataAnnotation : * = getMetaData("ArrayElementType");
            if (metaDataAnnotation && metaDataAnnotation.defaultArgument && type == Array)
            {
                var meta : String;
                meta = metaDataAnnotation.defaultArgument.key;
                try
                {
                    _elementType = Clazz.getClassFromName(meta);
                }
                catch ( error : Error )
                {
                    trace("Cannot find specified ArrayElementType(" + meta + ") in SWF");
                }
            }
            return _elementType;
        }

    }
}


