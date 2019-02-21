function [ pas ] = spplot(varargin)
%Plotter phasors
figure1=figure('Position', [0, 0, 1024, 1200]);
subplot(2,1,1)

msg =  'Fejl';
set(0,'DefaultLegendAutoUpdate','off')

maxval = 0;
minval = 0;
clrs = {[0 0.4470 0.7410], 	[0.8500 0.3250 0.0980], [0.9290 0.6940 0.1250], [0.4940 0.1840 0.5560],[0.4660 0.6740 0.1880],[0.3010 0.7450 0.9330],  	[0.6350 0.0780 0.1840]};


first = 0;
if nargin == 1
    
    
    sum = varargin{1};
    Vinkel = sum(2);
    Scale = 1;
    Laengde = sum(1);
    vinkel = @(x) exp(1i*x*pi/180);
    dummyX=Laengde*Scale;
    plot=dummyX*vinkel(Vinkel);
    compass(plot);
    max_lim = abs(Laengde)*Scale ;
    x_fake=[0 max_lim 0 -max_lim];
    y_fake=[max_lim 0 -max_lim 0];
    h_fake=compass(x_fake,y_fake);
    hold on
    p1=compass(plot);
    set(h_fake,'Visible','off');
    set(findall(gcf, 'String', '30', '-or','String','60') ,'String', '  ');
    set(findall(gcf, 'String', '0'),'String', ' ' );
    set(findall(gcf, 'String', '330'),'String', ' ');
    set(findall(gcf, 'String', '300'),'String', ' ' );
    set(findall(gcf, 'String', '270'),'String', ' ');
    set(findall(gcf, 'String', '240'),'String', ' ' );
    set(findall(gcf, 'String', '210'),'String', ' ');
    set(findall(gcf, 'String', '180'),'String', ' ');
    set(findall(gcf, 'String', '150'),'String', ' ' );
    set(findall(gcf, 'String', '120'),'String', ' ');
    set(findall(gcf, 'String', '90'),'String', ' ' );
    
    for m=0:0.5:abs(Laengde)*2
        set(findall(gcf, 'String', ['  ' num2str(m)]),'String', '  ');
    end
    p1(1).LineWidth = 2;
    p1(1).Color='k';
    if 150 > Vinkel && Vinkel >= 0
        text(real(plot)+2,imag(plot)+2,[ num2str(abs(Laengde)) ' {\angle} ' num2str(Vinkel) '^{\circ}' ])
    elseif 360 > Vinkel && Vinkel >= 210
        text(real(plot)-2,imag(plot)-2,[ num2str(abs(Laengde)) ' {\angle} ' num2str(Vinkel) '^{\circ}' ])
    elseif 210 > Vinkel && Vinkel >= 150
        text(real(plot)-2,imag(plot)+2,[ num2str(abs(Laengde)) ' {\angle} ' num2str(Vinkel) '^{\circ}' ])
    elseif Vinkel < 0
        text(real(plot)-2,imag(plot)-2,[ num2str(abs(Laengde)) ' {\angle} ' num2str(Vinkel) '^{\circ}' ])
    else
        msg = 'Error occurred.';
        error(msg)
    end
    
elseif nargin >= 2
    
    
    
    
    for m=1:1:nargin
        
        M = varargin{m};
        Vinkel = M(2);
        
        Laengde = M(1);
        
        if contains(inputname(m),'v','IgnoreCase',true)
            Scale = 1;
            enhed = 'V';
            pre = strcat(inputname(m), ': ');
        elseif contains(inputname(m),'I','IgnoreCase',true)
            Scale = 1;
            enhed = 'A';
            pre = strcat(inputname(m), ': ');
            
        elseif contains(inputname(m),'X','IgnoreCase',true)
            Scale = 1;
            enhed = '\Omega';
            if Vinkel > 0
                pre='X_L:' ;
            elseif Vinkel < 0
                pre='X_C:' ;
            else
                msg = 'Error occurred.';
                error(msg)
            end
        elseif contains(inputname(m),'S','IgnoreCase',true)
            Scale = 1;
            enhed = 'VA';
            pre='S:';
        elseif contains(inputname(m),'Q','IgnoreCase',true)
            Scale = 1;
            enhed = 'VAr';
            pre='Q:';
        elseif contains(inputname(m),'P','IgnoreCase',true)
            Scale = 1;
            enhed = 'W';
            pre='P:';
        elseif contains(inputname(m),'R','IgnoreCase',true)
            Scale = 1;
            enhed = '\Omega';
            pre='R:';
        elseif contains(inputname(m),'Z','IgnoreCase',true)
            Scale = 1;
            enhed = '\Omega';
            pre='Z:';
        else
            Scale = 1;
            enhed = ' ';
            pre=inputname(m);
        end
        
        
        
        
        if first == 0
            for ii=1:1:nargin
                O = varargin{ii};
                if abs(O(1)) > maxval
                    maxval = abs(O(1));
                    
                end
                
            end
            
            
            
            max_lim = abs(maxval) ;
            x_fake=[0 max_lim 0 -max_lim];
            y_fake=[max_lim 0 -max_lim 0];
            h_fake=compass(x_fake,y_fake);
            hold on
            first = 1;
        end
        
        
        
        vinkel = @(x) exp(1i*x*pi/180);
        dummyX=Laengde*Scale;
        plot=dummyX*vinkel(Vinkel);
        
        
        p1=compass(plot);
        if m == nargin
            set(h_fake,'Visible','off');
            set(findall(gcf, 'String', '30', '-or','String','60') ,'String', '  ');
            set(findall(gcf, 'String', '0'),'String', ' ' );
            set(findall(gcf, 'String', '330'),'String', ' ');
            set(findall(gcf, 'String', '300'),'String', ' ' );
            set(findall(gcf, 'String', '270'),'String', ' ');
            set(findall(gcf, 'String', '240'),'String', ' ' );
            set(findall(gcf, 'String', '210'),'String', ' ');
            set(findall(gcf, 'String', '180'),'String', ' ');
            set(findall(gcf, 'String', '150'),'String', ' ' );
            set(findall(gcf, 'String', '120'),'String', ' ');
            set(findall(gcf, 'String', '90'),'String', ' ' );
            
            
            for y=1:1:5
                if y==5
                    for u=1:1:(abs(maxval)/5)*(y*3)
                        set(findall(gcf, 'String', ['  ' num2str(u)]),'String', '  ');
                    end
                else
                    for u=1:1:(abs(maxval)/5)*(y)
                        set(findall(gcf, 'String', ['  ' num2str(u)]),'String', '  ');
                    end
                end
            end
        end
        
        
        
        string=strcat(num2str(Laengde,'%100.2f'),' \angle ',num2str(Vinkel,'%100.2f'),'^{\circ}');
        p1(1).LineWidth = 2;
        p1(1).Color=clrs{m};
        p1(1).DisplayName=string;
        
        
        
        if 150 > Vinkel && Vinkel >= 0 || 150 > 360-Vinkel && 360-Vinkel >= 0
            text(real(plot)*1.15,imag(plot)*1.15,[pre ' ' num2str(abs(Laengde),'%100.2f') ' '  enhed ' {\angle} ' num2str(Vinkel,'%100.2f') '^{\circ}' ])
            
        elseif 360 > Vinkel && Vinkel >= 210 || 360 > 360-Vinkel && 360-Vinkel >= 210
            text(real(plot)*1.15,imag(plot)*1.15,[pre ' ' num2str(abs(Laengde),'%100.2f') ' ' enhed ' {\angle} ' num2str(Vinkel,'%100.2f') '^{\circ}' ])
            
        elseif 210 > Vinkel && Vinkel >= 150 || 210 > 360-Vinkel && 360-Vinkel >= 150
            text(real(plot)*1.15,imag(plot)*1.15,[pre ' ' num2str(abs(Laengde),'%100.2f') ' '  enhed ' {\angle} ' num2str(Vinkel,'%100.2f') '^{\circ}' ])
            
        elseif Vinkel < 0 || 360-Vinkel < 0
            
            
        else
            msg = 'Error occurred.';
            error(msg)
            
            
        end
        text(real(plot)*1.15,imag(plot)*1.15,[pre ' ' num2str(abs(Laengde),'%100.2f') ' ' enhed ' {\angle} ' num2str(Vinkel,'%100.2f') '^{\circ}' ])
    end
    hold off
else
    msg = 'Error occurred.';
    error(msg)
    hold off
end
hold off

%---------------------------------------------------------------
firstthis = 0;
subplot(2,1,2)

for k=1:1:nargin
    
    BB = varargin{k};
    Vinkel1 = BB(2);
    
    Laengde1 = BB(1);
    
    xt = @(t) Laengde1.*sin(2*pi*t-(deg2rad(Vinkel1)));
    p2=fplot(xt,[0 2]);
    
    grid on
    ax = gca;
    ax.XTick =  0:0.25:2;
    ax.XTickLabel = {'0^\circ','90^\circ','180^\circ','270^\circ','360^\circ','450^\circ','540^\circ','630^\circ','720^\circ'};
    
    p2(1).LineWidth = 2;
    p2(1).Color=clrs{k};
    
    hold on
end

hold off










end
