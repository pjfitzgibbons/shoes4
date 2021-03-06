module Shoes
  module Swt
    module Common
      class Painter
        include Resource

        def initialize(obj)
          @obj = obj
        end

        def paint_control(event)
          gc = event.gc
          gcs_reset gc
          gc.set_antialias ::Swt::SWT::ON
          gc.set_transform(@obj.transform)
          fill_setup gc
          fill gc
          draw_setup gc
          draw gc
        end

        # Override in subclass if not using fill
        def fill_setup(gc)
          gc.set_background @obj.fill
          gc.set_alpha @obj.fill_alpha
        end

        # Implement in subclass
        def fill(gc)
        end

        # Override in subclass if not using draw
        def draw_setup(gc)
          gc.set_foreground @obj.stroke
          gc.set_alpha @obj.stroke_alpha
          gc.set_line_width @obj.strokewidth
        end

        # Implement in subclass
        def draw(gc)
        end
        
        def set_width_and_height
          @obj.width = @obj.opts[:width] || @obj.dsl.parent.width
          @obj.height = @obj.opts[:height] || @obj.dsl.parent.height
        end
      end
    end
  end
end
