## SimpleBlockChain

#### To install application you need run commands:

1. `git clone https://github.com/kortirso/simple_blockchain`.
2. `cd simple_blockchain`.
3. `bundle install`.
4. `yarn install`.
5. Rename application.yml.example to application.yml and fill with your secrets.
6. `rake db:create`.
7. `rake db:schema:load`.

#### To launch application:

1. In project folder run `foreman s`.
2. In project folder run `redis-server`.
3. In project folder run `sidekiq`.
4. Open `http://localhost:5000`.

#### To launch tests:

1. In project folder run `rspec`.
