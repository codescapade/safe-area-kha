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

#include <Foundation/Foundation.h>
#include <UIKit/UIKit.h>
#include "SafeAreaK.h"

namespace SafeAreaK {

  Insets::Insets() {
    left = 0;
    right = 0;
    top = 0;
    bottom = 0;
  }

  Insets getInsets() {
    Insets insets;

    // Safe area is only available on iOS 11 and later.
    if (@available(iOS 11, *)) {
      UIWindow *window = [[UIApplication sharedApplication] keyWindow];
      UIView *view = window.rootViewController.view;
      UIEdgeInsets safeAreaInsets = view.safeAreaInsets;
      
      // Insets are in screen pixels.
      insets.top = safeAreaInsets.top * view.contentScaleFactor;
      insets.bottom = safeAreaInsets.bottom * view.contentScaleFactor;
      insets.left = safeAreaInsets.left * view.contentScaleFactor;
      insets.right = safeAreaInsets.right * view.contentScaleFactor;
    }

    return insets;
  }
}
