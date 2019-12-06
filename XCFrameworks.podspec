Pod::Spec.new do |s|
    s.name         = "XCFrameworks"
    s.version      = "1.0.0"
    s.summary      = "XCFramework TEST"
    s.homepage     = "https://github.com/bielikb/xcframeworks"
    s.license      = {
    :type => 'Copyright',
    :text => <<-LICENSE
    The MIT License
	Copyright (c) 2010-2019 Google, Inc. http://angularjs.org

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in
	all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
	THE SOFTWARE.
        LICENSE
    }
    s.author       = 'Boris Bielik'
    s.source       = { :git => "git@github.com:bielikb/xcframeworks.git", :tag => s.version.to_s }
    s.platform     = :ios, '12.0'
    s.requires_arc = true
    s.default_subspecs = 'XCFRAMEWORK'

    s.subspec 'XCFRAMEWORK' do |ss|
        ss.ios.vendored_frameworks = 'Products/xcframeworks/DynamicFramework.xcframework'
        ss.preserve_paths = 'Products/xcframeworks/DynamicFramework.xcframework'
    end
end
