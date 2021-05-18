function [] = sender(tcpipClient,msg)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
fopen(tcpipClient);
fwrite(tcpipClient,msg);
fclose(tcpipClient);
end

