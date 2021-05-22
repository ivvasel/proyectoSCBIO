function [] = capturar(ruta)
%% Función encargada de realizar las capturas necesarias para la base de datos

camara=webcam; % Activación de la webcam
i=0; % Inicialización del índice de las fotografías

while i<=300
    img=camara.snapshot; % Captura de pantalla
    imshow(img); % Muestra de las capturas de pantalla
    filename=strcat(ruta,num2str(1000+i),'.jpg'); % Nombre d ela imagen guardada
    img=imresize(img,[227 227]); % Reescalado de la imagen para entrenar el algoritmo
    imwrite(img,filename); % Guardado de la imagen
    i=i+1; % Actualización del índice de las fotografías
    drawnow; % Muestra de las capturas de pantalla
end
clear camara; % Elimina la variable camara
end

