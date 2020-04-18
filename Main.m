%get the data
load fisheriris;
data = meas(:,1); % just one dimension of the data (i.e., univariate time series)
labels = grp2idx(categorical(species)); % (numeric) labels

%train(0.70) test(0.30) split
cv = cvpartition(size(data,1),'HoldOut',0.3); %%performs a random split
idx = cv.test;

%separate the training and test data
data_train = data(~idx,:);
labels_train = labels(~idx,:);
data_test = data(idx,:);
labels_test = labels(idx,:);

%warping window
w = 5; 

%train the model
model = fitcknn(data_train,labels_train,'NumNeighbors',1,'Standardize',1,'Distance',@(x,Z)dtw_dist(x,Z,w));

%classify the test instances
labels_predict = predict(model,data_test);

%compute the accuracy of the model
cp = classperf(labels_test,labels_predict);
accuracy = cp.CorrectRate;

disp(['accuracy: ', num2str(accuracy)]);




