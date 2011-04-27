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
    import flexunit.framework.TestCase;

    import org.flexunit.asserts.assertFalse;
    import org.flexunit.asserts.assertTrue;

    public class TestCharSetUtils extends TestCase
    {
        private var charSets : Vector.<String>;

        override public function setUp() : void
        {
            super.setUp();
            charSets = new Vector.<String>();
            charSets.push("DOS-720","cp1256","HKSCS");
        }

        override public function tearDown() : void
        {
            super.tearDown();
        }

        public function testIsSupportedCharSet() : void
        {
            assertTrue(CharSetUtils.isSupportedCharSet(charSets[0]));
            assertTrue(CharSetUtils.isSupportedCharSet(charSets[1]));
            assertFalse(CharSetUtils.isSupportedCharSet(charSets[2]));
        }

    }
}

