module ApplicationHelper
  def svg name, options={}
    file = File.read("#{Rails.root}/app/assets/images/#{name}.svg")
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    svg['id'] = options[:id] if options[:id].present?
    svg['class'] = options[:class] if options[:class].present?
    svg['width'] = options[:width] if options[:width].present?
    svg['height'] = options[:height] if options[:height].present?
    doc.to_html.html_safe
  end
end
