﻿#language: ru

@tree

Функционал: Прикрепление картинки к карточке товара

Как Менеджер по продажам я хочу
прикрепить изображение продаваемого товара к карточке товара в 1С 
чтобы однозначно идентифицировать реальный товар с карточкой в программе   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Прикрепление картинки к карточке товара
И я закрываю все окна клиентского приложения
И В командном интерфейсе я выбираю 'Продажи' 'Товары'
Тогда открылось окно 'Товары'
И я нажимаю на кнопку с именем 'ФормаСоздать'
Тогда открылось окно 'Товар (создание)'
И в поле с именем 'Наименование' я ввожу текст 'Изолента'
И я нажимаю кнопку выбора у поля с именем "ФайлКартинки"
Тогда открылось окно '1С:Предприятие'
И я нажимаю на кнопку с именем 'Button0'
Тогда открылось окно 'Товар (создание) *'
И я нажимаю на кнопку с именем 'ФормаЗаписать'
Тогда открылось окно 'Изолента (Товар)'
И я нажимаю кнопку выбора у поля с именем "ФайлКартинки"
Тогда открылось окно 'Файлы'
И я нажимаю на кнопку с именем 'ФормаСоздать'
Тогда открылось окно 'Файл (создание)'
И в поле с именем "Наименование" я ввожу текст "Изолента"
И я выбираю файл '$КаталогПроекта$\Изолента.png'
И я нажимаю на кнопку с именем 'ВыбратьФайлСДискаИЗаписать'
Тогда открылось окно 'Изолента (Файл)'
И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
И я жду закрытия окна 'Изолента (Файл)' в течение 20 секунд
Тогда открылось окно 'Файлы'
И я нажимаю на кнопку с именем 'ФормаВыбрать'
Тогда открылось окно 'Изолента (Товар) *'
И я нажимаю на кнопку с именем 'ФормаЗаписать'