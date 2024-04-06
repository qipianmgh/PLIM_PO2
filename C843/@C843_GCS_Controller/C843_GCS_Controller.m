function c = C843_GCS_Controller()
% C843_GCS_Controller controller class constructor

% This code is provided by Physik Instrumente(PI) GmbH&Co.KG.
% You may alter it corresponding to your needs.
% Comments and Corrections are very welcome.
% Please contact us by mailing to support-software@pi.ws. Thank you.

    
if nargin==0
	c.ControllerName = [];
	c.DLLName = [];
	c.ID = -1;
	c.IDN = 'not queried yet';
	c.NumberOfAxes = 0;
    c.hfile = 'C843_GCS_DLL';
    c.DLLNameStub = 'C843_GCS_DLL';
	c.libalias = 'C843';
	c.initialized = 0;
	c.NumberOfAnalogInputs = 0;
	c.GCSVersion = 1;
	c.DataRecorder.ppdValues = libpointer('doublePtr');
	c.DataRecorder.ValuesSize = [0 0];
    c.DataRecorder.SampleTime = 0;    
    
    if(~libisloaded(c.libalias))
        c = LoadGCSDLL(c);
    end
	
    c = class(c,'C843_GCS_Controller');
end
