% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateLinScale(name, slope, yIntercept, preScaledUnits, scaledUnits)
    narginchk(5, 5);
    nargoutchk(1, 1);
    validateattributes(name, {'char'}, {'vector'}, 'DAQmxCreateLinScale', 'name', 1);
    validateattributes(slope, {'double'}, {'scalar'}, 'DAQmxCreateLinScale', 'slope', 2);
    validateattributes(yIntercept, {'double'}, {'scalar'}, 'DAQmxCreateLinScale', 'yIntercept', 3);
    validateattributes(preScaledUnits, {'int32'}, {'scalar'}, 'DAQmxCreateLinScale', 'preScaledUnits', 4);
    validateattributes(scaledUnits, {'char'}, {'vector'}, 'DAQmxCreateLinScale', 'scaledUnits', 5);
    [status]= mexNIDAQmx('DAQmxCreateLinScale', name, slope, yIntercept, preScaledUnits, scaledUnits);
end
