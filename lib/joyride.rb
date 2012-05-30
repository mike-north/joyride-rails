require "joyride/engine"
require "joyride/action_view_extensions"

module Joyride
end

ActionView::Base.send :include, Joyride::ActionViewExtensions
