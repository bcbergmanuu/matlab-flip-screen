clear all
backcol = 0;

% determine screens
screenNumber = max(Screen('Screens'));
[w, screenrect] = Screen('OpenWindow', screenNumber, [0 0 0]);
Screen(w,'BlendFunction',GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

refreshrate = Screen('FrameRate',w);

myrates=zeros(1,100);
for i=1:10000
    tic
    Screen('FillRect',w,255*backcol);
    Screen('Flip',w);
   
    backcol=abs(1-backcol);
    myrates(1,i)=toc;
   
end

sca;

disp(round(myrates*1000));
disp(refreshrate);
