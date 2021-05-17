function [exito,tcpipClient] = connection()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
tcpipClient = tcpip('127.0.0.1',55001,'NetworkRole','Client');
set(tcpipClient,'Timeout',30);
fopen(tcpipClient);
a='Conexion realizada';
fwrite(tcpipClient,a);
fclose(tcpipClient);
exito = true;
end

