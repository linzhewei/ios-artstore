class ViewProductScreen < PM::Screen
  title "Your title here"
  stylesheet ViewProductScreenStylesheet

  attr_accessor :product

  def on_load

    @layout = ProductShowLayout.new
    self.view = @layout.view
    @layout.add_constraints

    @title = @layout.get(:product_title)
    @title.text = @product.title

    @image = @layout.get(:product_image)
    @image.remote_image = product.image_url



    set_toolbar_items [{
        title: icon_image(:awesome, :shopping_cart, size: 20) ,
        action: :some_action
      }, {
        system_item: :flexible_space
      }, {
        title: icon_image(:awesome, :heart_o, size: 20) ,
        action: :some_other_action
    }]

  end

  def some_action
  end

  def some_other_action
  end


  # You don't have to reapply styles to all UIViews, if you want to optimize, another way to do it
  # is tag the views you need to restyle in your stylesheet, then only reapply the tagged views, like so:
  #   def logo(st)
  #     st.frame = {t: 10, w: 200, h: 96}
  #     st.centered = :horizontal
  #     st.image = image.resource('logo')
  #     st.tag(:reapply_style)
  #   end
  #
  # Then in will_animate_rotate
  #   find(:reapply_style).reapply_styles#

  # Remove the following if you're only using portrait
  def will_animate_rotate(orientation, duration)
    reapply_styles
  end
end
