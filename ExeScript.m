%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Inicialización de la camára y el juego%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
camera=inicializar("Tower_v3/Trbajo(v1).exe &");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Ejecución del videojuego y la red neuronal%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ejecucion(camera,'clasificador.mat');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Cierre del programa%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cierre()

%%%%%%%%%%%%%%%%%
%Funciones%
%%%%%%%%%%%%%%%%%
function [camera]=inicializar(ruta)
    camera = webcam; % Llamada a la webcam
    system(ruta); % Ejecucion del juego
    pause(2); % Pausa de 2 segundos mientras se inicializa el juego
end

function []=ejecucion(camera,archivo)
load(archivo); % Carga la red neuronal entrenada
Cliente=connection; %Establece la conexion con el servidor Unity
soltada = false;% No se ha soltado la caja todavia
i=0; % Inicializa el contador
while(true)
    i=i+1; % aumenta en 1 el contador
    img = snapshot(camera); % Realiza una captura de pantalla
    img = imresize(img,[227 227]); % Reescala la imagen para adecuarla al formato de la red entrenada
    if(mod(i,3)~=0) % Descarta un tercio de las capturas hechas para adecuar la velocidad de captura
        [YPred]=classify(clasificador,img); % Realiza la clasificación de la imagen recibida
        soltada=controles_partida(Cliente,YPred,soltada); %Función de controles 
    end
end 
end

function [tcpipClient] = connection()
% Funcion que inicializa y verifica la conexion TCP entre MATLAL y Unity
tcpipClient = tcpip('127.0.0.1',55001,'NetworkRole','Client'); % Creacion del cliente TCP
set(tcpipClient,'Timeout',30); % Asignacion del timeout 
fopen(tcpipClient); % Apertura de la conexion
a='Conexion realizada'; % Mensaje de comprobacion de la conexion
fwrite(tcpipClient,a); % Envio del mensaje
fclose(tcpipClient); % Cierre d ela conexion
end

function [soltada] = controles_partida(tcpipClient,YPred,soltada)
%Funcion encargada de decidir el mensaje adecuado que se enviara a Unity
switch (YPred(1,1)) % Segun la deteccion del algoritmo
     case "Mano_abierta" % Si la mano está abierta      
        if (soltada == false) % Si todavía no se ha soltado la caja
            msg = "Mano_abierta"; % Entonces se manda el mensaje de mano abierta a Unity
            soltada = true; % Se deja caer la caja
        else
            msg = "Cierre la mano"; % Si ya se ha soltado la caja se exige que cierrre/quite la mano
        end

     case "Mano_cerrada" % Si la mano está cerrada
        msg = "Mano_cerrada"; % Entonces se manda el mensaje de mano abierta a Unity
        soltada = false; % No se deja caer la caja
     
     case "No_mano" % Si no hay mano
        msg = "No_mano"; % Entonces se manda el mensaje de no mano a Unity
        soltada = false; % No se deja caer la caja
end
sender(tcpipClient,msg); % Se realiza la conexion TCP con Unity
end

function [] = sender(tcpipClient,msg)
% Funcion que erealiza la conexion entre MATLAB y Unity mediante TCP
fopen(tcpipClient); % Apertura de la conexion TCP
fwrite(tcpipClient,msg); % Envio del mensaje
fclose(tcpipClient); % Cierre de la conexion TCP
end

function [] = cierre()
clc % Limpia la ventana de comandos
clear all % Limpia el workspace
fclose(tcpipClient) % Cierra la conexion con Unity
end