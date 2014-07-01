module Nunchaku
  module CellHelper

    protected

    def masthead
      engine_cell(:masthead)
    end

    def footer
      engine_cell(:footer)
    end

    def engine_cell(cell, action=:show)
      render_cell "#{engine_name}/#{cell}", action

    rescue NameError
      render_cell "#{default_cell_engine_name}/#{cell}", action
    end

    def default_cell_engine_name
      'nunchaku'
    end

    def top_controller
      controller
    end

    def cell_div(options={}, &block)
      options.reverse_merge!(:class => "cell #{cell_id.idify}")
      content_tag(:div, options, &block)
    end

    def cell_id
      controller.class.name.gsub(/cell$/i, '').attrify
    end

    def cell_title(title, &block)
      content_tag(:div, :class => 'title') do
        h(2) {title.to_s} << (block.present? ? with_output_buffer(&block) : '')
      end
    end

    def cell_top(&block)
      content_tag(:div, :class => 'top', &block)
    end

    def cell_content(&block)
      content_tag(:div, :class => 'content', &block)
    end

    def cell_bottom(&block)
      content_tag(:div, :class => 'bottom', &block)
    end
  end
end
