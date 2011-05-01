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
package org.lionart.commons.lang
{
    import flash.utils.describeType;
    import flash.utils.getDefinitionByName;
    import flash.utils.getQualifiedClassName;

    import mx.utils.ObjectUtil;

    /**
     * A common base class of all ActionScript language enumeration types.
     * @author Ghazi Triki
     *
     */
    public class Enum
    {
        protected var _value : String;

        /**
         * Compares this enum value to the specified object.  The result is
         * true if and only if the argument is not null and is a String
         * object that represents the contains the same value.
         *
         * @param obj The object to compare this String against
         * @return true if the given object represents a String
         *          equivalent to this string, false otherwise
         *
         */
        public function equals( obj : * ) : Boolean
        {
            if (getQualifiedClassName(this) == getQualifiedClassName(obj))
            {
                return obj.valueOf() == _value;
            }
            else
            {
                return false;
            }
        }

        /**
         * Returns the string value of the Enum.
         * @return
         */
        public function getValue() : String
        {
            return _value;
        }

        /**
         * Returns the element names of this enum class or null if this
         * Class object does not represent an enum type.
         *
         * @param enumType A class that extends Enum.
         * @return an array containing the values comprising the enum class
         *     represented by this Class object in the order they're
         *     declared, or null if this Class object does not
         *     represent an enum type
         */
        public static function getEnumConstants( enumType : Class ) : Array
        {
            var enumConstants : Array = [];
            var xmlDescription : XML = describeType(enumType);
            if ( xmlDescription.factory.extendsClass[0].@type == "org.lionart.commons.lang::Enum" )
            {
                enumConstants = [];
                if (xmlDescription && xmlDescription.constant.length() > 0)
                {
                    for (var i : int = 0; i < xmlDescription.constant.length(); i++)
                    {
                        enumConstants.push(xmlDescription.constant[i].@name);
                    }
                }
                return enumConstants;
            }
            return null;
        }
    }
}

