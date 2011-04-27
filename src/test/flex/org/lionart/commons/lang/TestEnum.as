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
    import flexunit.framework.TestCase;

    public class TestEnum extends TestCase
    {
        public function TestEnum(methodName:String=null)
        {
            super(methodName);
        }

        override public function setUp() : void
        {
            super.setUp();
        }

        override public function tearDown() : void
        {
            super.tearDown();
        }

        public function testEnum() : void
        {
            assertFalse(ASType.STRING.equals(ASType.DATE));
            assertFalse(ASType.BOOLEAN.equals(ASType.DATE));
            assertFalse(JavaType.DATE.equals(JavaType.BOOLEAN));
            assertFalse(JavaType.BOOLEAN.equals(JavaType.STRING));
            assertFalse(ASType.BOOLEAN.equals(JavaType.BOOLEAN));
            assertFalse(ASType.DATE.equals(JavaType.DATE));
            assertFalse(ASType.STRING.equals(JavaType.STRING));
            assertTrue(ASType.STRING.getValue() == "String");
            assertTrue(JavaType.STRING.getValue() == "String");
            assertTrue(ASType.DATE.getValue() == "Date");
            assertTrue(JavaType.DATE.getValue() == "Date");
            assertTrue(ASType.BOOLEAN.getValue() == "Boolean");
            assertTrue(JavaType.BOOLEAN.getValue() == "Boolean");
        }

    }
}


