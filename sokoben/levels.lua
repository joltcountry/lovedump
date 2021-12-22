require('obj/level')

levels = {

    Level:new(
        {
            { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
            { 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2},
            { 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2},
            { 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2},
            { 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2},
            { 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2},
            { 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2},
            { 2, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 2},
            { 2, 2, 2, 2, 2, 2, 2, 1, 0, 0, 0, 1, 2},
            { 2, 2, 2, 2, 2, 2, 2, 1, 0, 0, 0, 1, 2},
            { 2, 2, 2, 2, 2, 2, 2, 1, 0, 0, 0, 1, 2},
            { 2, 2, 2, 2, 2, 2, 2, 1, 0, 3, 0, 1, 2},
            { 2, 2, 2, 2, 2, 2, 2, 1, 0, 0, 0, 1, 2},
            { 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 2},
            { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
        }, 
        { x=4,y=5 },
        {
            { x=6,y=4 }
        }
    ),

    Level:new(
        {
            { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
            { 2, 2, 2, 2, 2, 1, 1, 1, 2, 2, 2, 2, 2},
            { 2, 2, 1, 1, 1, 1, 0, 1, 1, 1, 1, 2, 2},
            { 2, 2, 1, 3, 0, 0, 0, 0, 0, 3, 1, 2, 2},
            { 2, 2, 1, 0, 1, 1, 0, 1, 1, 0, 1, 2, 2},
            { 2, 2, 1, 0, 1, 1, 0, 1, 1, 0, 1, 2, 2},
            { 2, 2, 1, 0, 1, 1, 0, 1, 1, 0, 1, 2, 2},
            { 2, 2, 1, 0, 1, 1, 0, 1, 1, 0, 1, 2, 2},
            { 2, 2, 1, 0, 1, 1, 0, 1, 1, 0, 1, 2, 2},
            { 2, 2, 1, 0, 1, 1, 0, 1, 1, 0, 1, 2, 2},
            { 2, 2, 1, 0, 1, 1, 0, 1, 1, 0, 1, 2, 2},
            { 2, 2, 1, 0, 1, 0, 0, 0, 1, 0, 1, 2, 2},
            { 2, 2, 1, 0, 0, 0, 3, 0, 0, 0, 1, 2, 2},
            { 2, 2, 1, 1, 1, 0, 0, 0, 1, 1, 1, 2, 2},
            { 2, 2, 2, 2, 1, 1, 1, 1, 1, 2, 2, 2, 2},
            { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
        },
        { x=7, y=3 },
        {
            { x = 7, y = 9 },
            { x = 4, y = 9 },
            { x = 10, y = 9 }
        }
    ),

    Level:new(
        {
            { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
            { 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
            { 2, 2, 2, 2, 2, 1, 0, 0, 0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
            { 2, 2, 2, 2, 2, 1, 0, 0, 0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
            { 2, 2, 2, 1, 1, 1, 0, 0, 0, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
            { 2, 2, 2, 1, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
            { 2, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1, 2, 2, 2, 1, 1, 1, 1, 1, 1, 2},
            { 2, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 3, 3, 1, 2},
            { 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 1, 2},
            { 2, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 1, 1, 0, 0, 3, 3, 1, 2},
            { 2, 2, 2, 2, 2, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2},
            { 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2},
            { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2}
        },
        { x=7, y=3 },
        {
            { x = 7, y = 4 },
            { x = 9, y = 5 },
            { x = 7, y = 6 },
            { x = 9, y = 6 },
            { x = 4, y = 9 },
            { x = 7, y = 9 }
        }
    )

}