%Main script for PONGLAB
%Zak C-W 2023

t = 1/40;
vPaddle = 10;
vblock = [-20;10];
[paddle1,paddleBot,block] = resetPlay();
score = [0,0]; %[Player,CPU]
fig = figure( 'Name', 'PONGLAB','keypressfcn',{@movePaddle,vPaddle,t});
playing = 1;

while playing
    %Update paddles and ball
    paddle1 = getappdata(0,'paddle1');
    paddleBot = paddleCPU(vPaddle,t,paddleBot, block);
    [block,vblock,result] = moveBlock(block,vblock,t,paddleBot);
    if ~isequal(result, [0,0])
        score = score + result;
        [paddle1,paddleBot,block] = resetPlay();
    end
    %draw paddles and balls
    fill(paddle1(1,:),paddle1(2,:),'b')
    hold on
    fill(paddleBot(1,:),paddleBot(2,:),'r')
    fill(block(1,:),block(2,:),'g')
    hold off
    %set axes properties
    title(strcat("Player: ",string(score(1))," CPU: ",string(score(2))))
    axis([-10,10 -10 10])
    xlabel('PONGLAB - A Michaelmas Vacation Miniproject')
    axis square
    grid minor
    pause(t)
end
