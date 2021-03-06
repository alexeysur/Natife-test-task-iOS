Тестовое задание для iOS

Необходимо написать приложение, которое загружает с сервера ряд данных в JSON формате, обрабатывает их и отображает на экране. Приложение должно иметь две основные функции:
1. Просмотр ленты постов (экран ленты), не требуется отображение никаких картинок;
2. Просмотр выбранного поста (экран поста), есть картинки для отображения.
Функции ленты постов:
1. Сортировка ленты по дате (локальная);
2. Сортировка ленты по рейтингу (локальная);
3. В ячейке поста не поместится весь краткий текст поста, поэтому следует
отобразить только 2 строки текста, элемент “Читать далее”, по которому отобразится полный краткий текст в ленте (не конкретный пост, а именно полный текст вступительного абзаца);
4. Тап на конкретный пост открывает экран выбранного поста.
Функции экрана постов:
1. Отображение текста поста;
2. Отображение после текста поста картинок к посту.
Особенности:
1. Дефолтный порядок постов в ленте задается сервером; сортировка по дате или
рейтингу должна применяться только пользователем вашего приложения;
2. Архитектура(MVP, MVVM, MVI, VIPER) и выбор библиотек на ваш выбор, без
ограничений.
3. Использовать Dependency injection (Swinject, Typhoon) (не обязательно но будет
являться плюсом)
 API
Метод
Описание
https://raw.githubusercontent.com/ aShaforostov/jsons/master/api/main.json
  Метод для загрузки ленты постов
https://raw.githubusercontent.com/ aShaforostov/jsons/master/api/posts/[id].json
  Метод для загрузки конкретного поста по его ID
 Особенности iOS
Приложение для iOS 13 / SDK13 (приложение также должно стабильно работать на iOS 11 и iOS 12), приложение должно поддерживать все размеры экранов iPhone (4”, 4.7”, 5.5” и т.д.), иметь только портретную ориентацию.
Язык — Swift (последняя публичная стабильная версия).
