function [block,v,score] = moveBlock(block,v,t,paddleBot)
%moveBlock - All code for the motion of the block
%Inputs: block - coordinates defining block (x;y), v
%- velocity vector of the block [vx;vy], t - time step between frames
% Zak C-W 2023
testBlock = block+ v*t;
paddle = getappdata(0,'paddle1');
if min(testBlock(1,:)) < -9 && (min(testBlock(2,:)) < max(paddle(2,:)) && max(testBlock(2,:)) > min(paddle(2,:)))  %Check collisions with paddle
        v(1) = -v(1); %Reflect
        beep %irritation.wav
end
if max(testBlock(1,:)) > 9 && (min(testBlock(2,:)) < max(paddleBot(2,:)) && max(testBlock(2,:)) > min(paddleBot(2,:)))%Check collisions with right wall
        v(1) = -v(1); %Reflect
        beep %irritation.wav
end
if min(testBlock(1,:)) < -10 %Player loses
    score = [0,1];
elseif max(testBlock(1,:)) > 10 %CPU loses
    score = [1,0]; 
else
    score = [0,0];
end
if max(abs(testBlock(2,:))) > 10 %Collisions with floor / ceiling
    v(2) = -v(2);
    beep
end
block(1,:) = block(1,:) + v(1)*t; %Update x position
block(2,:) = block(2,:) + v(2)*t; %Update y position
end