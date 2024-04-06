function Destroy( c )
%DESTROY Controller object and unload library

% This code is provided by Physik Instrumente(PI) GmbH&Co.KG
% You may alter it corresponding to your needs
% Comments and Corrections are very welcome
% Please contact us by mailing to support-software@pi.ws

try
    if(IsConnected(c))
        c = CloseConnection(c);
    end
catch% maybe c has no connected  controller ID, we still want to clear
end
if(libisloaded(c.libalias))
    unloadlibrary (c.libalias);
end
% clear c;
% clear classes;