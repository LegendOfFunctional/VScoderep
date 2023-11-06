
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
// Console.WriteLine("1" == "1");
// Console.WriteLine("a" == "A");
// Console.WriteLine(1 == 2);

// string myValue = "a";
// Console.WriteLine(myValue == "a");
// string value1 = " a";
// string value2 = "A ";
// Console.WriteLine(value1.Trim().ToLower() != value2.Trim().ToLower());


// string pangram = "The quick brown fox jumps over the lazy dog.";
// Console.WriteLine(pangram.Contains("fox"));
// Console.WriteLine(pangram.Contains("cow"));

// Console.WriteLine(pangram.Contains("fox") == false);
// Console.WriteLine(!pangram.Contains("fox"));

// int saleAmount = 10;
// int discount = saleAmount > 1000 ? 100 : 50;
// Console.WriteLine($"Discount: {discount}");

// Random coin = new Random();
// int flip = coin.Next(0, 2);
// Console.WriteLine((flip == 0) ? "heads" : "tails");
/*
Random random = new Random();
int randomNumber = random.Next(0, 3); // Generates a random integer between 0 and 2.

string result;
switch (randomNumber)
{
    case 0:
        result = "Rauf";
        break;
    case 1:
        result = "Samir";
        break;
    case 2:
        result = "adalet";
        break;
    default:
        result = "Invalid outcome";
        break;
}

Console.WriteLine(result);
*/
// Random coin = new Random();
// Console.WriteLine((coin.Next(0, 2) == 0) ? "heads" : "tails");

//Part 3,  Unit 6 
/*
string permission = "Admin|Manager";
int level = 53;

if (permission.Contains("Admin"))
{
    if (level > 55)
    {
        Console.WriteLine("Welcome, Super Admin user.");
    }
    else
    {
        Console.WriteLine("Welcome, Admin user.");
    }
}
else if (permission.Contains("Manager"))
{
    if (level >= 20)
    {
        Console.WriteLine("Contact an Admin for access.");
    }
    else
    {
        Console.WriteLine("You do not have sufficient privileges.");
    }
}
else
{
    Console.WriteLine("You do not have sufficient privileges.");
}
*/
/*
Random random = new Random();
int randomNumber = random.Next(0, 100); // Generates a random integer between 0 and 99.

string result = "Unknown"; // Initialize with a default value

if (randomNumber >= 0 && randomNumber <= 20)
{
    result = "You do not have sufficient privileges.";
}
else if (randomNumber == 55)
{
    result = "Welcome, Admin user.";
}
else if (randomNumber >20 && randomNumber < 55)
{
    result = "Contact an Admin for access.";
}
else if (randomNumber > 55)
{
    result = "Welcome, Super Admin user.";
}

Console.WriteLine(result);
*/

// Part 3 Unit 7
// bool flag = true;
// int value = 0;
// if (flag)
// {
// value = 10;
// Console.WriteLine($"Inside of code block: {value}");
// }
// Console.WriteLine($"Outside of code block: {value}");
// bool flag = true;
// if (flag)
// Console.WriteLine(flag);


// int[] numbers = { 4, 5, 6, 64, 65, 24, 42 };
// int total = 0;
// foreach (int number in numbers)
// {

//     total += number;
//      if (number == 42)
//      {
//      Console.WriteLine("Set contains 42");
//      }
// }
//  Console.WriteLine($"Total: {total}");

// int employeeLevel = 100;
// string employeeName = "John Smith";

// string title = "";

// switch (employeeLevel)
// {
//     case 100:
//     case 200:
//         title = "Senior Associate";
//         break;
//     case 300:
//         title = "Manager";
//         break;
//     case 400:
//         title = "Senior Manager";
//         break;
//     default:
//         title = "Associate";
//         break;
// }

// Console.WriteLine($"{employeeName}, {title}");

// SKU = Stock Keeping Unit. 
// SKU value format: <product #>-<2-letter color code>-<size code>
// string sku = "01-MN-L";

// string[] product = sku.Split('-');

// string type = "";
// string color = "";
// string size = "";

// switch (product[0])
// { 
//     case  "01":
//     type = "Sweat shirt";
//     break;
    
//     case "02":
//     type = "T-Shirt";
//     break;

//     case "03":
//     type = "Sweat pants";
//     break;
   
//     default:
//     type = "Other";
//     break;
// }

// switch (product[1])
// { 
//     case  "BL":
//     color = "Black";
//     break;
    
//     case "MN":
//     color = "Maroon";
//     break;
   
//     default:
//     color = "White";
//     break;
// }
// switch (product[2])
// {
//     case "S":
//     size = "Small";
//     break;

//     case "M":
//     size = "Medium";
//     break;

//     case "L":
//     size = "Large";
//     break;

//     default:
//     size = "One Size Fits All";
//     break;
// }

// Console.WriteLine($"Product: {size} {color} {type}");