using System;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using SkiaSharp;

// Define the pattern to look for in filenames
var pattern = new Regex(@"(?<Width>\d+)x(?<Height>\d+)", RegexOptions.Compiled);

// Define the original image to resize
var originalImagePath = "original.png";

// Get all files in the current directory that follow the pattern "(?<Width>\d+)x(?<Height>\d+)"
var directoryPath = Directory.GetCurrentDirectory();
var files = Directory.GetFiles(directoryPath, "*.*", SearchOption.TopDirectoryOnly)
                        .Where(file => pattern.IsMatch(Path.GetFileName(file)))
                        .ToList();

if (files.Count == 0)
{
    Console.WriteLine("No files found that match the pattern.");
    return;
}

// Load the original image
SKBitmap bitmap;
using (var inputStream = File.OpenRead(originalImagePath))
{
    bitmap = SKBitmap.Decode(inputStream);
}

foreach (var file in files)
{
    var match = pattern.Match(Path.GetFileName(file));
    if (match.Success)
    {
        int newWidth = int.Parse(match.Groups["Width"].Value);
        int newHeight = int.Parse(match.Groups["Height"].Value);

        // Resize the original image
        SKBitmap resizedBitmap = bitmap.Resize(new SKImageInfo(newWidth, newHeight), SKFilterQuality.High);
        if (resizedBitmap == null)
        {
            Console.WriteLine($"Failed to resize the image to {newWidth}x{newHeight}.");
            continue;
        }

        // Save the resized image to overwrite the file
        using (var outputStream = File.OpenWrite(file))
        using (SKImage skImage = SKImage.FromBitmap(resizedBitmap))
        {
            SKData encodedData = skImage.Encode(SKEncodedImageFormat.Png, 100);
            encodedData.SaveTo(outputStream);
        }

        Console.WriteLine($"Resized image saved to {file}");
    }
}