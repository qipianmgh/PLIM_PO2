% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxDisconnectTerms(sourceTerminal, destinationTerminal)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(sourceTerminal, {'char'}, {'vector'}, 'DAQmxDisconnectTerms', 'sourceTerminal', 1);
    validateattributes(destinationTerminal, {'char'}, {'vector'}, 'DAQmxDisconnectTerms', 'destinationTerminal', 2);
    [status]= mexNIDAQmx('DAQmxDisconnectTerms', sourceTerminal, destinationTerminal);
end
