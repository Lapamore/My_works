using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.Reflection;

class Methods 
{
    static void Main()
    {
        int i = 0;
        Random rnd = new Random();
        Console.WriteLine("Введите длину массива:");
        int n = Int32.Parse(Console.ReadLine());
        Console.WriteLine();

        Array array = Array.CreateInstance(typeof(string), n);
        ArrayList array_list = new ArrayList(n);
        Hashtable hash_table = new Hashtable(n);
        SortedList sorted_list = new SortedList(n);


        string[] words = { "Game", "Vpn", "Free", "Chat", "Assasins", "Creed", "Crysis", "Botle" };
        string[] value = { "YES", "NO" };

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
            Console.Write("Выберите нужное действие:");
            string step = Console.ReadLine();
            Console.WriteLine();
            bool fl = true;
            switch (step)
            {
                case "1":
                    array_methods(array);
                    break;
                case "2":
                    array_list_methods(array_list);
                    break;
                case "3":
                    hash_table_methods(hash_table);
                    break;
                case "4":
                    sorted_list_methods(sorted_list);
                    break;
                default:
                    Console.WriteLine("Введите правильную цифру:\n");
                    fl = false;
                    break;
            }
            if (fl) {Console.Clear(); break; }
        }


    }




    static void array_methods(Array arr)
    {
        while (true)
        {
            Console.WriteLine("Меню:");
            Console.WriteLine("1. Узнать длину массива\n2. Побитовый поиск\n3. Удаление части массива\n4. Проверка на существование элемента\n5. Заполнение массива одним элементом.\n6.Поиск первого вхождения элемента\n7. Множественный поиск элементов\n8. Узнать тип элементов в массиве\n9. Печать массива\n10. Сортировка массива\n");
            Console.Write("Выберите метод:");
            string choice  = Console.ReadLine();
            switch (choice)
            {
                case "1":
                    Console.WriteLine($"Длина массива: {arr.Length}\n");
                    break;
                case "2":
                    break;
                case "3":
                    break;
                case "4":
                    break;
                case "5":
                    break;
                case "6":
                    break;
                case "7":         
                    break;
                case "8":
                    break;
                case "9":
                    Console.Write("Массив:\n");
                    PrintArray(arr);
                    break;
                case "10":
                  
                   /// PrintArray(arr);
                    break;
                default : 
                    Console.WriteLine("Неверный ввод данных. Пожалуйста, повторите попытку");
                    break;
            }
            
        }
    }

    static void array_list_methods(ArrayList arr)
    {
        while (true)
        {
            Console.WriteLine("Меню:");
            Console.WriteLine("1. Узнать длину массива\n2. Побитовый поиск\n3. Удаление части массива\n4. Проверка существования элемента\n5. Заполнение массива\n6. Поиск первого вхождения элемента\n7. Поиск последнего вхождения элемнта\n8. Узнать тип элементов в массиве\n9. Развернуть массив\n10. Сортировка массива");
            Console.Write("Выберите метод:");
            string choice = Console.ReadLine();
            switch (choice)
            {
                case "1":
                    Console.WriteLine($"Длина массива: {arr.Count}\n");
                    break;
                case "2":
                    break;
                case "3":
                    break;
                case "4":
                    break;
                case "5":
                    break;
                case "6":
                    break;
                case "7":
                    break;
                case "8":
                    break;
                case "9":
                    Console.Write("Массив:\n");
                    PrintArray(arr);
                    break;
                case "10":

                    /// PrintArray(arr);
                    break;
                default:
                    Console.WriteLine("Неверный ввод данных. Пожалуйста, повторите попытку");
                    break;
            }

        }
    }


    static void hash_table_methods(Hashtable arr)
    {
        while (true)
        {
            Console.WriteLine("Меню:");
            Console.WriteLine("1. Узнать длину словаря\n2. Вывести ключи\n3. Вывести значения\n4. Проверка существования ключа\n5. Проверка существования ключа (другое)\n6. Проверка существования значения\n7. Удаление элемента\n8. Очищение словаря\n9. Добавление элементов");
            Console.Write("Выберите метод:");
            string choice = Console.ReadLine();
            switch (choice)
            {
                case "1":
                    break;
                case "2":
                    break;
                case "3":
                    break;
                case "4":
                    break;
                case "5":
                    break;
                case "6":
                    break;
                case "7":
                    break;
                case "8":
                    break;
                case "9":
                    break;
                default:
                    Console.WriteLine("Неверный ввод данных. Пожалуйста, повторите попытку");
                    break;
            }

        }
    }

    static void sorted_list_methods(SortedList arr)
    {
        while (true)
        {
            Console.WriteLine("Меню:");
            Console.WriteLine("1. Узнать длину словаря\n2. Вывести ключи\n3. Вывести значения\n4. Вызов элемента по индексу\n5. Проверка существования ключа\n6. Проверка существования значения\n7. Удаление элемента\n8. Очищение словаря\n9. Добавление элементов\n10. Замена значения по индексу");
            Console.Write("Выберите метод:");
            string choice = Console.ReadLine();
            switch (choice)
            {
                case "1":
                    break;
                case "2":
                    break;
                case "3":
                    break;
                case "4":
                    break;
                case "5":
                    break;
                case "6":
                    break;
                case "7":
                    break;
                case "8":
                    break;
                case "9":
                    break;
                case "10":
                    break;
                default:
                    Console.WriteLine("Неверный ввод данных. Пожалуйста, повторите попытку");
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
            Console.WriteLine ($"{de.Key}: {de.Value}");
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

