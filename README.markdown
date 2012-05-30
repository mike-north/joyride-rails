Joyride
=========

Build easy feature tours, thanks to [ZURB's joyride plugin](http://www.zurb.com/playground/jquery-joyride-feature-tour-plugin)

Setup
------
- You must include the proper script and style assets
    - Javascript
    <br><code>//= require joyride/joyride</code>
    - CSS
    <br><code>*= require joyride/joyride</code>

Basic Usage
------------


        = joyride :chooseID, :cookie => false do |j|
          = j.step :section1, "This is the first step"
          = j.step :section2, "This is the second step"

The <code>:cookie</code> option controls whether or not a cookie is checked before showing the tour (meaning if it is set to false, the tour will always run)

The first argument of each <code>step</code> must be the id of whatever element it should be anchored to