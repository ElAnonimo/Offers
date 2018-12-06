# Offers
Использована MVC архитектура и сервисный слой. Реализован обмен данными с БД MySQL через веб интерфейс. Запросы к БД осуществляются на Hibernate Query Language. Интерфейс позволяет создавать аккаунты пользователей, их предложения и сообщения им и сохранять их в БД c
валидацией данных. Валидация осуществлена по группам для данных, сохраняемых в БД и для сообщаемых через веб форму. Пользователь, прошедший аутентификацию как администратор, имеет доступ к странице с информацией, недоступной другим пользователям. Пароли хранятся в зашифрованном виде. Доступ пользователя к веб страницам сохраняется через функционал remember-me. Зарегистрированные пользователи также могут обмениваться сообщениями без доступа к БД при помощи AJAX, количество сообщений отображается на веб странице в счётчике, периодически
обновляемом при помощи jQuery. Управление веб страницами осуществлено через Tiles и Webflow.
Работа DAO классов проверяется тест-классами посредством JUnit в тестовом профиле.
Логи сервера отображены на уровне info посредством log4j.

This applications lists offers by web developers.
The architecture of choice is MVC used along with a service layer. The implemented data exchange enables Hibernate Query Language SQL queries from a web page.
The user can create a profile, post offers, exchange messages, validate and store those to the database. To access the administrator web page inaccessible to regular users the user can be assigned the administrator role. Remember-me allows to persist the user while browsing the web pages.
The application allows the users to exchange messages quicker via AJAX without having to store them to the database. The user page displays the message counter.
The web pages are managed via Tiles and Webflow.
The application test profile allows DAO class components testing.
The application logging is implemented with log4j.
