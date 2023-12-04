function [paddleBot] = paddleCPU(v,t,paddleBot,block)
%Basic function to control opponent's paddle: v - y velocity of paddle,
%paddle bot - [x;y] outline of paddle shape, block - [x,y] outline of ball,
%t- timestep (s)

blockC = mean(block(2,:)); %Centres of block and paddle
paddleC = mean(paddleBot(2,:));

if blockC > paddleC && max(paddleBot(2,:) + v*t) <= 10 %Really basic, if paddle below ball
    paddleBot(2,:) = paddleBot(2,:) + v*t; %Move up
elseif blockC < paddleC && min(paddleBot(2,:) - v*t) >= -10 %If paddle above ball 
    paddleBot(2,:) = paddleBot(2,:) - v*t; %Move down
end