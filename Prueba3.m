clc
clear all;
w=webcam;
area_captura=[0 0 500 500];
i=0;
ruta='/Users/AndresFerrando/Documents/4/SCBIO/Trabajo/Test/';

while i<=300
    img=w.snapshot;
    captura = insertObjectAnnotation(img,'rectangle',area_captura,'Area Captura');   
    imshow(captura);
    filename=strcat(ruta,num2str(1000+i),'.jpg');
    img=imcrop(img,area_captura);
    img=imresize(img,[227 227]);
    imwrite(img,filename);
    i=i+1;
    drawnow;
end
clear w;


%%

clc
clear all

net=squeezenet;
lgraph=layerGraph(net);

ConvLayer = convolution2dLayer([1, 1],3,'WeightLearnRateFactor',10,'BiasLearnRateFactor',10,"Name",'conv10');
lgraph = replaceLayer(lgraph,'conv10',ConvLayer);

ClassificatonLayer = classificationLayer('Name','ClassificationLayer_predictions');
lgraph = replaceLayer(lgraph,'ClassificationLayer_predictions',ClassificatonLayer);


dataset=imageDatastore('Base_Datos','IncludeSubfolders',1,'LabelSource','foldernames');
options = trainingOptions('sgdm',...
          'InitialLearnRate',0.001,...
          'MaxEpochs',20,...
          'MiniBatchSize',64);
      
detection_net=trainNetwork(dataset,lgraph,options);
save('google.mat','detection_net')


%%

load('google.mat')
ds=imageDatastore('Test1');
YPred = classify(detection_net,ds);



