function [paddle1,paddleBot,block] = resetPlay()
%Initialise positions of paddles and ball
%Returns [x;y] for ball and paddles
%Zak C-W
block=[-0.5 0.5 0.5 -0.5 -0.5; -0.5 -0.5 0.5 0.5 -0.5]; %[x coords, y coords]
if rand < 0.5 %Put the ball on a random serving position
    block = translateShape(block,-5,0);
else
    block = translateShape(block,5,0);
end
paddle1 = [-10,-9,-9,-10,-10;-5,-5,5,5,-5];
paddleBot = [10,9,9,10,10;-5,-5,5,5,-5];
setappdata(0,'paddle1',paddle1) %Allow passing of paddle data to the figure 
end