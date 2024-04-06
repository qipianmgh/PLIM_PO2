% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxDeleteSavedScale(scaleName)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(scaleName, {'char'}, {'vector'}, 'DAQmxDeleteSavedScale', 'scaleName', 1);
    [status]= mexNIDAQmx('DAQmxDeleteSavedScale', scaleName);
end
