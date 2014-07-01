module Nunchaku
  class BaseCell < Cell::Rails
    helper ApplicationHelper

    helper_method :parent_controller, :top_controller

    attr_accessor :args

    def show(**args)
      accessors_from(args)
      render
    end

    protected

    def top_controller
      controller.respond_to?(:parent_controller) ? controller.top_controller : controller
    end

    def accessors_from(args)
      self.args = args
      self.class.send(:attr_accessor, *(args.keys))
      self.class.send(:helper_method, *(args.keys))
      args.each { |k, v| send("#{k}=", v) }
    end
  end
end
