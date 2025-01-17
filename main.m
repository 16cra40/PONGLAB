%Main script for PONGLAB
%See README.txt for more information
%Zak C-W

t = 1/40; %Timestep (between frames) in s
vPaddle = 10; %Units/s
vblock = [-25;16];
[paddle1,paddleBot,block] = resetPlay(); %Set paddles and ball to initial positions
court = [0 0 5 5 0 0 -5 -5 5 5 -5 -5 0;10 0 0 -10 -10 0 0 10 10 0 0 -10 -10]; %Tennis court shape
score = [0,0]; %[Player,CPU]
fig = figure( 'Name', 'PONGLAB','keypressfcn',{@movePaddle,vPaddle,t});
playing = 1;

while playing
    %Update paddles and ball
    paddle1 = getappdata(0,'paddle1');
    paddleBot = paddleCPU(vPaddle,t,paddleBot, block);
    [block,vblock,result] = moveBlock(block,vblock,t,paddleBot);

    %draw court, paddles and ball
    fill([-10,10,10,-10],[-10,-10,10,10],'g')
    hold on
    drawshape(court,'w');
    fill(paddle1(1,:),paddle1(2,:),'b')
    fill(paddleBot(1,:),paddleBot(2,:),'r')
    fill(block(1,:),block(2,:),'w')
    hold off

    %set axes properties
    title(strcat("Player: ",string(score(1))," CPU: ",string(score(2))))
    axis([-10,10 -10 10])
    xlabel('PONGLAB - A Michaelmas Vacation Miniproject')
    axis square
    set(gca,'xtick',[],'ytick',[]) %Hide the axes

    %Check whether to end game or point
    if ~isequal(result, [0,0]) %Some one has scored
        score = score + result;
        if score(1) >= 10 %Player wins
            close(fig)
            msgbox([strcat("Player: ",string(score(1))," CPU: ",string(score(2)));'Congratulations! You beat the computer'])
            playing = 0;
        elseif score(2) >= 10 %CPU wins
            close(fig)
            msgbox([strcat("Player: ",string(score(1))," CPU: ",string(score(2)));"Better luck next time "])
            playing = 0;
        else
            [paddle1,paddleBot,block] = resetPlay();
        end
    end
    pause(t) %Pause before redrawing

end
