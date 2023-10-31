using System;

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

        // I modified it in feature branch
        Console.WriteLine($"The number of rainy days is {rainyDays}");
    }
}
/*
//Input
int dataLength, limitYear;
double limitRating;
 
do
{
    string input1 = Console.ReadLine();
 
    dataLength = Convert.ToInt32(input1.Split(' ')[0]);
    limitYear = Convert.ToInt32(input1.Split(' ')[1]);
    limitRating = Convert.ToDouble(input1.Split(' ')[2]);
}
while( ! (dataLength >= 1 && dataLength <= 50 && limitYear >= 1932 && limitYear <= 2022 && limitRating >= 0 && limitRating <= 10) );
   
 
int year = new int[dataLength];
double rating = new double[dataLength];
string title= new string[dataLength];
 
 
string filmTitleForMaxVal, filmTitleAll;
 
 
for (int i =0; i< dataLength; i++)
{
    do
    {
        string input2 = Console.ReadLine();
        year[i] = Convert.ToInt32(input1.Split(';')[0]);
        rating[i] = Convert.ToDouble(input1.Split(';')[1]);
        title[i] = input1.Split(';')[2];
    }while (! (year[i] >= 1932 && year[i] <= 2022 && rating[i] >= 0 && rating[i] <= 10 && Length(title[i]) >= 1 && Length(title[i]) <= 50) );
}
 
//Task 1
 
double maxRatedVal = 0;
int  maxRatedInd = 0;
 
for (int i =0; i< dataLength; i++)
{
    if(year[i] == limitYear)
    {
        if(rating[i] > maxRatedVal)
        {
            maxRatedVal = rating[i];
            maxRatedInd = i;
        }
    }
   
}
 
filmTitleForMaxVal = title[maxRatedInd];
 
//Task 2
filmTitleAll = "";
 
for (int i =0; i< dataLength; i++)
{
    if(rating[i] == limitRating)
    {
        filmTitleAll = filmTitleAll + title[i] + "\n";
    }      
}
 
 
//Output
Console.WriteLine("#1");
Console.WriteLine(filmTitleForMaxVal);
Console.WriteLine("#2");
Console.WriteLine(filmTitleAll);
*/