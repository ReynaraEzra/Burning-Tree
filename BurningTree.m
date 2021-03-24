clear all;close all;clc;

pohon = randi([1,2],52);
map   = [1 1 1;0 1 0;1 1 0;1 0 0;0 0 0;1/5 1/5 1/5; 1/2 1/2 1/2];
pohon(1:end,1)   = 1;
pohon(1:end,end) = 1;
pohon(1,1:end)   = 1;
pohon(end,1:end) = 1;

image(pohon)
colormap(map)
axis square
axis off
M(1)=getframe;
pause(0.2)

for i = 1:4;
    a = find(pohon==2);
    b = randi([1,length(a)],1);
    pohon(a(b)) = 3;
end

image(pohon)
colormap(map)
axis square
axis off
M(2)=getframe;
pause(0.3)

for i = 3:60;
    pohon(find(pohon==7))=1;
    pohon(find(pohon==6))=7;
    pohon(find(pohon==5))=6;
    pohon(find(pohon==4))=5;
    
    [d,b] = find(pohon==3);
    for j = 1 : length(d)
        pohon(d(j),b(j))=4;
        if(pohon(d(j),b(j)-1)==2)
            pohon(d(j),b(j)-1)=3;
        end
        if(pohon(d(j)-1,b(j)-1)==2)
            pohon(d(j)-1,b(j)-1)=3;
        end
        if(pohon(d(j)-1,b(j))==2)
            pohon(d(j)-1,b(j))=3;
        end
        if(pohon(d(j)-1,b(j)+1)==2)
            pohon(d(j)-1,b(j)+1)=3;
        end
        if(pohon(d(j),b(j)+1)==2)
            pohon(d(j),b(j)+1)=3;
        end
        if(pohon(d(j)+1,b(j)+1)==2)
            pohon(d(j)+1,b(j)+1)=3;
        end
        if(pohon(d(j)+1,b(j))==2)
            pohon(d(j)+1,b(j))=3;
        end
        if(pohon(d(j)+1,b(j)-1)==2)
            pohon(d(j)+1,b(j)-1)=3;
        end
    end
    
    image(pohon)
    colormap(map)
    axis square
    axis off
    M(i)=getframe;
    pause(0.2)
end