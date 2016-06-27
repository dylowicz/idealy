namespace :test do
  desc "Run all tests"
  task all: :environment do
    sh %{ rails test:unit }
    sh %{ rails test:component }
    sh %{ rails test:acceptance }
    sh %{ rails test:security }
  end

  desc "Run unit tests"
  task unit: :environment do
    sh %{ rspec spec/models spec/helpers }
  end

  desc "Run component tests"
  task component: :environment do
    sh %{ rspec spec/controllers spec/serializers }
    sh %{ npm test }
  end

  desc "Run acceptance tests"
  task acceptance: :environment do
    sh %{ rails server --environment test -d }
    sh %{ rspec spec/acceptance }
    sh %{ kill -9 `cat tmp/pids/server.pid` }
  end

  desc "Run security tests"
  task security: :environment do
    sh %{ brakeman }
  end
end
