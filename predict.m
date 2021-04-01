function [yhat] = predict(A,w,c)
yhat =round(1./(1+exp(-((A*w)+c))));
 yhat(find(yhat==0))=-1;
end

