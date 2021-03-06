module Nunchaku::ResourcesTabsHelper
  def tabs(resource)
    if resource.present?
      resource.class.ancestors.map(&:name).compact.each do |n|
        begin
          return render(tabs_location(n), :locals => { :resource => resource })
        rescue ActionView::MissingTemplate => e
        end
      end

      nil
    end
  end

  def tabs_location(name)
    "#{name.underscore.pluralize}/tabs"
  end

  def tab_to(*args, &block)
    options = args.extract_options!
    options[:class] =
      current_page?(*(block_given? ? args : (args.drop(1)))) ? "active" : nil

    content_tag(:li, link_to(*args << options, &block), options)
  end
end
