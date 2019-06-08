- Panel used to use render target to control where entities (compnents) rendered
    - I'm not sure what replaces this, or if we can force entities to render to bitmaps
    - Panels have their own BitmapData buffer to render to. . .


- Layout Group
    - Apparently screen used to have a "fullScale" and Offset
    - Only camera has full scale from what I know now
    - There doesn't seem to be anything about offsets with screen anymore or anyhwere

- Text Field Support
    - Currently has a serious dependency on the Flash API
    - It makes sense to update HaxePunk to include the required support
        - But it might make more sense to keep it out of the main engine if it's strictly for text input.
        - probably by imitating the backend code but local to this repo

TODO:

[ ] Text Field Support
[ ] Panel support
[ ] Test if ToggleButton can have text rendered outside of button
[ ] Check to see if LayoutGroup#add needs to account for the, currenty ignored, index arg.