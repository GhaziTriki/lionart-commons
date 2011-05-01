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
     * This class represenets "metadata" tag.
     * @author gtriki
     *
     */
    public class MetaDataAnnotation
    {
        private var _name : String;
        private var _arguments : Array;

        /**
         *
         * @param metaDataTag
         * @param buildArgs
         *
         */
        public function MetaDataAnnotation( metaDataTag : XML, buildArgs : Boolean = true )
        {
            _name = metaDataTag.@name;
            if (buildArgs)
            {
                buildArguments(metaDataTag);
            }
        }

        /**
         *
         * @return
         *
         */
        public function get defaultArgument() : MetaDataArgument
        {
            if (arguments.length > 0)
            {
                return arguments[0];
            }
            return null;
        }

        /**
         *
         * @param argumentName
         * @return
         *
         */
        public function hasArgument( argumentName : String ) : Boolean
        {
            return getArgument(argumentName) != null;
        }

        /**
         *
         * @param metaDataTag
         *
         */
        protected function buildArguments( metaDataTag : XML ) : void
        {
            _arguments = new Array();
            var args : XML = metaDataTag.arg;
            for (var i : int = 0; i < args.length(); i++)
            {
                _arguments.push(new MetaDataArgument(arguments[i]));
            }
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
         * @param argumentName
         * @return
         *
         */
        public function getArgument( argumentName : String ) : MetaDataArgument
        {
            var arguments : int = this.arguments.length;
            for (var i : int = 0; i < _arguments.length; i++)
            {
                if ((_arguments[i] as MetaDataArgument).key.toLowerCase() == argumentName.toLowerCase())
                {
                    return _arguments[i];
                }
            }
            return null;
        }

        /**
         *
         * @return
         *
         */
        public function get arguments() : Array
        {
            return _arguments;
        }

        /**
         *
         * @param metaDataAnnotation
         * @return
         *
         */
        public function equals( metaDataAnnotation : MetaDataAnnotation ) : Boolean
        {
            if (!metaDataAnnotation)
            {
                return false;
            }
            if (metaDataAnnotation.arguments.length != _arguments.length)
            {
                return false;
            }

            var areEqual : Boolean = this.name == metaDataAnnotation.name;
            if (areEqual)
            {
                if (_arguments.length > 0)
                {
                    for (var i : int = 0; i < _arguments.length; i++)
                    {
                        if (!MetaDataArgument(_arguments[i]).equals(metaDataAnnotation[i]))
                        {
                            areEqual = false;
                            break;
                        }
                    }
                }
            }
            return areEqual;

        }

    }
}


