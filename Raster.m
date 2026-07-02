clear;
clc;
close all;

%real axial
Ispta = [5 10 15 20 25 30];
peak_voltage = zeros(size(Ispta));
%peak_pressure=NaN(size(Ispta));    %future P data

% FUTURE PRESSURE CONVERSION (requires hydrophone sensitivity)
% P = V / sensitivity

pressure = NaN;   % (not known yet)

load('12-Jun-2026-5_RasterScan.mat')
wf = squeeze(rasterscandata(2,1,:));
peak_voltage(1) = max(abs(wf));

load('12-Jun-2026-10_RasterScan.mat')
wf = squeeze(rasterscandata(2,1,:));
peak_voltage(2) = max(abs(wf));

load('12-Jun-2026-15_RasterScan.mat')
wf = squeeze(rasterscandata(2,1,:));
peak_voltage(3) = max(abs(wf));

load('12-Jun-2026-20_RasterScan.mat')
wf = squeeze(rasterscandata(2,1,:));
peak_voltage(4) = max(abs(wf));

load('12-Jun-2026-25_RasterScan.mat')
wf = squeeze(rasterscandata(2,1,:));
peak_voltage(5) = max(abs(wf));

load('12-Jun-2026-30_RasterScan.mat')
wf = squeeze(rasterscandata(2,1,:));
peak_voltage(6) = max(abs(wf));

figure;
plot(Ispta, peak_voltage, '-o', 'LineWidth', 2);
grid on;
xlabel('Ispta setting');
ylabel('Peak Voltage (mV)');
title('Calibration Curve Real Axial Focus');

%programmed
Ispta = [ 10 15 20 25 30];
peak_voltage = zeros(size(Ispta));

load('Programmed10_RasterScan.mat')
wf = squeeze(rasterscandata(2,1,:));
peak_voltage(1) = max(abs(wf));

load('Programmed15_RasterScan.mat')
wf = squeeze(rasterscandata(2,1,:));
peak_voltage(2) = max(abs(wf));

load('Programmed20_RasterScan.mat')
wf = squeeze(rasterscandata(2,1,:));
peak_voltage(3) = max(abs(wf));

load('Programmed25_RasterScan.mat')
wf = squeeze(rasterscandata(2,1,:));
peak_voltage(4) = max(abs(wf));

load('Programmed30_RasterScan.mat')
wf = squeeze(rasterscandata(2,1,:));
peak_voltage(5) = max(abs(wf));

figure;
plot(Ispta, peak_voltage, '-o', 'LineWidth', 2);
grid on;
xlabel('Ispta setting');
ylabel('Peak Voltage (mV)');
title('Calibration Curve Programmed Focus');


%Z30 scan


fs = 125e6;        % sampling frequency (Hz)
c = 1485;          % speed of sound in water (m/s)
N = 91;            % number of Z positions


load('Zf30_RasterScan.mat')

z_mm = zeros(N,1);
amplitude = zeros(N,1);
for i = 1:N

    wf = squeeze(rasterscandata(i,1,:));
    wf = double(wf);
    threshold = 0.2 * max(abs(wf));
    index = find(abs(wf) > threshold,1,'first');
    t_arrival = index / fs;
    z_mm(i) = t_arrival * c * 1000;
    amplitude(i) = max(abs(wf));

end

figure;
plot(z_mm, amplitude, '-','LineWidth',2);
grid on;
xlabel('Axial Distance (mm)');
ylabel('Peak Voltage (V)');
title('Axial Acoustic Amplitude Distribution for Z f=30mm');

%focus
[max_amp, focus_index] = max(amplitude);
focus_position = z_mm(focus_index);
fprintf('\n=========================\n');
fprintf('Focal position at 30f for Z = %.2f mm\n',focus_position);
fprintf('Maximum amplitude at 30f for Z = %.4f V\n',max_amp);
fprintf('=========================\n');

%focal region
half_max = 0.5 * max_amp;
focal_indices = amplitude >= half_max;
focal_z = z_mm(focal_indices);
lower_focus = focal_z(1);
upper_focus = focal_z(end);
focal_length = upper_focus - lower_focus;
fprintf('Focal region start at 30f for Z = %.2f mm\n',lower_focus);
fprintf('Focal region end at 30f for Z= %.2f mm\n',upper_focus);
fprintf('Focal region length at 30f for Z= %.2f mm\n',focal_length);
hold on;
plot(focus_position,max_amp,'r*','MarkerSize',12);
legend('Axial amplitude','Focus');


%Z35 scan


fs = 125e6;        % sampling frequency (Hz)
c = 1485;          % speed of sound in water (m/s)
N = 91;            % number of Z positions


load('Zf35_RasterScan.mat')

z_mm = zeros(N,1);
amplitude = zeros(N,1);
for i = 1:N

    wf = squeeze(rasterscandata(i,1,:));
    wf = double(wf);
    threshold = 0.2 * max(abs(wf));
    index = find(abs(wf) > threshold,1,'first');
    t_arrival = index / fs;
    z_mm(i) = t_arrival * c * 1000;
    amplitude(i) = max(abs(wf));

end


figure;
plot(z_mm, amplitude, '-','LineWidth',2);
grid on;
xlabel('Axial Distance (mm)');
ylabel('Peak Voltage (V)');
title('Axial Acoustic Amplitude Distribution for Z f=35mm');

%focus
[max_amp, focus_index] = max(amplitude);
focus_position = z_mm(focus_index);
fprintf('\n=========================\n');
fprintf('Focal position at 35f for Z= %.2f mm\n',focus_position);
fprintf('Maximum amplitude at 35f for Z= %.4f V\n',max_amp);
fprintf('=========================\n');

%focal region
half_max = 0.5 * max_amp;
focal_indices = amplitude >= half_max;
focal_z = z_mm(focal_indices);
lower_focus = focal_z(1);
upper_focus = focal_z(end);
focal_length = upper_focus - lower_focus;
fprintf('Focal region start at 35f for Z= %.2f mm\n',lower_focus);
fprintf('Focal region end at 35f for Z= %.2f mm\n',upper_focus);
fprintf('Focal region length at 35f for Z= %.2f mm\n',focal_length);
hold on;
plot(focus_position,max_amp,'r*','MarkerSize',12);
legend('Axial amplitude','Focus');


%Z25_5Wcm2 scan


fs = 125e6;        % sampling frequency (Hz)
c = 1485;          % speed of sound in water (m/s)
N = 91;            % number of Z positions


load('Zf25_RasterScan_5Wcm2.mat')

z_mm = zeros(N,1);
amplitude = zeros(N,1);
for i = 1:N

    wf = squeeze(rasterscandata(i,1,:));
    wf = double(wf);
    threshold = 0.2 * max(abs(wf));
    index = find(abs(wf) > threshold,1,'first');
    t_arrival = index / fs;
    z_mm(i) = t_arrival * c * 1000;
    amplitude(i) = max(abs(wf));

end

figure;
plot(z_mm, amplitude, '-','LineWidth',2);
grid on;
xlabel('Axial Distance (mm)');
ylabel('Peak Voltage (V)');
title('Axial Acoustic Amplitude Distribution for Z f=25 mm and I=5Wcm2');

%focus
[max_amp, focus_index] = max(amplitude);
focus_position = z_mm(focus_index);
fprintf('\n=========================\n');
fprintf('Focal position at 35f, 5Wcm2 for Z= %.2f mm\n',focus_position);
fprintf('Maximum amplitude at 35f, 5Wcm2 for Z= %.4f V\n',max_amp);
fprintf('=========================\n');

%focal region
half_max = 0.5 * max_amp;
focal_indices = amplitude >= half_max;
focal_z = z_mm(focal_indices);
lower_focus = focal_z(1);
upper_focus = focal_z(end);
focal_length = upper_focus - lower_focus;
fprintf('Focal region start at 35f, 5Wcm2 for Z= %.2f mm\n',lower_focus);
fprintf('Focal region end at 35f, 5Wcm2 for Z= %.2f mm\n',upper_focus);
fprintf('Focal region length at 35f, 5Wcm2 for Z= %.2f mm\n',focal_length);
hold on;
plot(focus_position,max_amp,'r*','MarkerSize',12);
legend('Axial amplitude','Focus');


%Z25_30Wcm2 scan


fs = 125e6;        % sampling frequency (Hz)
c = 1485;          % speed of sound in water (m/s)
N = 71;            % number of Z positions


load('Zf25_RasterScan_30Wcm2.mat')

z_mm = zeros(N,1);
amplitude = zeros(N,1);
for i = 1:N

    wf = squeeze(rasterscandata(i,1,:));
    wf = double(wf);
    threshold = 0.2 * max(abs(wf));
    index = find(abs(wf) > threshold,1,'first');
    t_arrival = index / fs;
    z_mm(i) = t_arrival * c * 1000;
    amplitude(i) = max(abs(wf));

end

figure;
plot(z_mm, amplitude, '-','LineWidth',2);
grid on;
xlabel('Axial Distance (mm)');
ylabel('Peak Voltage (V)');
title('Axial Acoustic Amplitude Distribution for Z f=25 mm and I=30Wcm2');

%focus
[max_amp, focus_index] = max(amplitude);
focus_position = z_mm(focus_index);
fprintf('\n=========================\n');
fprintf('Focal position at 35f, 30Wcm2 for Z= %.2f mm\n',focus_position);
fprintf('Maximum amplitude at 35f, 30Wcm2 for Z= %.4f V\n',max_amp);
fprintf('=========================\n');

%focal region
half_max = 0.5 * max_amp;
focal_indices = amplitude >= half_max;
focal_z = z_mm(focal_indices);
lower_focus = focal_z(1);
upper_focus = focal_z(end);
focal_length = upper_focus - lower_focus;
fprintf('Focal region start at 35f, 30Wcm2 for Z= %.2f mm\n',lower_focus);
fprintf('Focal region end at 35f, 30Wcm2 for Z= %.2f mm\n',upper_focus);
fprintf('Focal region length at 35f, 30Wcm2 for Z= %.2f mm\n',focal_length);
hold on;
plot(focus_position,max_amp,'r*','MarkerSize',12);
legend('Axial amplitude','Focus');


%XY_11Jun


clear Nx Ny Z x_axis y_axis
load('11-Jun-XYf60_RasterScan.mat')   

Nx = size(rasterscandata,1);
Ny = size(rasterscandata,2);

spacing = 0.5; 
Z = zeros(Nx,Ny);
for i = 1:Nx
    for j = 1:Ny

        wf = squeeze(rasterscandata(i,j,:));
        wf = double(wf);

        Z(i,j) = max(abs(wf));

    end
end

[max_amp, idx] = max(Z(:));
[x_peak, y_peak] = ind2sub(size(Z), idx);

x_axis = (1:Nx) * spacing;
y_axis = (1:Ny) * spacing;
figure;
imagesc(x_axis,y_axis,Z);
set(gca,'YDir','normal');
colorbar;
colormap(turbo);
xlabel('X (mm)');
ylabel('Y (mm)');
title('XY Acoustic Field Map at 60 mm');

hold on;
plot(0,0,'r*','MarkerSize',10); 



x_profile = Z(x_peak,:);
y_profile = Z(:,y_peak);
figure;
plot(x_axis,x_profile,'LineWidth',2);
grid on;
xlabel('X (mm)');
ylabel('Amplitude');
title('X Profile Through Focus');

figure;
plot(y_axis,y_profile,'LineWidth',2);
grid on;
xlabel('Y (mm)');
ylabel('Amplitude');
title('Y Profile Through Focus');



half_max = 0.5 * max_amp;
x_idx = x_profile >= half_max;
x_width = sum(x_idx) * spacing;
y_idx = y_profile >= half_max;
y_width = sum(y_idx) * spacing;
fprintf('\n=====================\n');
fprintf('Peak amplitude at 60f for XY = %.4f\n',max_amp);
fprintf('X beamwidth = %.2f mm\n',x_width);
fprintf('Y beamwidth = %.2f mm\n',y_width);
fprintf('=====================\n');


%XZ_f25


clear;
load('XZf25_RasterScan.mat') 

Nx = size(rasterscandata,1);
Nz = size(rasterscandata,2);
x_spacing = 0.5;   
z_spacing = 1;     

XZ_amplitude = zeros(Nx,Nz);

for i = 1:Nx

    for j = 1:Nz

        wf = squeeze(rasterscandata(i,j,:));

        wf = double(wf);

        XZ_amplitude(i,j) = max(abs(wf));

    end

end

[max_amp,idx] = max(XZ_amplitude(:));
[x_peak,z_peak] = ind2sub(size(XZ_amplitude),idx);


x_axis = ((1:Nx)-x_peak)*x_spacing;
z_axis = ((1:Nz)-z_peak)*z_spacing;
figure;
imagesc(x_axis,z_axis,XZ_amplitude');
set(gca,'YDir','normal')
colorbar
colormap(turbo)
xlabel('X (mm)')
ylabel('Z (mm)')
title('XZ Acoustic Field Map at 25 mm')
hold on
plot(0,0,'r*','MarkerSize',12)



x_profile = XZ_amplitude(:,z_peak);
figure;
plot(x_axis,x_profile,'LineWidth',2)
grid on
xlabel('X (mm)')
ylabel('Amplitude')
title('X Profile Through Focus at 25')



z_profile = XZ_amplitude(x_peak,:);
figure;
plot(z_axis,z_profile,'LineWidth',2)
grid on
xlabel('Z (mm)')
ylabel('Amplitude')
title('Z Profile Through Focus at 25')



half_max = 0.5*max_amp;
x_idx = x_profile >= half_max;
z_idx = z_profile >= half_max;
x_width = sum(x_idx)*x_spacing;
z_width = sum(z_idx)*z_spacing;
fprintf('X beamwidth at 25= %.2f mm\n',x_width)
fprintf('Z beamwidth at 25= %.2f mm\n',z_width)


%XZ_f35


clear;
load('XZf35_RasterScan.mat')  
Nx = size(rasterscandata,1);
Nz = size(rasterscandata,2);


x_spacing = 0.5;   
z_spacing = 1;     

XZ_amplitude = zeros(Nx,Nz);

for i = 1:Nx

    for j = 1:Nz

        wf = squeeze(rasterscandata(i,j,:));

        wf = double(wf);

        XZ_amplitude(i,j) = max(abs(wf));

    end

end

[max_amp,idx] = max(XZ_amplitude(:));


[x_peak,z_peak] = ind2sub(size(XZ_amplitude),idx);


x_axis = ((1:Nx)-x_peak)*x_spacing;
z_axis = ((1:Nz)-z_peak)*z_spacing;
figure;
imagesc(x_axis,z_axis,XZ_amplitude');
set(gca,'YDir','normal')
colorbar
colormap(turbo)
xlabel('X (mm)')
ylabel('Z (mm)')
title('XZ Acoustic Field Map at 35 mm')
hold on
plot(0,0,'r*','MarkerSize',12)



x_profile = XZ_amplitude(:,z_peak);
figure;
plot(x_axis,x_profile,'LineWidth',2)
grid on
xlabel('X (mm)')
ylabel('Amplitude')
title('X Profile Through Focus at 35')



z_profile = XZ_amplitude(x_peak,:);
figure;
plot(z_axis,z_profile,'LineWidth',2)
grid on
xlabel('Z (mm)')
ylabel('Amplitude')
title('Z Profile Through Focus at 35')



half_max = 0.5*max_amp;
x_idx = x_profile >= half_max;
z_idx = z_profile >= half_max;
x_width = sum(x_idx)*x_spacing;
z_width = sum(z_idx)*z_spacing;
fprintf('X beamwidth at 35= %.2f mm\n',x_width)
fprintf('Z beamwidth at 35= %.2f mm\n',z_width)


%XZ_f25


clear;
load('XZf60_RasterScan.mat')  
Nx = size(rasterscandata,1);
Nz = size(rasterscandata,2);


x_spacing = 0.5;   
z_spacing = 1;     

XZ_amplitude = zeros(Nx,Nz);

for i = 1:Nx

    for j = 1:Nz

        wf = squeeze(rasterscandata(i,j,:));
        wf = double(wf);
        XZ_amplitude(i,j) = max(abs(wf));

    end

end

[max_amp,idx] = max(XZ_amplitude(:));


[x_peak,z_peak] = ind2sub(size(XZ_amplitude),idx);


x_axis = ((1:Nx)-x_peak)*x_spacing;
z_axis = ((1:Nz)-z_peak)*z_spacing;

figure;
imagesc(x_axis,z_axis,XZ_amplitude');
set(gca,'YDir','normal')
colorbar
colormap(turbo)
xlabel('X (mm)')
ylabel('Z (mm)')
title('XZ Acoustic Field Map at 60 mm')
hold on
plot(0,0,'r*','MarkerSize',12)




x_profile = XZ_amplitude(:,z_peak);
figure;
plot(x_axis,x_profile,'LineWidth',2)
grid on
xlabel('X (mm)')
ylabel('Amplitude')
title('X Profile Through Focus at 60')



z_profile = XZ_amplitude(x_peak,:);
figure;
plot(z_axis,z_profile,'LineWidth',2)
grid on
xlabel('Z (mm)')
ylabel('Amplitude')
title('Z Profile Through Focus at 60')



half_max = 0.5*max_amp;
x_idx = x_profile >= half_max;
z_idx = z_profile >= half_max;
x_width = sum(x_idx)*x_spacing;
z_width = sum(z_idx)*z_spacing;
fprintf('X beamwidth at 60= %.2f mm\n',x_width)
fprintf('Z beamwidth at 60= %.2f mm\n',z_width)


% TX channels


channels = [1 2 3 4];

peak_voltage = zeros(1,4);
peak_pressure = NaN(1,4);      
sensitivity = NaN;

%ch1

load('Channel1_RasterScan.mat')     

wf = squeeze(rasterscandata(2,1,:));

figure;
plot(wf)
grid on
title('Channel 1 Waveform')
xlabel('Time(s)')
ylabel('Voltage (V)')
start_sample = 6500;          % change after inspecting waveform
end_sample   = 7300;

wf_window = wf(start_sample:end_sample);

figure;
plot(wf_window)
grid on
title('Channel 1 Windowed Pulse')
xlabel('Time(s)')
ylabel('Voltage (V)')
peak_voltage(1) = max(abs(wf_window));

if ~isnan(sensitivity)
    peak_pressure(1) = peak_voltage(1)/sensitivity;
end

%Ch2


load('Channel2_RasterScan.mat')      
wf = squeeze(rasterscandata(2,1,:));

figure;
plot(wf)
grid on
title('Channel 2 Waveform')
xlabel('Time(s)')
ylabel('Voltage (V)')
start_sample = 6500;
end_sample   = 7300;
wf_window = wf(start_sample:end_sample);
figure;
plot(wf_window)
grid on
title('Channel 2 Windowed Pulse')
xlabel('Time(s)')
ylabel('Voltage (V)')
peak_voltage(2) = max(abs(wf_window));

if ~isnan(sensitivity)
    peak_pressure(2) = peak_voltage(2)/sensitivity;
end


%Ch3

load('Channel3_RasterScan.mat')         

wf = squeeze(rasterscandata(2,1,:));

figure;
plot(wf)
grid on
title('Channel 3 Waveform')
xlabel('Time(s)')
ylabel('Voltage (V)')
start_sample = 6500;
end_sample   = 7300;
wf_window = wf(start_sample:end_sample);
figure;
plot(wf_window)
grid on
title('Channel 3 Windowed Pulse')
xlabel('Time(s)')
ylabel('Voltage (V)')
peak_voltage(3) = max(abs(wf_window));

if ~isnan(sensitivity)
    peak_pressure(3) = peak_voltage(3)/sensitivity;
end


%Ch4


load('Channel4_RasterScan.mat')        

wf = squeeze(rasterscandata(2,1,:));

figure;
plot(wf)
grid on
title('Channel 4 Waveform')
xlabel('Time(s)')
ylabel('Voltage (V)')
start_sample = 6500;
end_sample   = 7300;
wf_window = wf(start_sample:end_sample);
figure;
plot(wf_window)
grid on
title('Channel 4 Windowed Pulse')
xlabel('Time(s)')
ylabel('Voltage (V)')
peak_voltage(4) = max(abs(wf_window));

if ~isnan(sensitivity)
    peak_pressure(4) = peak_voltage(4)/sensitivity;
end

%TX channels
figure;
bar(channels, peak_voltage)

grid on
xlabel('Transmit Channel')
ylabel('Peak Voltage (V)')
title('Peak Voltage Measured for Each Transmit Channel')

disp('Peak Voltages (V)')
disp(peak_voltage)
disp('Peak Pressures (MPa)')
disp(peak_pressure)