#language: ru
@tree


Функционал: _021 ограничение доступа с помощью параметров

Как пользователь
Я хочу ограничить доступ по реквизитам объектов в режиме предприятия
Для настройки прав доступа


Контекст:
    Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий


Сценарий: _021001 создание параметров
    * Открытие справочника создания параметров
        И В командном интерфейсе я выбираю 'Система доступа' 'Параметры'
    * Создание нового параметра по CustomerTrue
        И я нажимаю на кнопку 'Создать'
        И в поле 'Наименование' я ввожу текст 'ПомеченНаУдаление'
        И я нажимаю кнопку выбора у поля "Тип данных"
        И в таблице "" я перехожу к строке:
            | ''         |
            | 'Булево' |
        И я нажимаю на кнопку 'ОК'
        И из выпадающего списка "Значение данных" я выбираю точное значение 'Нет'
        И я нажимаю на кнопку 'Записать и закрыть'
    * Проверка сохранения элемента
        Тогда таблица  "Список" содержит строки:
        | 'Наименование' |
        | 'ПомеченНаУдаление'    |
        И я закрыл все окна клиентского приложения

Сценарий: _021002 проверка графического интерфейса работы с параметром
    * Открытие перечня ролей
        И я открываю навигационную ссылку 'e1cib/list/Справочник.Roles_AccessRoles'
    * Создание новой роли путем копирования
        И в таблице "List" я перехожу к строке:
            | 'Наименование'             |
            | 'Роль1'                    |
        И в таблице "List" я нажимаю на кнопку с именем 'ListКонтекстноеМенюСкопировать'
    * Проверка открытия окна добавления параметра
        И я перехожу к закладке "Матрица"
        И в таблице "RolesEdit" я перехожу к строке:
            | 'Объект'         |
            | 'Справочник' |
        И в таблице "RolesEdit" я разворачиваю текущую строку
        И в таблице "RolesEdit" я перехожу к строке:
            | 'Объект'         |
            | 'Справочник1' |
        И в таблице "RolesEdit" я активизирую поле "Изменение"
    * Проверка открытия окна установки ограничения по параметру
        И в таблице "RolesEdit" я нажимаю на кнопку 'Добавить ограничение'
        И в таблице "RestrictionByConditionMatrix" я перехожу к первой строке
        И в таблице "RestrictionByConditionMatrix" я нажимаю кнопку выбора у реквизита с именем "RestrictionByConditionMatrixFilterData"
        И в таблице "SettingsComposerSettingsFilterFilterAvailableFields" я перехожу к строке:
            | 'Доступные поля'   |
            | 'Пометка удаления' |
        И в таблице "SettingsComposerSettingsFilterFilterAvailableFields" я выбираю текущую строку
        И в таблице "SettingsFilter" я разворачиваю текущую строку
        И в таблице "SettingsFilter" я перехожу к строке:
            | 'Вид сравнения' | 'Использование' | 'Поле'             | 'Применение' | 'Режим отображения' |
            | 'Равно'         | 'Да'            | 'Пометка удаления' | 'Обычное'    | 'Быстрый доступ'    |
        И в таблице "SettingsFilter" я активизирую поле с именем "SettingsFilterПравоеЗначение"
        И в таблице "SettingsFilter" я выбираю текущую строку
        И в таблице "SettingsFilter" из выпадающего списка с именем "SettingsFilterПравоеЗначение" я выбираю точное значение 'Параметры.Помечен на удаление'
    * Проверка перехода по вкладкам и формирования отчета
        Тогда таблица "SettingsComposerSettingsFilterFilterAvailableFields" стала равной:
            | 'Доступные поля'              |
            | 'Версия данных'               |
            | 'Имя предопределенных данных' |
            | 'Код'                         |
            | 'Наименование'                |
            | 'Пометка удаления'            |
            | 'Предопределенный'            |
            | 'Реквизит1'                   |
            | 'Ссылка'                      |
            | 'Параметры'                   |
        И я перехожу к закладке "Параметры"
        И я перехожу к закладке "Отчет"
        И я нажимаю на кнопку 'Сформировать'
        Тогда     табличный документ "TabDoc" равен по шаблону:
            | 'Отбор:'        | 'Пометка удаления Равно Параметры.Помечен на удаление' | ''          | ''                         | ''                 | ''                 | ''                         | ''                         |
            | ''              | ''                                                     | ''          | ''                         | ''                 | ''                 | ''                         | ''                         |
            | 'Версия данных' | 'Имя предопределенных данных'                          | 'Код'       | 'Наименование'             | 'Пометка удаления' | 'Предопределенный' | 'Реквизит1'                | 'Ссылка'                   |
            | '*'             | ''                                                     | '000000001' | 'Элемент №1 Справочника 1' | 'Нет'              | 'Нет'              | 'Элемент №1 Справочника 2' | 'Элемент №1 Справочника 1' |
            | '*'             | ''                                                     | '000000002' | 'Элемент №2 Справочника 1' | 'Нет'              | 'Нет'              | 'Элемент №2 Справочника 2' | 'Элемент №2 Справочника 1' |
            | '*'             | ''                                                     | '000000003' | 'Элемент №3 Справочника 1' | 'Нет'              | 'Нет'              | 'Элемент №3 Справочника 2' | 'Элемент №3 Справочника 1' |
        И я перехожу к закладке с именем "GroupFilter"
        И я нажимаю на кнопку 'ОК'
    * Заполнение наименования и синонима роли
            И в поле 'Имя' я ввожу текст 'РольОграничениеПоПараметру'
            И я перехожу к закладке "Наименования"
            И в таблице "LangInfo" я нажимаю на кнопку с именем 'LangInfoДобавить'
            И в таблице "LangInfo" в поле 'Код языка' я ввожу текст 'ru'
            И в таблице "LangInfo" я завершаю редактирование строки
            И в таблице "LangInfo" я активизирую поле "Описание на языке"
            И в таблице "LangInfo" я выбираю текущую строку
            И в таблице "LangInfo" в поле 'Описание на языке' я ввожу текст 'Тестовая роль с ограничением по параметру'
            И в таблице "LangInfo" я завершаю редактирование строки
    * Добавление доступа к реквизитам справочника 1
        И я меняю значение переключателя 'Показать' на 'Все объекты'
        И я нажимаю на кнопку 'Обновить права'
        И Пауза 5
        И в таблице "RolesEdit" я разворачиваю строку:
            | 'Объект'  |
            | 'Справочник' |
        И в таблице "RolesEdit" я разворачиваю строку:
            | 'Объект'  |
            | 'Справочник1' |
        И в таблице "RolesEdit" я перехожу к строке:
            | 'Объект'       |
            | 'StandardAttribute' |
        И в таблице "RolesEdit" я активизирую поле "Просмотр"
        И в таблице "RolesEdit" я выбираю текущую строку
        И в таблице "RolesEdit" я активизирую поле "Редактирование"
        И в таблице "RolesEdit" я выбираю текущую строку
        И в таблице "RolesEdit" я перехожу к строке:
            | 'Объект'       |
            | 'Реквизит' |
        И в таблице "RolesEdit" я активизирую поле "Просмотр"
        И в таблице "RolesEdit" я выбираю текущую строку
        И в таблице "RolesEdit" я активизирую поле "Редактирование"
        И в таблице "RolesEdit" я выбираю текущую строку
    И я нажимаю на кнопку 'Записать и закрыть'
    И я закрыл все окна клиентского приложения
