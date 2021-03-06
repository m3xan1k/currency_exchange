## API to get currency exchange rate from Russian Central Bank

Build on RubyOnRails, PostgreSQL

```
Demo(not updated often, need paid account to connect heroku scheduler to run db update task):
```
https://infinite-hamlet-18303.herokuapp.com/

#### Job to update database and refresh currency rates

```
rake update_db
```

API supports two methods

### GET /currencies
Returns json of all available currencies

```
{"data"=>
  [{"id"=>1,
    "name"=>"Currency 1",
    "rate"=>91.0,
    "created_at"=>"2020-05-07T09:46:45.828Z",
    "updated_at"=>"2020-05-07T09:46:45.828Z"},
   {"id"=>2,
    "name"=>"Currency 2",
    "rate"=>72.0,
    "created_at"=>"2020-05-07T09:46:45.830Z",
    "updated_at"=>"2020-05-07T09:46:45.830Z"},
   {"id"=>3,
    "name"=>"Currency 3",
    "rate"=>64.0,
    "created_at"=>"2020-05-07T09:46:45.832Z",
    "updated_at"=>"2020-05-07T09:46:45.832Z"}]}
```

### GET /currency/:id
Returns single instance json

```
{
  "data": {
    "id": 1,
    "name": "Австралийский доллар",
    "rate": 47.52,
    "created_at": "2020-05-07T08:56:40.275Z",
    "updated_at": "2020-05-07T09:01:26.566Z"
  }
}
```
