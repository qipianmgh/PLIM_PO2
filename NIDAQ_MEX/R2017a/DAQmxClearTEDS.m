% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxClearTEDS(physicalChannel)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxClearTEDS', 'physicalChannel', 1);
    [status]= mexNIDAQmx('DAQmxClearTEDS', physicalChannel);
end
