module Nunchaku
  module ApplicationHelper
    include LocaleHelper
    include BootstrapHelper
    include IconsHelper
    include CellHelper

    protected

    def engine_name
      controller.class.name.deconstantize.downcase
    end
  end
end
