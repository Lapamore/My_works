using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.Diagnostics.Metrics;
using System.Reflection;
using System.Timers;
using System.Transactions;

class Methods
{
    static void Main()
    {
        Console.Clear();
        int i = 0;
        Random rnd = new Random();
        Console.Write("Введите количество слов от 1 до 20: ");
        int n = Int32.Parse(Console.ReadLine());
        Console.WriteLine();

        Array array = Array.CreateInstance(typeof(string), n);
        ArrayList array_list = new ArrayList(n);
        Hashtable hash_table = new Hashtable(n);
        SortedList sorted_list = new SortedList(n);


        string[] words = { "Game", "Vpn", "Free", "Chat", "Assasins", "Creed", "Crysis", "Botle","Soda","Milk","Play","Windows","Vinner","Eat","Cat","Dog","Block","Figma","Film","End"};
        string[] value = { "YES", "NO","None"};

        while (i < words.Length && i < n)
        {
            array.SetValue(words[i], i);
            Shuffle(words);
            array_list.Add(words[i]);
            Shuffle(words);
            i++;
        }
        i = 0;
        while (i < words.Length && i < n)
        {
            int index = rnd.Next(value.Length);
            hash_table.Add(words[i], value[index]);
            sorted_list.Add(words[i], value[index]);
            i++;
        }
        Console.WriteLine("|Array|"); PrintArray(array);
        Console.WriteLine("|ArrayList|"); PrintArray(array_list);
        Console.WriteLine("|Hashtable|"); PrintArray(hash_table);
        Console.WriteLine("|SortedList|"); PrintArray(sorted_list);


        while (true)
        {
            Console.WriteLine("Меню:");
            Console.WriteLine("1. Методы Array\n2. Методы ArrayList\n3. Методы Hashtable\n4. Методы SortedList\n");
            Console.Write("Выберите нужное действие: ");
            string step = Console.ReadLine();
            Console.WriteLine();
            bool fl = true;
            switch (step)
            {
                case "1":
                    array_methods(array);
                    break;
                case "2":
                    array_list_methods(array_list,n);
                    break;
                case "3":
                    hash_table_methods(hash_table,n);
                    break;
                case "4":
                    sorted_list_methods(sorted_list,n);
                    break;
                default:
                    Console.WriteLine("Введите правильную цифру: ");
                    fl = false;
                    break;
            }
            if (fl) { Console.Clear(); break; }
        }


    }


    static void array_methods(Array arr)
    {
        Console.Clear();
        while (true)
        {
            
            Console.WriteLine("Меню:");
            Console.WriteLine("1. Узнать длину массива\n2. Побитовый поиск\n3. Удаление части массива\n4. Проверка существования элемента\n5. Заполнение массива\n6. Поиск первого вхождения элемента\n7. Поиск последнего вхождения элемнта\n8. Узнать тип элементов в массиве\n9. Развернуть массив\n10. Сортировка массива\n11. Начать заново");
            Console.Write("\nВыберите метод: ");
            string choice = Console.ReadLine();
            switch (choice)
            {
                case "1":
                    Console.Clear();
                    Console.WriteLine($"Длина массива: {arr.Length}\n");
                    Console.Write("Введите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;
                case "2":
                    Console.Clear();
                    Array.Sort(arr);
                    Console.Write("Введите объект: ");
                    var response = Console.ReadLine();
                    var get = Array.BinarySearch(arr, response);
                    Console.WriteLine(get);
                    Console.Write("\nВведите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;
                case "3":
                    Console.Clear();
                    Console.Write("Введите левую границу: ");
                    int p1 = Int32.Parse(Console.ReadLine());
                    Console.Write("Введите правую границу: ");
                    int p2 = Int32.Parse(Console.ReadLine());
                    ///Array.Clear(arr,p1,p2); Это короче альтернатива, но мне не нравится она 
                    for (var index = 0; index < arr.Length; index++)
                    {
                        if (index >= p1 && index <= p2)
                            continue;
                        else                       
                            Console.WriteLine(arr.GetValue(index));                     
                    } 
                    Console.WriteLine("\nВыполнено!\n");
                    Console.Write("\nВведите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;
                case "4":
                    Console.Clear();
                    Console.Write("Введите слово для поиска: ");
                    string request = Console.ReadLine();
                    if (Array.Exists((string[])arr, element => element == request))                
                        Console.WriteLine("Такое слово существует!");
                    else
                        Console.WriteLine("Такое слово не существует!");
                    Console.Write("\nВведите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;
                case "5":
                    Console.Clear();
                    Console.Write("Введите элемент: ");
                    string word = Console.ReadLine();
                    Array.Fill((string[])arr, word);
                    Console.Write("Ваш массив:");
                    PrintArray(arr);
                    Console.Write("\nВведите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;
                case "6":
                    Console.Clear();
                    Console.Write("Введите слово для поиска: ");
                    string request_1 = Console.ReadLine();
                    int enter = Array.IndexOf(arr, request_1);
                    if (enter != -1)
                        Console.WriteLine($"Такое слово существует. Его индекс {enter}");
                    else
                        Console.WriteLine("Такое слово не существует!");
                    Console.Write("\nВведите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;
                case "7":
                    Console.Clear();
                    Console.Write("Мы будем искать слова по заданной длине. Пожалуйста, введите её: ");
                    int length;
                    if (!int.TryParse(Console.ReadLine(), out length))
                    {
                        Console.WriteLine("Неправильный ввод. Пожалуйста, введите цифру");
                    }
                    else
                    {
                        string[] result = Array.FindAll((string[]) arr, word => word.Length == length);
                        Console.WriteLine("Слова с длиной {0}: ", length);
                        PrintArray(result);
                    }
                    Console.Write("\nВведите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;
                case "8":
                    Console.Clear();
                    Console.Write($"Тип элементов: {arr.GetType().GetElementType()}\n\n");
                    Console.Write("\nВведите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;
                case "9":
                    Console.Clear();
                    Console.Write("Массив:\n");
                    PrintArray(arr);
                    Console.Write("\nВведите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;
                case "10":
                    Console.Clear();
                    Console.WriteLine("Отсортированный массив:");
                    Array.Sort(arr);
                    PrintArray(arr);
                    Console.Write("Введите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;
                case "11":
                    Main();
                    break;
                default:
                    Console.Clear();
                    Console.WriteLine("Неверный ввод данных. Пожалуйста, повторите попытку!");
                    break;
            }

        }
    }

    static void array_list_methods(ArrayList arr, int n)
    {
        Console.Clear();
        while (true)
        {
            Console.WriteLine("Меню:");
            Console.WriteLine("1. Узнать длину списка\n2. Побитовый поиск\n3. Удаление части списка\n4. Проверка на существование элемента\n5. Заполнение списка одним элементом.\n6. Поиск первого вхождения элемента\n7. Поиск элементов с конца\n8. Узнать тип элементов в списке\n9. Печать списка\n10. Сортировка списка\n11. Начать заново");
            Console.Write("\nВыберите метод: ");
            string choice = Console.ReadLine();
            switch (choice)
            {
                case "1":
                    Console.Clear();
                    Console.WriteLine($"Длина списка: {arr.Count}\n");
                    Console.Write("Введите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;

                case "2":
                    Console.Clear();
                    Console.Write("Введите объект: ");
                    var response_binary_search = Console.ReadLine();
                    arr.Sort();
                    Console.WriteLine(arr.BinarySearch(response_binary_search));
                    Console.Write("\nВведите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;

                case "3":
                    Console.Clear();
                    Console.Write("Введите левую границу: ");
                    int p1 = Int32.Parse(Console.ReadLine());
                    Console.Write("Введите правую границу: ");
                    int p2 = Int32.Parse(Console.ReadLine());
                    try
                    {
                        arr.RemoveRange(p1, p2);
                        PrintArray(arr);
                    }
                    catch(Exception ex)
                    {
                        Console.WriteLine($"Ошибка: {ex.Message}");
                    }
                    
                    Console.Write("\nВведите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;

                case "4":
                    Console.Clear();
                    Console.Write("Введите слово для поиска: ");
                    string word_search = Console.ReadLine();
                    if (arr.Contains(word_search))
                        Console.WriteLine("Такое слово существует!");
                    else
                        Console.WriteLine("Такое слово не существует!");
                    Console.Write("\nВведите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;

                case "5":
                    Console.Clear();
                    Console.Write("Введите ваше слово: ");
                    string word_list = Console.ReadLine();
                    ArrayList new_arr = new ArrayList(n);
                    for (int i = 0; i < n; i++)
                    {
                        new_arr.Add(word_list);
                    }
                    Console.WriteLine("Ваш массив:");
                    PrintArray(new_arr);
                    Console.Write("\nВведите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;

                case "6":
                    Console.Clear();
                    Console.Write("Введите ваше слово для поиска: ");
                    string myString = Console.ReadLine();
                    int myIndex = arr.IndexOf(myString);
                    if (myIndex != -1)
                        Console.WriteLine($"Такое слово существует. Его индекс {myIndex}");
                    else
                        Console.WriteLine("Такое слово не существует!");
                    Console.Write("\nВведите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;

                case "7":
                    Console.Clear();
                    Console.Write("Мы будем искать первое вхождение слова с конца. Пожалуйста, введите его: ");
                    string word = Console.ReadLine();
                    int result = arr.LastIndexOf(word);
                    if (result != -1)
                        Console.WriteLine($"Такое слово существует. Его индекс {arr.LastIndexOf(word)}");
                    else
                        Console.WriteLine("Такое слово не существует!");

                    Console.Write("\nВведите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;
                case "8":
                    Console.Clear();
                    Console.Write($"Тип элементов: {arr.GetType()}\n\n");
                    Console.Write("\nВведите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;
                case "9":
                    Console.Clear();
                    Console.Write("Массив:\n");
                    PrintArray(arr);
                    Console.Write("\nВведите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;

                case "10":
                    Console.Clear();
                    Console.WriteLine("Отсортированный массив:");
                    arr.Sort();
                    PrintArray(arr);
                    Console.Write("\nВведите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;
                case "11":
                    Main();
                    break;
                default:
                    Console.Clear();
                    Console.WriteLine("Неверный ввод данных. Пожалуйста, повторите попытку!");
                    break;
            }

        }
    }


    static void hash_table_methods(Hashtable arr,int n)
    {
        Console.Clear();
        while (true)
        {
            Console.WriteLine("Меню:");
            Console.WriteLine("1. Узнать длину словаря\n2. Вывести ключи\n3. Вывести значения\n4. Проверить, содержит ли объект Hashtable указанный ключ(1)\n5. Проверить, содержит ли объект Hashtable указанный ключ(2)\n6. Проверка существования значения\n7. Удаление элемента\n8. Очищение словаря\n9. Добавление элементов\n10. Начать заново");
            Console.Write("\nВыберите метод: ");
            string choice = Console.ReadLine();
            switch (choice)
            {
                case "1":
                    Console.Clear();
                    Console.WriteLine($"Длина Хэш-таблицы: {arr.Count}\n");
                    Console.Write("Введите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;
                case "2":
                    Console.Clear();
                    Console.WriteLine("Ключи: ");
                    foreach (var key in arr.Keys)
                    {
                        Console.WriteLine(key);
                    }
                    Console.Write("\nВведите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;
                case "3":
                    Console.Clear();
                    Console.WriteLine("Значения: ");
                    foreach (var value in arr.Values)
                    {
                        Console.WriteLine(value);
                    }
                    Console.Write("\nВведите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;
                case "4":
                    Console.Clear();
                    Console.Write("Введите ключ для поиска: ");
                    var key_search_version_1 = Console.ReadLine();
                    if (arr.Contains(key_search_version_1))
                        Console.WriteLine("Такой ключ существует!");
                    else
                        Console.WriteLine("Такой ключ не существует!");
                    Console.Write("\nВведите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;
                case "5":
                    Console.Clear();
                    Console.Write("Введите ключ для поиска: ");
                    var key_search_version_2 = Console.ReadLine();
                    if (arr.ContainsKey(key_search_version_2))
                        Console.WriteLine("Такой ключ существует!");
                    else
                        Console.WriteLine("Такой ключ не существует!");
                    Console.Write("\nВведите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;
                case "6":
                    Console.Clear();
                    Console.Write("Введите значение для поиска: ");
                    var value_search = Console.ReadLine();
                    if (arr.ContainsValue(value_search))
                        Console.WriteLine("Такое значение существует!");
                    else
                        Console.WriteLine("Такой значение не существует!");
                    Console.Write("\nВведите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;
                case "7":
                    Console.Clear();
                    Console.Write("Ключи: ");
                    foreach (var key in arr.Keys){Console.Write($"{key} ");}
                    Console.Write("\nВведите ключ для удаления: ");
                    var key_delete= Console.ReadLine();
                    arr.Remove(key_delete);
                    Console.WriteLine($"Выполнено! {key_delete} удалено из Hashtable\nРезультат:");
                    PrintArray(arr);
                    Console.Write("Введите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;
                case "8":
                    Console.Clear();
                    Console.Write("Вы действительно хотите отчистить Hashtable? YES/NO: ");
                    if (Console.ReadLine().ToLower() == "yes")
                    {
                        arr.Clear();
                        Console.WriteLine("Hashtable отчищена!");

                    }
                    Console.Write("\nВведите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;
                case "9":
                    Console.Clear();
                    Console.Write("Сколько элементов вы хотите доавбить: ");
                    try
                    {
                        int num = Int32.Parse(Console.ReadLine());
                        for (int i = 0; i < num; i++)
                        {
                            Console.Write("Введите ключ: ");
                            var key = Console.ReadLine();
                            Console.Write("Введите значение: ");
                            var value = Console.ReadLine();
                            arr.Add(key, value);
                            Console.Write("Пара добавлена!\n");
                        }
                        Console.WriteLine();
                        Console.WriteLine("SortedList:");
                        PrintArray(arr);
                    }
                    catch
                    {
                        Console.WriteLine("Ошибка! Вы вввели не число!");
                    }
                    Console.Write("\nВведите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;
                case "10":
                    Main();
                    break;
                default:
                    Console.Clear();
                    Console.WriteLine("Неверный ввод данных. Пожалуйста, повторите попытку!");
                    break;
            }

        }
    }

    static void sorted_list_methods(SortedList arr, int n)
    {
        Console.Clear();
        while (true)
        {
            Console.WriteLine("Меню:");
            Console.WriteLine("1. Узнать длину словаря\n2. Вывести ключи\n3. Вывести значения\n4. Вызов элемента по индексу\n5. Проверка существования ключа\n6. Проверка существования значения\n7. Удаление элемента\n8. Очищение словаря\n9. Добавление элементов\n10. Замена значения по индексу\n11. Начать заново");
            Console.Write("Выберите метод: ");
            string choice = Console.ReadLine();
            switch (choice)
            {
                case "1":
                    Console.Clear();
                    Console.WriteLine($"Длина SortedList: {arr.Count}\n");
                    Console.Write("Введите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;
                case "2":
                    Console.Clear();
                    Console.WriteLine("Ключи: ");
                    foreach (var key in arr.Keys)
                    {
                        Console.WriteLine(key);
                    }
                    Console.Write("\nВведите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;
                case "3":
                    Console.Clear();
                    Console.WriteLine("Значения: ");
                    foreach (var value in arr.Values)
                    {
                        Console.WriteLine(value);
                    }
                    Console.Write("\nВведите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;
                case "4":
                    Console.Clear();
                    Console.Write("Введите индекс: ");
                    
                    try
                    {
                        int index = Int32.Parse(Console.ReadLine());
                        Console.WriteLine($"{arr.GetKey(index)}: {arr.GetByIndex(index)}");
                    }
                    catch
                    {
                        Console.Write("Такого индекса не существует!");
                    }
                    Console.Write("\nВведите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;
                case "5":
                    Console.Clear();
                    Console.Write("Введите ключ для поиска: ");
                    var key_search = Console.ReadLine();
                    if (arr.ContainsKey(key_search))
                        Console.WriteLine("Такой ключ существует!");
                    else
                        Console.WriteLine("Такой ключ не существует!");
                    Console.Write("\nВведите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;
                case "6":
                    Console.Clear();
                    Console.Write("Введите значение для поиска: ");
                    var value_search = Console.ReadLine();
                    if (arr.ContainsValue(value_search))
                        Console.WriteLine("Такое значение существует!");
                    else
                        Console.WriteLine("Такой значение не существует!");
                    Console.Write("\nВведите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;
                case "7":
                    Console.Clear();
                    Console.Write("Ключи: ");
                    foreach (var key in arr.Keys) { Console.Write($"{key} "); }
                    Console.Write("\nВведите ключ для удаления: ");
                    var key_delete = Console.ReadLine();
                    arr.Remove(key_delete);
                    Console.WriteLine($"Выполнено! {key_delete} удалено из SortedList\nРезультат:");
                    PrintArray(arr);
                    Console.Write("Введите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;
                case "8":
                    Console.Clear();
                    Console.Write("Вы действительно хотите отчистить SortedList? YES/NO: ");
                    if (Console.ReadLine().ToLower() == "yes")
                    {
                        arr.Clear();
                        Console.WriteLine("SortedList отчищена!");

                    }
                    Console.Write("\nВведите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;
                case "9":
                    Console.Clear();
                    Console.Write("Сколько элементов вы хотите доавбить: ");
                    try
                    {
                        int num = Int32.Parse(Console.ReadLine());
                        for (int i = 0; i < num; i++)
                        {
                            Console.Write("Введите ключ: ");
                            var key = Console.ReadLine();
                            Console.Write("Введите значение: ");
                            var value = Console.ReadLine();
                            arr.Add(key, value);
                            Console.Write("Пара добавлена!\n");
                        }
                        Console.WriteLine();
                        Console.WriteLine("SortedList:");
                        PrintArray(arr);
                    }
                    catch
                    {
                        Console.WriteLine("Ошибка! Вы вввели не число!");
                    }               
                    Console.Write("\nВведите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;
                case "10":
                    Console.Clear();
                    Console.Write("Введите индекс: ");
                    int number = Int32.Parse(Console.ReadLine());
                    Console.Write("Введите значение: ");
                    var value_new = Console.ReadLine();
                    arr.SetByIndex(number, value_new);
                    Console.WriteLine($"Готово! Значение в индексе {number} заменено на {value_new}");
                    Console.Write("\nВведите exit для выхода: ");
                    if (Console.ReadLine().ToLower() == "exit") Console.Clear();
                    break;
                case "11":
                    Main();
                    break;
                default:
                    Console.Clear();
                    Console.WriteLine("Неверный ввод данных. Пожалуйста, повторите попытку!");
                    break;
            }

        }
    }



    static void PrintArray(Array a)
    {
        foreach (var el in a)
        {
            Console.WriteLine(el);
        }
        Console.WriteLine();
    }
    static void PrintArray(ArrayList arr)
    {
        foreach (var el in arr)
        {
            Console.WriteLine(el);
        }
        Console.WriteLine();
    }
    static void PrintArray(SortedList arr)
    {
        foreach (DictionaryEntry kvp in arr)
        {
            Console.WriteLine($"{kvp.Key}: {kvp.Value}");
        }
        Console.WriteLine();
    }
    static void PrintArray(Hashtable arr)
    {
        foreach (DictionaryEntry de in arr)
        {
            Console.WriteLine($"{de.Key}: {de.Value}");
        }
        Console.WriteLine();
    }
    public static void Shuffle<T>(T[] array)
    {
        var random = new Random();
        for (int i = array.Length - 1; i > 0; i--)
        {
            int j = random.Next(i + 1);
            T temp = array[i];
            array[i] = array[j];
            array[j] = temp;
        }
    }
   

}
