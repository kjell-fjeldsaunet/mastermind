# frozen_string_literal: true

# Class will render a spinning symbol on screen while waiting for something to load
class LoadingScreen
  CHARS = %w[/ - \\ |].freeze
  def self.show_loading_dots(fps = 10)
    delay = 1.0 / fps
    iter = 0
    spinner = Thread.new do
      while iter # Keep spinning until told otherwise
        print CHARS[(iter += 1) % CHARS.length]
        sleep delay
        print "\b"
      end
    end
    yield.tap do # After yielding to the block, save the return value
      iter = false   # Tell the thread to exit, cleaning up after itself
      spinner.join   # and wait for it to do so. Use the block's return value as the method's
    end
  end
end
