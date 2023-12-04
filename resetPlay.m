function [paddle1,paddleBot,block] = resetPlay()
%Initialise positions of paddles and balls
block=[-0.5 0.5 0.5 -0.5 -0.5; -0.5 -0.5 0.5 0.5 -0.5];
paddle1 = [-10,-9,-9,-10,-10;-5,-5,5,5,-5];
paddleBot = [10,9,9,10,10;-5,-5,5,5,-5];
setappdata(0,'paddle1',paddle1)
end