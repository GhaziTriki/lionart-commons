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
package org.lionart.commons.lang.data
{
    import org.lionart.commons.lang.Enum;

    /**
     * The SQL data types that are supported. These are basically an enumeration of the constants in java.sql.Types.
     *
     * @author Ghazi Triki
     */
    public final class ASType extends Enum
    {
        public static const STRING : ASType = new ASType("String");

        public static const DATE : ASType = new ASType("Date");

        public static const BOOLEAN : ASType = new ASType("Boolean");

        public function ASType( value : String )
        {
            _value = value;
        }

    }
}

