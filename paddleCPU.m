function [paddleBot] = paddleCPU(v,t,paddleBot,block)
%Basic function to control opponent's paddle: v - y velocity of paddle,
%paddle bot - [x;y] outline of paddle shape, block - [x;y] outline of ball,
%t- timestep (s)
%Returns the [x;y] coordinates of the Computer's paddle

blockC = mean(block(2,:)); %Centres of block and paddle
paddleC = mean(paddleBot(2,:));

if blockC > paddleC && max(paddleBot(2,:) + v*t) <= 10 %Really basic, if paddle below ball
    paddleBot = translateShape(paddleBot,0,v*t); %Move up
elseif blockC < paddleC && min(paddleBot(2,:) - v*t) >= -10 %If paddle above ball 
     paddleBot = translateShape(paddleBot,0,-v*t); %Move down
end