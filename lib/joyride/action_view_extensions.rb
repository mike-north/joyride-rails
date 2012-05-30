module Joyride
  module ActionViewExtensions
    include ActionView::Helpers::TagHelper

    def self.default_options
      @@default_options ||= {:html => {}}
    end

    def joyride(*args, &block)
      options = args.extract_options!
      opts    = Joyride::ActionViewExtensions::default_options.merge(options)
      builder = Joyride::TourBuilder.new
      output  = capture(builder, &block)

      class_str = !options[:html] || !options[:html][:class] ? "_joyride_tour" : "#{options[:html].delete(:class)} _joyride_tour"

      mandatory_options = {:id => args[0], :class => class_str}
      ht_opts = options[:html] ? mandatory_options.merge(options[:html]) : mandatory_options

      use_cookie = options[:cookie] != nil && options[:cookie] == true
      if use_cookie
        ht_opts['data-cookie-enabled'] = true
      end

      content_tag(:ol,output,ht_opts).concat(content_tag(:script,"$(window).load(function() { $(this).joyride({\'tipContent\': \'#{args[0]}\'}); });".html_safe,:type => "text/javascript"))
    end
  end

  class TourBuilder
    include ActionView::Helpers::TagHelper
    def step(*args)
      opts = args.extract_options!
      content_tag(:li,args[1],'data-id' => args[0])
    end
  end
end