# CanvasCrafter
#### By the Illustrious Illustrators

Final project for Mr. K's class, Gabriel Small and Alisa Aleksandrova

## What is it? (Brief Project Summary)

> This project is a painting utility made in processing. Similar to microsoft paint or procreate, this project will be primarily for drawing on a digital canvas and creating images. The base features will include a drawing tool, an eraser and the ability to clear the canvas and restart. Other features that will be implemented may include a color selector, a bucket tool, a tool size changer, and a dropper.


## Prototype Document

> https://docs.google.com/document/d/1oBpQWmZz5VQUnwzEelrC2NTm3FDGipTzGh3_sjGXFHs/edit?usp=sharing
## Run/Compile Instructions:
> Run via processing and just press start. Its a pretty self explanatory paint app. The + and - buttons add/remove layers, respectively. When a layer is highlighted, it is visible, and when a layer is covered by a blue arrow, it is the selected layer in use. The clear button clears current layer, and the tools are pretty simple. The image export always exports an image called "image.jpg" and the import can import any image file type. The image import creates a new image layer, which is just an image, moveable and resizable by pointer once the layer is selected (has a blue arrow above). The slider is for paint size, and the colored circle is for the paint color. 
## WorkLog:

5/23/22  
Gabriel: Started Drawing using layers, added basic eraser and pen tool and a color picker    
Alisa: tweaked the way the tools class works, added a slider for strokewidth  
5/24/22  
Gabriel: Fixed paint color, as there was a fill which doesn't work for lines. Cleaned up Gui and added buttons for pen and eraser. Merged with main and fixed merge conflicts. Added layers and buttons for such layers, letting clicking on each layer enable and disable it.  
Alisa: add buttons for pen and eraser and work on ctrl z  
5/25/22  
Gabriel: started bucket tool and fill algorithm. fixed size slider using constrains, added layer removal and per layer clearing. Changed linkedlists to arraylists for better memory usage and faster runtime.  
Alisa: continue working on undo and redo so that pressing ctrl and z at the same time will call the undo  
5/26/22  
Gabriel: Finished fill algorithms, and fixed them up. Started to work on new fill algorithm.  
Alisa: work on the eraser tool (attempt to implement it so that it deletes the paint objects instead of drawing in white)  
5/27/22  
Gabriel: Fixed missing pixels using nosmooth and got rid of new fill algo as it is slower.  
Alisa: finalize/fix undo and redo and continue working on the eraser  
5/30/22  
Gabriel: transfered all of the layers to start using pgraphics to let eraser and transparency and other tools such as fill work per layer.
Alisa: attempted to add a hashmap of paints to use for the eraser but did not push this because it proved to be fruitless. also tried to use Color to make transparency.  
5/31/22  
Gabriel: added circle to show size of pen when using, made eraser circle clear, finally fully fixed eraser.  
6/1/22  
Gabriel: started image importing, added image exporting. Remove cursor while drawing.  
6/2/22  
Gabriel: added dropper tool to select color under mouse, made dropper only work on paint, image class added for imported image resizing and dragging.  
6/3/22  
Gabriel: Worked on image class.  
6/5/22  
Gabriel: kept working on image class.  
6/6/22  
Gabriel: images now move with dragging, and can resize. Fixed image importing and exporting breaking by adding makeshift await and using a while loop to delay whole program while importing and exporting.  
6/7/22  
Gabriel: merged with Alisa's branch and fixed broken cntrl y and z.   
6/8/22  
Gabriel: fixed control y and z layer switch issues.  
6/10/22:
Gabriel: Fixed cursor border to make drawing easier, fixed image resizing issues.   
6/12/22:  
Gabriel: did a full ui rework and made empty background gray. Merged with main, fixing all conflicts, and fixed borer by making it inverted.  
