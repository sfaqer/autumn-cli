#Использовать autumn
#Использовать asserts
#Использовать ".."
#Использовать "."
#Использовать "./Моки"

Функция ПолучитьПоделку()
	Поделка = Новый Поделка();
	Поделка.ПросканироватьКаталог("tests/Классы");
	Поделка.ДобавитьРогатку(Тип("МокРогатки"));
	Возврат Поделка;
КонецФункции

&Тест
Процедура ПолучениеКомандыПоИмени() Экспорт

	// Дано

	Поделка = ПолучитьПоделку();
	Поделка.ЗапуститьПриложение();

	// Когда
	Команда = Поделка.НайтиЖелудь("КомандаСОпцией");

	// Тогда
	Ожидаем.Что(Команда.Тест(), "Вызов метода команды").Равно(1);
	
КонецПроцедуры

&Тест
Процедура ПолучениеМассиваКоманд() Экспорт

	// Дано

	Поделка = ПолучитьПоделку();
	Поделка.ЗапуститьПриложение();

	

	// Когда
	Команды = Поделка.НайтиЖелуди("КомандаПриложения");

	// Тогда
	Ожидаем.Что(Команды, "Массив команда").ИмеетТип("ФиксированныйМассив");
	Ожидаем.Что(Команды.Количество(), "Массив команд не пустой").Больше(0);
	
КонецПроцедуры

&Тест
Процедура Опции_ВызовКомандыПривет() Экспорт
	// Дано

	Поделка = ПолучитьПоделку();
	Поделка.ЗапуститьПриложение();

	// Когда

	Команда = Поделка.НайтиЖелудь("КомандаСОпцией");
	КонсольноеПриложение = Поделка.НайтиЖелудь("КонсольноеПриложение");

	ПараметрыКоманды = Новый Массив();
	ПараметрыКоманды.Добавить("hello");
	ПараметрыКоманды.Добавить("-n");
	ПараметрыКоманды.Добавить("Никита");

	КонсольноеПриложение.Запустить(ПараметрыКоманды);

	// Тогда

	Ожидаем.Что(Команда.ИмяПользователя(), "Параметр передан в команду").Равно("Никита");
	Ожидаем.Что(Команда.ТекстПриветствия, "Параметр передан в команду, и она выполнена").Равно("Привет Никита");

КонецПроцедуры

&Тест
Процедура Опции_ВызовКомандыПриветСДекоратором() Экспорт
	// Дано

	Поделка = ПолучитьПоделку();
	Поделка.ЗапуститьПриложение();

	// Когда

	Команда = Поделка.НайтиЖелудь("КомандаСОпциейИДекоратором");
	КонсольноеПриложение = Поделка.НайтиЖелудь("КонсольноеПриложение");

	ПараметрыКоманды = Новый Массив();
	ПараметрыКоманды.Добавить("bye");
	ПараметрыКоманды.Добавить("--name");
	ПараметрыКоманды.Добавить("Никита");

	КонсольноеПриложение.Запустить(ПараметрыКоманды);

	// Тогда

	Ожидаем.Что(Команда.ИмяПользователя(), "Параметр передан в команду").Равно("Никита");
	Ожидаем.Что(Команда.ТекстПрощания, "Параметр передан в команду, и она выполнена").Равно("Пока Никита");

КонецПроцедуры

&Тест
Процедура Опции_ВызовКомандыИПроверкаПолученияПеременнойОкружения() Экспорт
	// Дано

	Поделка = ПолучитьПоделку();
	Поделка.ЗапуститьПриложение();
	УстановитьПеременнуюСреды("ENV_VAR_VALUE", "1");

	// Когда

	Команда = Поделка.НайтиЖелудь("КомандаСПеременнойОкружения");
	КонсольноеПриложение = Поделка.НайтиЖелудь("КонсольноеПриложение");

	ПараметрыКоманды = Новый Массив();
	ПараметрыКоманды.Добавить("testingenv");

	КонсольноеПриложение.Запустить(ПараметрыКоманды);

	// Тогда

	Ожидаем.Что(Команда.Результат[0], "Параметр передан в команду").Равно("1");

КонецПроцедуры

&Тест
Процедура Опции_ВызовКомандыИПроверкаФлаговИЗначенияПоУмолчанию() Экспорт
	// Дано

	Поделка = ПолучитьПоделку();
	Поделка.ЗапуститьПриложение();

	// Когда

	Команда = Поделка.НайтиЖелудь("КомандаСФлагами");
	КонсольноеПриложение = Поделка.НайтиЖелудь("КонсольноеПриложение");

	ПараметрыКоманды = Новый Массив();
	ПараметрыКоманды.Добавить("testingflag");
	ПараметрыКоманды.Добавить("-t");

	КонсольноеПриложение.Запустить(ПараметрыКоманды);

	// Тогда

	Ожидаем.Что(Команда.Результат[0], "Параметр истина передан в команду").Равно(Истина);
	Ожидаем.Что(Команда.Результат[1], "Параметр ложь передан в команду").Равно(Ложь);

КонецПроцедуры

&Тест
Процедура Опции_ВызовКомандыИПроверкаТЧисло() Экспорт
	// Дано

	Поделка = ПолучитьПоделку();
	Поделка.ЗапуститьПриложение();

	// Когда

	Команда = Поделка.НайтиЖелудь("КомандаСЧислами");
	КонсольноеПриложение = Поделка.НайтиЖелудь("КонсольноеПриложение");

	ПараметрыКоманды = Новый Массив();
	ПараметрыКоманды.Добавить("testingdigs");
	ПараметрыКоманды.Добавить("-a");
	ПараметрыКоманды.Добавить("1");
	ПараметрыКоманды.Добавить("-b");
	ПараметрыКоманды.Добавить("[-1]");
	ПараметрыКоманды.Добавить("-c");
	ПараметрыКоманды.Добавить("1.5");
	ПараметрыКоманды.Добавить("-d");
	ПараметрыКоманды.Добавить("10000");

	КонсольноеПриложение.Запустить(ПараметрыКоманды);

	// Тогда

	Ожидаем.Что(Команда.Результат[0], "1").Равно(1);
	// TODO: Возможность ТЧисло в отрицательные числа
	// Ожидаем.Что(Команда.Результат[1], "-1").Равно(-1);
	Ожидаем.Что(Команда.Результат[2], "1.5").Равно(1.5);
	Ожидаем.Что(Команда.Результат[3], "10000").Равно(10000);

КонецПроцедуры

&Тест
Процедура Опции_ВызовКомандыИПроверкаТДата() Экспорт
	// Дано

	Поделка = ПолучитьПоделку();
	Поделка.ЗапуститьПриложение();

	// Когда

	Команда = Поделка.НайтиЖелудь("КомандаСДатами");
	КонсольноеПриложение = Поделка.НайтиЖелудь("КонсольноеПриложение");

	ПараметрыКоманды = Новый Массив();
	ПараметрыКоманды.Добавить("testingdate");
	ПараметрыКоманды.Добавить("-a");
	ПараметрыКоманды.Добавить("2023-04-13_05:30:01");
	ПараметрыКоманды.Добавить("-b");
	ПараметрыКоманды.Добавить("2023-04-13");

	КонсольноеПриложение.Запустить(ПараметрыКоманды);

	// Тогда

	Ожидаем.Что(Команда.Результат[0], "дата1").Равно(Дата("20230413053001"));
	Ожидаем.Что(Команда.Результат[1], "дата2").Равно(Дата("20230413000000"));

КонецПроцедуры

&Тест
Процедура Опции_ВызовКомандыИПроверкаТСтрока() Экспорт
	// Дано

	Поделка = ПолучитьПоделку();
	Поделка.ЗапуститьПриложение();

	// Когда

	Команда = Поделка.НайтиЖелудь("КомандаСоСтрокой");
	КонсольноеПриложение = Поделка.НайтиЖелудь("КонсольноеПриложение");

	ПараметрыКоманды = Новый Массив();
	ПараметрыКоманды.Добавить("testingstring");
	ПараметрыКоманды.Добавить("-a");
	ПараметрыКоманды.Добавить("1");

	КонсольноеПриложение.Запустить(ПараметрыКоманды);

	// Тогда

	Ожидаем.Что(Команда.Результат[0], "Строка").Равно("1");

КонецПроцедуры

&Тест
Процедура Опции_ВызовКомандыИПроверкаТМассивДат() Экспорт
	// Дано

	Поделка = ПолучитьПоделку();
	Поделка.ЗапуститьПриложение();

	// Когда

	Команда = Поделка.НайтиЖелудь("КомандаСМассивами");
	КонсольноеПриложение = Поделка.НайтиЖелудь("КонсольноеПриложение");

	ПараметрыКоманды = Новый Массив();
	ПараметрыКоманды.Добавить("testingarray");
	ПараметрыКоманды.Добавить("-a");
	ПараметрыКоманды.Добавить("2023-04-13;2023-04-14");

	КонсольноеПриложение.Запустить(ПараметрыКоманды);

	// Тогда

	Ожидаем.Что(Команда.МассивДат[0], "дата1").Равно(Дата("20230413000000"));
	Ожидаем.Что(Команда.МассивДат[1], "дата2").Равно(Дата("20230414000000"));

КонецПроцедуры

&Тест
Процедура Опции_ВызовКомандыИПроверкаТМассивСтрок() Экспорт
	// Дано

	Поделка = ПолучитьПоделку();
	Поделка.ЗапуститьПриложение();

	// Когда

	Команда = Поделка.НайтиЖелудь("КомандаСМассивами");
	КонсольноеПриложение = Поделка.НайтиЖелудь("КонсольноеПриложение");

	ПараметрыКоманды = Новый Массив();
	ПараметрыКоманды.Добавить("testingarray");
	ПараметрыКоманды.Добавить("-b");
	ПараметрыКоманды.Добавить("а;б");

	КонсольноеПриложение.Запустить(ПараметрыКоманды);

	// Тогда

	Ожидаем.Что(Команда.МассивСтрок[0], "Строка1").Равно("а");
	Ожидаем.Что(Команда.МассивСтрок[1], "Строка2").Равно("б");

КонецПроцедуры

&Тест
Процедура Опции_ВызовКомандыИПроверкаТМассивЧисел() Экспорт
	// Дано

	Поделка = ПолучитьПоделку();
	Поделка.ЗапуститьПриложение();

	// Когда

	Команда = Поделка.НайтиЖелудь("КомандаСМассивами");
	КонсольноеПриложение = Поделка.НайтиЖелудь("КонсольноеПриложение");

	ПараметрыКоманды = Новый Массив();
	ПараметрыКоманды.Добавить("testingarray");
	ПараметрыКоманды.Добавить("-c");
	ПараметрыКоманды.Добавить("1;2");

	КонсольноеПриложение.Запустить(ПараметрыКоманды);

	// Тогда

	Ожидаем.Что(Команда.МассивЧисел[0], "Число1").Равно(1);
	Ожидаем.Что(Команда.МассивЧисел[1], "Число2").Равно(2);

КонецПроцедуры

&Тест
Процедура Аргументы_ОдинАргументСтрокой() Экспорт
	// Дано

	Поделка = ПолучитьПоделку();
	Поделка.ЗапуститьПриложение();

	// Когда

	Команда = Поделка.НайтиЖелудь("КомандаСАргументом");
	КонсольноеПриложение = Поделка.НайтиЖелудь("КонсольноеПриложение");

	ПараметрыКоманды = Новый Массив();
	ПараметрыКоманды.Добавить("agrfile");
	ПараметрыКоманды.Добавить("/some/file.f");

	КонсольноеПриложение.Запустить(ПараметрыКоманды);

	// Тогда

	Ожидаем.Что(Команда.Результат[0], "Аргумент передан в команду").Равно("/some/file.f");

КонецПроцедуры

&Тест
Процедура Аргументы_ДваАргумента() Экспорт
	// Дано

	Поделка = ПолучитьПоделку();
	Поделка.ЗапуститьПриложение();

	// Когда

	Команда = Поделка.НайтиЖелудь("КомандаСАргументами");
	КонсольноеПриложение = Поделка.НайтиЖелудь("КонсольноеПриложение");

	ПараметрыКоманды = Новый Массив();
	ПараметрыКоманды.Добавить("argtwo");
	ПараметрыКоманды.Добавить("/some/file.f");
	ПараметрыКоманды.Добавить("read");

	КонсольноеПриложение.Запустить(ПараметрыКоманды);

	// Тогда

	Ожидаем.Что(Команда.Результат[0], "Аргумент передан в команду").Равно("/some/file.f");
	Ожидаем.Что(Команда.Результат[1], "Аргумент передан в команду").Равно("read");

КонецПроцедуры

&Тест
Процедура Подкоманды_ПерваяПодкоманда() Экспорт
	// Дано

	Поделка = ПолучитьПоделку();
	Поделка.ЗапуститьПриложение();

	// Когда

	Команда = Поделка.НайтиЖелудь("ПодкомандаПервая");
	КонсольноеПриложение = Поделка.НайтиЖелудь("КонсольноеПриложение");

	ПараметрыКоманды = Новый Массив();
	ПараметрыКоманды.Добавить("subs");
	ПараметрыКоманды.Добавить("subplus");
	ПараметрыКоманды.Добавить("1");

	КонсольноеПриложение.Запустить(ПараметрыКоманды);

	// Тогда

	Ожидаем.Что(Команда.Результат, "Аргумент передан в команду").Равно(2);

КонецПроцедуры

&Тест
Процедура Подкоманды_ВтораяПодкоманда() Экспорт
	// Дано

	Поделка = ПолучитьПоделку();
	Поделка.ЗапуститьПриложение();

	// Когда

	Команда = Поделка.НайтиЖелудь("КастомнаяПодкоманда");
	КонсольноеПриложение = Поделка.НайтиЖелудь("КонсольноеПриложение");

	ПараметрыКоманды = Новый Массив();
	ПараметрыКоманды.Добавить("subs");
	ПараметрыКоманды.Добавить("subminus");
	ПараметрыКоманды.Добавить("2");

	КонсольноеПриложение.Запустить(ПараметрыКоманды);

	// Тогда

	Ожидаем.Что(Команда.Результат, "Аргумент передан в команду").Равно(1);

КонецПроцедуры

&Тест
Процедура Опции_ВызовКомандыСИдентификатором() Экспорт
	// Дано

	Поделка = ПолучитьПоделку();
	Поделка.ЗапуститьПриложение();

	// Когда

	Команда = Поделка.НайтиЖелудь("КастомноеИмяКоманды");
	КонсольноеПриложение = Поделка.НайтиЖелудь("КонсольноеПриложение");

	ПараметрыКоманды = Новый Массив();
	ПараметрыКоманды.Добавить("ident");
	ПараметрыКоманды.Добавить("--name");
	ПараметрыКоманды.Добавить("Никита");

	КонсольноеПриложение.Запустить(ПараметрыКоманды);

	// Тогда

	Ожидаем.Что(Команда.ИмяПользователя(), "Параметр передан в команду").Равно("Никита");
	Ожидаем.Что(Команда.ТекстПрощания, "Параметр передан в команду, и она выполнена").Равно("Пока Никита");

КонецПроцедуры