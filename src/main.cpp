/*
Following lazy foo tutorial xddd
*/


#include <SDL2/SDL.h>
#include <stdio.h>

const int SCREEN_WIDTH = 640;
const int SCREEN_HEIGHT = 480;

int main(int argc, char* args[])
{
    SDL_Window *window = 0;

    SDL_Surface *surface = 0;

    if (SDL_Init(SDL_INIT_VIDEO) < 0)
    {
        printf("Could not init SDL ");
    }
    else
    {
        window = SDL_CreateWindow("SDL tutorial", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_SHOWN);

        if (!window)
        {
            printf("Could not create window for some reason! %s\n", SDL_GetError());
        }
        else
        {
            surface = SDL_GetWindowSurface(window);

            SDL_FillRect(surface, 0, SDL_MapRGB(surface->format, 0xff, 0xff, 0xff));

            SDL_UpdateWindowSurface(window);

            SDL_Event e;

            int quit = 0;

            while (!quit)
            {
                while (SDL_PollEvent( &e ) )
                {
                    if ( e.type == SDL_QUIT ) 
                    {
                        quit = 1;
                    }
                }
            }
        }
    }

    SDL_DestroyWindow( window );
    SDL_Quit();

    return 1;
}