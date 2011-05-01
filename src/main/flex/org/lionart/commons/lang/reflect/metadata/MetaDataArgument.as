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
package org.lionart.commons.lang.reflect.metadata
{

    /**
     * This class represents an "arg" tag in of an actionscript metadata object description.
     *
     * @author Ghazi Triki
     *
     */
    public class MetaDataArgument
    {
        private var _key : String;
        private var _value : String;

        /**
         *
         * @param metadataArgNode Metadata "arg" XML node
         *
         */
        public function MetaDataArgument( metadataArgNode : XML )
        {
            _key = metadataArgNode.@key;
            _value = metadataArgNode.@value;
        }

        /**
         *
         * @return value of key property
         *
         */
        public function get key() : String
        {
            return _key;
        }

        /**
         *
         * @return value porperty
         *
         */
        public function get value() : String
        {
            return _value;
        }

        /**
         *
         * @param metaDataArg a MetaDataArgument object
         * @return true if metaDataArg is equal to the compared MetaDataArgument object
         *
         */
        public function equals( metaDataArg : MetaDataArgument ) : Boolean
        {
            return this.key == metaDataArg.key && this.value == metaDataArg.value;
        }

    }
}


