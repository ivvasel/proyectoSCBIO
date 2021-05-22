function [] = entrenar(ruta)
%% Esta función permite entrenar la red neuronal

net=squeezenet; % Elección de la red neuronal preentrenada
lgraph=layerGraph(net); % Muestra de las capas de la red

% Sustitución de la capa que decide el número de salidas
ConvLayer = convolution2dLayer([1, 1],3,'WeightLearnRateFactor',10,'BiasLearnRateFactor',10,"Name",'conv10');
lgraph = replaceLayer(lgraph,'conv10',ConvLayer);

% SUstitución de la capa que realiza la clasificación definitiva
ClassificatonLayer = classificationLayer('Name','ClassificationLayer_predictions');
lgraph = replaceLayer(lgraph,'ClassificationLayer_predictions',ClassificatonLayer);

% Creación de la base de datos para reentrenar la red
dataset=imageDatastore(ruta,'IncludeSubfolders',1,'LabelSource','foldernames');

% Definición de las opciones de entrenamiento
options = trainingOptions('sgdm',...
          'InitialLearnRate',0.001,...
          'MaxEpochs',20,...
          'MiniBatchSize',64);

% Entrenamiento de la red
clasificador=trainNetwork(dataset,lgraph,options);

% Guardado de la red reentrenada sobre la nueva base de datos
save('clasificador.mat','clasificador')


end

