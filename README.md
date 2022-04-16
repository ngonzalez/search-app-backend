# search-app-backend

Ruby on Rails backend for Search App. It includes a GraphQL API with paginated results.

![image](https://user-images.githubusercontent.com/26479/163653446-3cf3454a-6591-4504-8f02-c238aba4d811.png)

## API

```http
POST /graphql
```

| Parameter | Type | Description |
| :--- | :--- | :--- |
| `q` | `string` | Query string |
| `page` | `string` | Current page |

## Mutation

```graphql
  mutation search(
    $q: String!,
    $page: Int!,
  ) {
    search(input: {
      q: $q,
      page: $page,
    }) {
      folders {
        id
        dataUrl
        name
      }
      loading
      errors
      currentPage
      totalPages
    }
  }
```

## Response

```javascript
{
  "folders" : Array[{
    "id" : String
    "dataUrl" : String
    "name" : String
  }],
  "loading" : Boolean
  "errors" : Array
  "current_page" : Integer
  "total_pages" : Integer
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
