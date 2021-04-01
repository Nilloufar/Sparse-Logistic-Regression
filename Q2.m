clc
%% load data
 data=load('ad_data.mat')
 
X_train=data.X_train;
    y_train=data.y_train;
     X_test=data.X_test;
     y_test=data.y_test;
     

    %% train model
        %% train model
 p= [0,0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
 AUC_result=[];
 ACC=[];
 feature_count=[];
 for i=1:size(p,2)
 [w c] =logistic_l1_train(X_train, y_train,p(i));
 features=find(w~=0);
 feature_count=[feature_count size(features,1)];
 test=X_test(:,features);
 w=w(features,:);
 scores=predict(test,w,c);
 [X,Y,T,AUC] = perfcurve(y_test,scores,1);
 AUC_result=[AUC_result AUC];
 ACC=[ACC  size(find(scores==y_test),1)/size(y_test,1)];
%  fprintf('%d \n',(size(find(predict(X_test,w,c) ==y_test),1)/size(X_test,1))*100)
 end
    feature_count
 AUC_result
 ACC
 
title('Sparse Logistic Regression Regularization')
xlabel('parameters')
ylabel('AUC')
plot (p,AUC_result)
