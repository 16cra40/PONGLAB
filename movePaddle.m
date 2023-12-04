function paddle = movePaddle(H,E,v,t)
%movePaddle move the player's paddle at speed v over timestep t
paddle = getappdata(0,'paddle1');

if strcmp(E.Key,'uparrow')
    paddle(2,:) = paddle(2,:)+v*t;
elseif strcmp(E.Key,'downarrow')
    paddle(2,:) = paddle(2,:)-v*t;
end

if max(paddle(2,:)) <= 10 && min(paddle(2,:)) >= -10 %Keep paddle on screen
    setappdata(0, 'paddle1',paddle);
end

end