my_map = [0,0,0;
          1,0,0;
          0,1,0;
          0,0,1;
          1,1,1];

rect_mat = zeros(4,100);
rect_mat(3,3) = 1;
row_count = size(rect_mat,1);
column_count = length(rect_mat);

for i=1:1:row_count
    for j=i:5:column_count
        if i%2 = 0 
            if j%2 = 0
                rect_mat(i,j) = 1; % Labelling vehicles 1,2,3,4 
            else 
                rect_mat(i,j) = 2;
            end
        else
           if j%2 = 0
                rect_mat(i,j) = 3;
            else 
                rect_mat(i,j) = 4;
            end
        end 
    end
end
figure(1)
colormap(my_map)
imagesc(rect_mat)
for k=2:1:4
    for i=1:1:row_count
        for j=i:1:column_count
            if rect_mat(i,j) == 1||rect_mat(i,j) == 4 
                if j-2 >0
                    rect_mat(i,j-2) = rect_mat(i,j);       % 1 and 4 move 3 blocks per unit time
                    rect_mat(i,j) = 0;
                end
            else
                if j-1 >0
                    rect_mat(i,j-1) = rect_mat(i,j);      % 2 and 3 move 1 block per unit time
                    rect_mat(i,j) = 0;
                end
            end
        end
    end
figure(k)
colormap(my_map)
imagesc(rect_mat)
pause(3)
end
