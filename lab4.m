hold on
########### params ########
iter = 200
x0=-1*10^-10;
function ret = riv(x)
    ret = 4*x*(1+x);
end;
##########################
x_vec = zeros(iter,1);
x_vec1 = zeros(iter,1);
x_vec(1)=x0;
for i=1:(iter-1)
    nxt = riv(x_vec(i));
    x_vec1(i) = nxt;
    x_vec(i+1) = nxt;
end;
x_next = riv(x_vec(iter));
x_vec1(iter) = x_next;
#### Lamerey diagram ####
bis_vec = [0, x_vec(iter)];
x_vec_plot  = zeros(iter * 2 - 1, 1);
x_vec1_plot  = zeros(iter * 2 - 1, 1);
for i=1:iter*2-1
    if mod(i, 2) == 1
        x_vec_plot(i) = x_vec((i+1)/2);
        x_vec1_plot(i) = x_vec1((i+1)/2);
    else
        x_vec_plot(i) = x_vec_plot(i-1);
        x_vec1_plot(i) = x_vec1_plot(i-1);
    endif
end
xlast = x_vec(1);
for i=1:iter-1
    #plot(x_vec(i), x_vec(i+1));
    plot([x_vec(i) x_vec(i)], [x_vec(i) x_vec(i+1)]);
    plot([x_vec(i) xlast], [x_vec(i) x_vec(i)]);
    xlast = x_vec(i);
    drawnow();
end
# plot vectors
#plot(x_vec, x_vec1, '--', x_vec_plot, x_vec1_plot, '-', bis_vec, bis_vec);

#plot(bis_vec);
#drawnow();
disp(x_vec);
disp(x_vec1);
disp(x_vec_plot);
disp(x_vec1_plot);
refresh();
disp("wait");
pause;
