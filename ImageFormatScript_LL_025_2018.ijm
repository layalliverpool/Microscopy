// A script for Layal
// Enjoy!

/* a way to add
 *  multiline
 *  comments
 */

path = getDirectory("image"); // what is the directory (=folder) of the image?
resultsPath = path + "/results/"; // this is where you change the name of the results folder if you want
//resultsPath = "/Users/layal/Desktop/ResultsOnDesktop"
File.makeDirectory(resultsPath); // create the results directory
print(resultsPath)

selectImage(1) // this selects the 1st opened image
imageTitle1 = getTitle() 
run("Enhance Contrast", "saturated=0.35");

selectImage(2); // this selects the 2nd opened image
imageTitle2 = getTitle() // imageTitle2 is a variable. We can use variable in the code below. The function 'getTitle()' returns the result and stores it into the variable
run("Enhance Contrast", "saturated=0.35");
//setMinAndMax(0, 4095); // the function 'setMinAndMax()' allows me to manually set the range
run("Enhance Contrast", "saturated=0.35");

selectImage(3) // this selects the 3rd opened image
imageTitle3 = getTitle()
run("Enhance Contrast", "saturated=0.35");

// generate the composite image
run("Merge Channels...", "c1=[" + imageTitle1 + "] c2=[" + imageTitle2 + "] c3=[" + imageTitle3 + "] create keep");

// save the composite image
run("RGB Color");
run("Scale Bar...", "width=10 height=4 font=50 color=White background=None location=[Lower Right] bold");
saveAs("PNG", resultsPath + "/Composite_" + imageTitle1);

// save the first image
selectImage(1); // this selects the 1st opened image
run("Grays");
run("RGB Color");
run("Scale Bar...", "width=10 height=4 font=50 color=White background=None location=[Lower Right] bold");
saveAs("PNG", resultsPath + "/DAPI_405_" + imageTitle1)

// save the second image
selectImage(2); // this selects the 2nd opened image
run("Grays");
run("RGB Color");
run("Scale Bar...", "width=10 height=4 font=50 color=White background=None location=[Lower Right] bold");
saveAs("PNG", resultsPath + "/Z22_488_" + imageTitle2)

// save the third image
selectImage(3) // this selects the 3rd opened image
run("Grays");
run("RGB Color");
run("Scale Bar...", "width=10 height=4 font=50 color=White background=None location=[Lower Right] bold");
saveAs("PNG", resultsPath + "/Phalloidin_633_" + imageTitle3)

// close all the images
while (nImages>0) { 
	selectImage(nImages); 
	close(); 
} 