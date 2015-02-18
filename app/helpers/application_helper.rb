module ApplicationHelper
  def prepare_text(message, query)
    simple_format(highlight(auto_link(message, :html => {target: '_blank'}) {|text| truncate(text, :length => 40)}, query), class: 'message')
  end
end
