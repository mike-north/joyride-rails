Joyride
=========

Build easy feature tours, thanks to [ZURB's joyride plugin](http://www.zurb.com/playground/jquery-joyride-feature-tour-plugin)

See a live demo [here](http://joyride-rails-demo.herokuapp.com/)

Setup
------
You must include the proper script and style assets

        //= require joyride/joyride
and    
        
        *= require joyride/joyride

Basic Usage
------------


        = joyride :chooseID, :cookie => false do |j|
          = j.step :section1, "This is the first step"
          = j.step :section2, "This is the second step"

The <code>:cookie</code> option controls whether or not a cookie is checked before showing the tour (meaning if it is set to false, the tour will always run)

The first argument of each <code>step</code> must be the id of whatever element it should be anchored to

Customization
-------------

### Look and feel
The tour steps can be customized by applying a CSS class to the tips. Included with the gem is a <code>bootstrap_tour</code> class that (sort of) matches the twitter bootstrap look and feel
  
        = joyride :chooseID, :tip_class => "bootstrap_tour" do |j|
          = j.step :section1, "This is the first step"
          = j.step :section2, "This is the second step", :html => {:class => "my_custom_tip"}
Additionally, an idividual tip can be customized using the <code>:html</code> argument, as shown above

### Callbacks
Javascript callbacks can be added for each step (called as each tour step is rendered), or for the tour as whole (called when the entire tour is finished)

        = joyride :chooseID, 
                  :after_step_callback => "alert('step')",
                  :after_tour_callback => "alert('done!')" do |j|
          = j.step :section1, "This is the first step"
          
### Animation
An <code>:animation</code> parameter can be applied to the tour as a whole; valid values are <code>:pop</code> (default) and <code>:fade</code>.
        
        = joyride :chooseID, :animation => :fade do |j|
          = j.step :section1, "This is the first step"