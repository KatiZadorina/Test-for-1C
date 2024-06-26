﻿﻿#language: ru

@tree

Функционал: Проверка документа "Расход товара"

Как Тестировщик я хочу
проверить работоспособность документа "Расход товара" 
чтобы включить новый документ в релиз обновления   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Проверка заполнения "Расход товара"
* Заполнение шапки
	И В командном интерфейсе я выбираю 'Продажи' 'Документы продаж'
	Тогда открылось окно 'Документы продаж'
	И я нажимаю на кнопку с именем 'ФормаСоздатьПоПараметруРасходТовара'
	Тогда открылось окно 'Продажа товара (создание)'
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
	И я нажимаю кнопку выбора у поля с именем "Покупатель"
	Тогда открылось окно 'Контрагенты'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование'    |
		| '000000007' | 'Попов Б.В. ИЧП ' |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Продажа товара (создание) *'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Большой'
	И из выпадающего списка с именем "ВидЦен" я выбираю точное значение 'Оптовая'
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
* Заполнение табличной части
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Артикул' | 'Код'       | 'Наименование' |
		| 'Kros001' | '000000024' | 'Кроссовки'    |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Продажа товара (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '5 000,00'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '5,00'
	И я перехожу к следующему реквизиту
	Тогда таблица "Товары" стала равной:
		| 'N' | 'Товар'     | 'Цена'     | 'Количество' | 'Сумма'     |
		| '1' | 'Кроссовки' | '5 000,00' | '5,00'       | '25 000,00' |	
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	И я запоминаю значение поля с именем "Номер" как "$$НомерДокумента$$"
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Продажа *' в течение 20 секунд

Сценарий: Проверка движений "Расход товара"
* Открываем созданный документ продажи
	И В командном интерфейсе я выбираю 'Продажи' 'Документы продаж'
	Тогда открылось окно 'Документы продаж'
	И в таблице "Список" я перехожу к строке:
		| 'Номер'              | 'Тип документа' |
		| '$$НомерДокумента$$' | 'Продажа'       |
	И в таблице "Список" я выбираю текущую строку
* Проверка регистра "Регистр взаиморасчетов с контрагентами"
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр взаиморасчетов с контрагентами'
	Тогда таблица "Список" стала равной:
		| 'Номер строки' | 'Контрагент'      | 'Сумма'     | 'Валюта' |
		| '1'            | 'Попов Б.В. ИЧП ' | '25 000,00' | 'Рубли'  |			
* Проверка регистра "Регистр продаж"
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр продаж'
	Тогда таблица "Список" стала равной:
		| 'Номер строки' | 'Покупатель'      | 'Товар'     | 'Количество' | 'Сумма'     |
		| '1'            | 'Попов Б.В. ИЧП ' | 'Кроссовки' | '5,00'       | '25 000,00' |		
* Проверка регистра "Регистр товарных запасов"
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр товарных запасов'
	Тогда таблица "Список" стала равной:
		| 'Номер строки' | 'Товар'     | 'Склад'   | 'Количество' |
		| '1'            | 'Кроссовки' | 'Большой' | '5,00'       |	

Сценарий: Проверка печатной формы "Расходная товарная накладная"
* Открываем созданный документ продажи
	И В командном интерфейсе я выбираю 'Продажи' 'Документы продаж'
	Тогда открылось окно 'Документы продаж'
	И в таблице "Список" я перехожу к строке:
		| 'Номер'              | 'Тип документа' |
		| '$$НомерДокумента$$' | 'Продажа'       |
	И в таблице "Список" я выбираю текущую строку
* Формируем печатную форму
	И я нажимаю на кнопку с именем 'ФормаДокументРасходТовараПечатьРасходнойНакладной'
	Тогда табличный документ "SpreadsheetDocument" равен:
		| 'Расход товара' | ''                                           | ''           | ''       |
		| ''              | ''                                           | ''           | ''       |
		| 'Номер'         | '$$НомерДокумента$$'                         | ''           | ''       |
		| 'Дата'          | '*'                                          | ''           | ''       |
		| 'Покупатель'    | 'Попов Б.В. ИЧП '                            | ''           | ''       |
		| 'Склад'         | 'Большой'                                    | ''           | ''       |
		| 'Сумма'         | '25 000 рублей (Двадцать пять тысяч рублей)' | ''           | ''       |
		| 'Вес'           | ''                                           | ''           | ''       |
		| ''              | ''                                           | ''           | ''       |
		| 'Товар'         | 'Цена'                                       | 'Количество' | 'Сумма'  |
		| 'Кроссовки'     | '5 000'                                      | '5'          | '25 000' |
	