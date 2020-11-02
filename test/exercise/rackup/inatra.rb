module Inatra
  class << self
    def routes(&block)
      instance_eval(&block)
    end

    def call(env)
      method_name = env["REQUEST_METHOD"].downcase + env["PATH_INFO"]
      if @@routes[method_name].nil?
        not_found
      else
        @@routes[method_name].call
      end
    end

    private

    @@routes = Hash.new

    def method_missing(symbol, *args, &block)
      method_name = symbol.to_s + args[0]
      @@routes[method_name] = block
    end

    def not_found; [404, {}, ["Not Found"]] end
  end
end
