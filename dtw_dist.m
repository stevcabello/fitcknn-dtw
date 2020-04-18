%%source--> https://stackoverflow.com/questions/27752637/matlab-using-pdist-to-deal-with-time-series-clustering


function d2 = dtw_dist(XI,XJ,w)
    result =[];
    [m1,n1] = size(XI);
    [m2,n2] = size(XJ);
    for j=1:m2
        result = horzcat(result,dtw(XI,XJ(j,:),w)); %%dtw --> https://au.mathworks.com/help/signal/ref/dtw.html
    end
    d2=result';    %%this line was modified to follow the output format
                   %%for the Distance metrics as given in 
                   %%https://au.mathworks.com/help/stats/fitcknn.html
end
