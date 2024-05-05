#language: ru

@tree

Функционал: Создание номенклатуры

Как тестироващик я хочу
заполнить справочник номенклатуры тестовыми данными 
чтобы подготовить базу для дальнейших сценариев   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Создание номенклатуры
И я запоминаю значение выражения "1" в переменную "шаг"
И я делаю 10 раз
	И я запоминаю значение выражения "$шаг$ + 1" в переменную "шаг"
	И я запоминаю значение выражения '"Номенклатура " + $шаг$' в переменную "НаименованиеНоменклатуры"
	И я проверяю или создаю для справочника "Items" объекты:
		| 'Ref'                                                              | 'DeletionMark' | 'Code' | 'ItemType'                                                          | 'Unit'                                                          | 'MainPricture'                          | 'Vendor' | 'ItemID' | 'PackageUnit' | 'Description_en' | 'Description_hash' | 'Description_ru'             | 'Description_tr' |
		| '{"e1cib/data/Catalog.Items?ref=" + StrReplace(New UUID, "-", "")}' | 'False'        |        | 'e1cib/data/Catalog.ItemTypes?ref=a6b718c04d8703fc11eebeba20afc72b' | 'e1cib/data/Catalog.Units?ref=a6b718c04d8703fc11eebeba20afc72c' | 'ValueStorage:AQEIAAAAAAAAAO+7v3siVSJ9' | ''       | ''       | ''            | ''               | ''                 | '$НаименованиеНоменклатуры$' | ''               |
	
	