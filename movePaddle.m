function paddle = movePaddle(H,E,v,t)
%movePaddle move the player's paddle at speed v over timestep t
%Inputs:v - vertical velocity of the paddle, 
% t - time step between frames,
% H and E refer to linking the function to keypresses in the figure
%Returns [x;y] coordinates of the player's paddle
%Zak C-W
paddle = getappdata(0,'paddle1');

if strcmp(E.Key,'uparrow')
    paddle = translateShape(paddle,0,v*t); %Move up
elseif strcmp(E.Key,'downarrow')
    paddle = translateShape(paddle,0,-v*t); %Move down
end

if max(paddle(2,:)) <= 10 && min(paddle(2,:)) >= -10 %Keep paddle on screen
    setappdata(0, 'paddle1',paddle); %Pass to draw function
end

end