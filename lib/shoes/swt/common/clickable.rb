module Shoes
  module Swt
    module Common
      module Clickable
        def clickable s, blk, flag = :click
          if blk
            ln = ::Swt::Widgets::Listener.new
            class << ln; self end.
            instance_eval do
              define_method :handleEvent do |e|
                mb, mx, my = e.button, e.x, e.y
                blk[mb, mx, my] if s.left <= mx and mx <= s.left + s.width and s.top <= my and my <= s.top + s.height
              end
            end
            s.app.gui.real.addListener ::Swt::SWT::MouseDown, ln if flag == :click
            s.app.gui.real.addListener ::Swt::SWT::MouseUp, ln if flag == :release
          end
        end
      end
    end
  end
end
