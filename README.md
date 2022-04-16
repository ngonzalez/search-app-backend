# README

Ruby on Rails backend for Search App.

It includes a GraphQL API

![image](https://user-images.githubusercontent.com/26479/163653446-3cf3454a-6591-4504-8f02-c238aba4d811.png)

## API

```http
POST /graphql
```

| Parameter | Type | Description |
| :--- | :--- | :--- |
| `q` | `string` | Query string |
| `page` | `string` | **Optional** Current page |

## Response

```javascript
{
  "folders" : array,
  "loading" : boolean
  "errors" : array
  "current_page" : integer
  "total_pages" : integer
}
```

* Database creation
```shell
bundle exec rails db:create
```

* Database initialization
```shell
bundle exec rails db:migrate
```

* Start development server
```shell
bundle exec rails s
```
