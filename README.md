# search-app-backend

```
Author: Nicolas Gonzalez
License: MIT
```

Ruby on Rails backend application. It includes a GraphQL search API with paginated results.

![image](https://user-images.githubusercontent.com/26479/163653446-3cf3454a-6591-4504-8f02-c238aba4d811.png)

## GraphQL API

```http
POST /graphql
```

| Parameter | Type | Description |
| :--- | :--- | :--- |
| `q` | `string` | Query string |
| `page` | `int` | Current page |

## GraphQL Mutation

```graphql
  mutation search(
    $q: String!,
    $page: Int!,
  ) {
    search(input: {
      q: $q,
      page: $page,
    }) {
      results {
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

## Rails application

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
