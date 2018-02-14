# API

## Url:
```
https://i-api-example.herokuapp.com/
```
## Эндпоинты для категорий:

**Создать категорию:**
- name
```
POST https://i-api-example.herokuapp.com/api/v1/categories
```
```
curl -X POST -H 'Accept: application/json' -H 'Content-type: application/json' -d '{"name":"Candy"}' https://i-api-example.herokuapp.com/api/v1/categories
```
**Получить список категорий:**
```
GET https://i-api-example.herokuapp.com/api/v1/categories
```
```
curl -X GET https://i-api-example.herokuapp.com/api/v1/categories
```

**Получить список продуктов:**
- category_id
```
GET https://i-api-example.herokuapp.com/api/v1/categories/:category_id/products
```
```
curl -X GET https://i-api-example.herokuapp.com/api/v1/categories/1/products
```
**Создать продукт:**
- product
    - name
    - price

```
POST https://i-api-example.herokuapp.com/api/v1/categories/:category_id/products
```
```
curl -X POST -H 'Accept: application/json' -H 'Content-type: application/json' -d '{"product": {"name":"Box", "price":40}}' https://i-api-example.herokuapp.com/api/v1/categories/1/products
```
**Удалить продукт:**
- product_id
```
DELETE https://i-api-example.herokuapp.com/api/v1/products/:product_id
```
```
curl -X DELETE https://i-api-example.herokuapp.com/api/v1/products/2
```
