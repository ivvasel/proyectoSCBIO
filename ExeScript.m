%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Inicialización de la camára y el juego%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
camera=inicializar("Tower_v3/Trbajo(v1).exe &");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Ejecución del videojuego y la red neuronal%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ejecucion(camera,'clasificador.mat');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Cierre del programa%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all

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
[Cliente,cerrado]=connection; %Establece la conexion con el servidor Unity
soltada = false;% No se ha soltado la caja todavia
while(cerrado == false)
    img = snapshot(camera); % Realiza una captura de pantalla
    img = imresize(img,[227 227]); % Reescala la imagen para adecuarla al formato de la red entrenada
    [YPred]=classify(clasificador,img); % Realiza la clasificación de la imagen recibida
    [soltada,cerrado]=controles_partida(Cliente,YPred,soltada); %Función de controles 
end 
end

function [tcpipClient,error] = connection()
% Funcion que inicializa y verifica la conexion TCP entre MATLAL y Unity
try
tcpipClient = tcpip('127.0.0.1',55001,'NetworkRole','Client'); % Creacion del cliente TCP
set(tcpipClient,'Timeout',30); % Asignacion del timeout 
fopen(tcpipClient); % Apertura de la conexion
a='Conexion realizada'; % Mensaje de comprobacion de la conexion
fwrite(tcpipClient,a); % Envio del mensaje
fclose(tcpipClient); % Cierre d ela conexion
error = false;
catch 
    warning("No se ha podido realizar la conexion");
    error = true;
end
end

function [soltada,cerrado] = controles_partida(tcpipClient,YPred,soltada)
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
cerrado = sender(tcpipClient,msg); % Se realiza la conexion TCP con Unity
end

function [cerrado] = sender(tcpipClient,msg)
% Funcion que erealiza la conexion entre MATLAB y Unity mediante TCP
cerrado = false;

try
fopen(tcpipClient); % Apertura de la conexion TCP
fwrite(tcpipClient,msg); % Envio del mensaje
fclose(tcpipClient); % Cierre de la conexion TCP
catch
    warning("Se ha perdido la conexion");
    cerrado = true;
end
end