function [block,v,score] = moveBlock(block,v,t,paddleBot)
%moveBlock - All code for the motion of the block
%Inputs: block - coordinates defining block [x;y], v
%- velocity vector of the block [vx;vy], t - time step between frames
%Returns: Block [x;y] coordinates, new velocity vector of the block [vx;vy]
%, score[player,CPU]
% Zak C-W
testBlock = block+ v*t;
paddle = getappdata(0,'paddle1');
if min(testBlock(1,:)) < -9 && (min(testBlock(2,:)) < max(paddle(2,:)) && max(testBlock(2,:)) > min(paddle(2,:)))  %Check collisions with player's paddle
        v(1) = -v(1); %Reflect
        beep %irritation.wav
end
if max(testBlock(1,:)) > 9 && (min(testBlock(2,:)) < max(paddleBot(2,:)) && max(testBlock(2,:)) > min(paddleBot(2,:)))%Check collisions computer's paddle
        v(1) = -v(1); %Reflect
        beep %irritation.wav
end
if min(testBlock(1,:)) < -10 %CPU wins
    score = [0,1];
elseif max(testBlock(1,:)) > 10 %Player wins
    score = [1,0]; 
else %Play on
    score = [0,0];
end
if max(abs(testBlock(2,:))) > 10 %Collisions with floor / ceiling
    v(2) = -v(2); %Reflect
    beep
end
block = translateShape(block,v(1)*t,v(2)*t); %Update block position
end