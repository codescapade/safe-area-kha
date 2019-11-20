/*
 * MIT License
 *
 * Copyright (c) 2019 Juriën Meerlo
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
 * Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
 * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH
 * THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

package safeArea;

#if sys_ios
@:headerCode('#include "SafeAreaK.h"')
#end

/**
 * Safe area class for iOS.
 */
class SafeArea {
  /**
   * Return the safe insets in pixels (maybe?).
   */
  #if sys_ios
	@:functionCode('return SafeAreaK::getInsets();')
	#end
  public static function getInsets(): Insets {
    #if sys_ios
    return Insets.create();
    #else
    // Return zero insets when not on iOS.
    return { top: 0, bottom: 0, left: 0, right: 0 };
    #end
	}
}

/**
 * Insets type.
 */
#if sys_ios
@:structAccess
@:native('SafeAreaK::Insets')
extern class Insets {
  public var top: Int;
  public var bottom: Int;
  public var left: Int;
  public var right: Int;

  @:native('SafeAreaK::Insets')
  public static function create(): Insets;
}
#else
typedef Insets = {
  var top: Int;
  var bottom: Int;
  var left: Int;
  var right: Int;
}
#end