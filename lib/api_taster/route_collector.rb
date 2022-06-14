module ApiTaster
  class RouteCollector
    cattr_accessor :routes
    self.routes = []

    def self.collect(path)
      Dir["#{path}/**/*.rb"].each { |file| load(file) }

      Route.mappings = Proc.new do
        RouteCollector.routes.each { |route| instance_eval(&route) }
      end
    end
  end
end
