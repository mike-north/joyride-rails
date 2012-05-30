module Joyride
  module ActionViewExtensions
    include ActionView::Helpers::TagHelper

    def self.default_options
      @@default_options ||= {animation: :pop}
    end

    def joyride(id, options,&block)
      if options[:html] == nil
        options[:html] = {}
      end
      opts    = Joyride::ActionViewExtensions::default_options.merge(options)
      opts_from_helper = {}
      if opts[:tip_class]
        opts_from_helper[:class] = opts[:tip_class]
      end
      builder = Joyride::TourBuilder.new(opts_from_helper)
      output  = capture(builder, &block)

      class_str = !options[:html] || !options[:html][:class] ? "_joyride_tour" : "#{options[:html].delete(:class)} _joyride_tour"

      mandatory_options = {:id => id, :class => class_str}
      ht_opts = options[:html] ? mandatory_options.merge(options[:html]) : mandatory_options

      use_cookie = options[:cookie] != nil && options[:cookie] == true
      if use_cookie
        ht_opts['data-cookie-enabled'] = true
      end
      ht_opts['data-animation'] = opts[:animation]
      if opts[:post_tour_callback]
        ht_opts['data-post-tour-callback'] = opts[:post_tour_callback]
      end
      if opts[:post_step_callback]
        ht_opts['data-post-step-callback'] = opts[:post_step_callback]
      end

      content_tag(:ol,output,ht_opts)
      #.concat(content_tag(:script,"$(window).load(function() { $(this).joyride({\'tipContent\': \'#{id}\', 'tipAnimation': \'#{opts[:animation]}\'}); });".html_safe,:type => "text/javascript"))
    end
  end

  class TourBuilder
    include ActionView::Helpers::TagHelper

    def initialize(opts_from_helper)
      @@class_to_apply_to_all = opts_from_helper[:class] ? opts_from_helper[:class] : ""
    end

    def step(*args)
      opts = args.extract_options!

      html_opts = opts[:html] ? opts[:html] : {}
      html_opts['data-id'] = args[0]

      if html_opts[:class]
        html_opts[:class] = "#{@@class_to_apply_to_all} #{html_opts[:class]}"
      else
        html_opts[:class] = @@class_to_apply_to_all
      end

      content_tag(:li,args[1],html_opts)
    end
  end
end