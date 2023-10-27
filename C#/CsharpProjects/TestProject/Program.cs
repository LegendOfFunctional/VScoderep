﻿using System;

class Program
{
    static void Main()
    {
        int N = int.Parse(Console.ReadLine()); // Read the count of days
        int rainyDays = 0; // Initialize the count of rainy days to 0

        for (int i = 0; i < N; i++)
        {
            int measurement = int.Parse(Console.ReadLine()); // Read the daily measurement
            if (measurement > 0)
            {
                rainyDays++; // Increment the count of rainy days if measurement is greater than 0
            }
        }

        // Output the count of rainy days
        Console.WriteLine($"The number of rainy days is {rainyDays}");
    }
}
