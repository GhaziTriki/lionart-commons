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
package org.lionart.commons.lang.reflect.utils
{
    import flash.utils.Dictionary;
    import flash.utils.getQualifiedClassName;

    import org.lionart.commons.lang.reflect.Clazz;
    import org.lionart.commons.lang.reflect.metadata.MetaDataAnnotation;
    import org.lionart.commons.lang.reflect.metadata.MetaDataArgument;

    /**
     *
     * @author Ghazi Triki
     *
     */
    public class ReflectionTools extends Object
    {
        private static var _cache : Dictionary = new Dictionary(false);

        /**
         * Return a class description with fields and metadata information.
         * @param clazz Class to parse.
         * @return a Clazz instance containting information about
         *
         */
        public static function getClass( clazz : Class ) : Clazz
        {
            var qualifiedName : String = getQualifiedClassName(clazz);
            if ( !_cache[qualifiedName] )
            {
                _cache[qualifiedName] = new Clazz(clazz);
            }
            return _cache[qualifiedName] as Clazz;
        }

        /**
         * Creates an instance of a given class from metadataAnnotation. The values of keys
         * in metadataAnnotation are copied to clazz instance properties.
         *
         * @param metadataAnnotation MetaDataAnnotation description to parse.
         * @param clazz the class to instanciate.
         * @return instance on clazz filled with metadata properties.
         *
         */
        public static function fillFromMetada( metadataAnnotation : MetaDataAnnotation, clazz : Class ) : Object
        {
            if ( metadataAnnotation.arguments && metadataAnnotation.arguments.length > 0 )
            {
                var instance : * = new clazz();
                for each( var arg : MetaDataArgument in metadataAnnotation.arguments )
                {
                    instance[arg.key] = arg.value;
                }
                return instance;
            }
            return null;
        }

    }
}


