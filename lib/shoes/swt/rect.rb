module Shoes
  module Swt
    class Rect
      include Common::Fill
      include Common::Stroke
      include Common::Move
      include Common::Clickable

      def initialize(dsl, app, left, top, width, height, opts = {}, &blk)
        @dsl = dsl
        @app = app
        @left = left
        @top = top
        @width = width
        @height = height
        @opts = opts
        @corners = opts[:corners] || 0

        # Move
        @container = @app.real

        @painter = Painter.new(self)
        @app.add_paint_listener @painter
        clickable dsl, blk
      end

      attr_reader :dsl
      attr_reader :transform
      attr_reader :painter
      attr_reader :left, :top, :width, :height
      attr_reader :corners

      class Painter < Common::Painter
        include Common::Resource

        def fill(gc)
          gc.fill_round_rectangle(@obj.left, @obj.top, @obj.width, @obj.height, @obj.corners, @obj.corners)
        end

        def draw(gc)
          gc.draw_round_rectangle(@obj.left, @obj.top, @obj.width, @obj.height, @obj.corners, @obj.corners)
        end
      end
    end
  end
end
