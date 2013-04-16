# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
module Admin::FieldGroupsHelper

  def field_group_subtitle(field_group)
    asset = field_group.klass_name.downcase
    html = t(field_group.name, :default => field_group.label)
    html << content_tag(:small, :id => "#{asset}_field_group_#{field_group.id}_intro") do
      if field_group.tag_id
        t(:field_group_tag_restriction, :assets => asset.pluralize, :tag => field_group.tag.try(:name))
      else
        t(:field_group_unrestricted, :assets => asset.pluralize)
      end
    end
    html.html_safe
  end

end
