# TTTApplication

Тестовое задание
---
https://github.com/tutu-ru/hire_ios-test

Коротко задача:
---
На первой: табличка с данными из любого источника, на второй: детали любой сущности с первого экрана. Должна быть работа с сетью и любой перститент

Реализация:
---
- Использован JSON из сети ("https://jsonplaceholder.typicode.com/users")
- С помощью URLSession и JSONDecoder данные из сети перенесены в модель UserModel
- Сохранение данных реализовано посредством UserDefaults с использованием JSONEncoder и JSONDecoder (сохраняется целиком экземпляр структуры модели)
- StoryBoards не использовались (интерфейс и переход через код)
