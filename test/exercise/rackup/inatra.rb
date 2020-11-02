module Inatra
  class << self
    def routes(&block)
      instance_eval(&block)
    end

    def call(env)
      method_name = env["REQUEST_METHOD"].downcase + env["PATH_INFO"]
      if methods[method_name].nil?
        not_found
      else
        methods[method_name].call
      end
    end

    private

    def method_missing(symbol, *args, &block)
      method_name = symbol.to_s + args[0]
      methods[method_name] = block
    end

    def not_found; [404, {}, ["Not Found"]] end

    def methods
      if @methods.nil?
        @methods = Hash.new
      end
      @methods
    end
  end
end
