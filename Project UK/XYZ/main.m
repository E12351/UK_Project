% XYZf('XYZ.csv');
%XYZf('1.csv');
%XYZf('04 AM.csv');
clc;
% Find all windows of type figure, which have an empty FileName attribute.
allPlots = findall(0, 'Type', 'figure', 'FileName', []);
% Close.
delete(allPlots);

% XYZf('11 AM.csv',0,500);
% XYZf('11 AM.csv',1,500);

% ----------------------------------------------------------test
x = XYZf('11 AM.csv',2,600);

% figure;
% plot(x);

sz = size(x);

l=sz(1);
F = zeros(100,10); % plot
F1 = zeros(100,1);
F_S = zeros(10,10); %matix for compare

a = 1; % main loop
i=2;   % sub loop
c = 1; % change col number
k1 = 1;
k2 = 1;

while i < l
    if (x(i-1) > x(i)) % find the peek.
        for j = i:i+12
            
            if i+12 > 200 %avoid the exception.(out of bound)
                break;
            end
            
            if (x(j) < -5) && (x(j) > -10.5)
%                 fprintf('%f\n',x(j));

                F(a,c) = x(j);
                F1(a,1) = x(j); %filtered data.
                
                F_S(k2,k1) = x(j);
                
                k1 = k1 + 1;
                a = a+1;
            end 
        end
        k1=1;
        k2 = k2 +1;
        i=j; % start form where it stop.
        c = c+1;
    end
    i = i+1;
    
end

% 
% figure;
% plot(F1);

% figure;
% plot(F);

% figure;
% plot(F_S);

% figure;
% plot(F_S(:,6));

% --------------------------------------------------compare--
x1 = XYZf('XYZ.csv',1,600);
sz1 = size(x);

l1=sz1(1);

F_S1 = zeros(1,13); %matix for compare

a1 = 1; % main loop
i1=2;   % sub loop
c1 = 1; % change col number

k1 = 1;
k2 = 1;

while i1 < l
    if (x(i1-1) > x(i1)) % find the peek.
        
        for j1 = i1:i1+12
            if i1+12 > 200 %avoid the exception.(out of bound)
                break;
            end
            
            if (x1(j1) < -5) && (x1(j1) > -10.5)
%                 fprintf('%f\n',x1(j1));

                F_S1(1,k1) = x(j1);
                 
                a1 = a1+1;
                k1 = k1 + 1;
            end 
        end
        
%         figure;
%         plot(F_S1);

%         -------------------
        FLAG = 0;
        for b = 1:14
            for p = 1:13
                SUB(b,p) = F_S(b,p) - F_S1(p);
                
                   if SUB(b,p) > 1.5
                        SUB(b,p) = 100;
                        FLAG=1;
                    end
                    if SUB(b,p) < -1.5
                        SUB(b,p) = 100;
                        FLAG=1;
                    end 
                    if p == 13 && FLAG == 0
                        fprintf('Walking pattern found.\n');
                    end
            end
            FLAG = 0;
        end
%         ------------------
        k1 = 1;
        i1=j1; % start form where it stop.
        c1 = c1+1;
        k2 = k2+1;
    end
    i1 = i1+1;
    
end

figure;
plot(SUB);

% -----------------------------------------------------------

% 
% 
% XYZf('37 AM.csv',2,200);
% XYZf('37 AM.csv',1,200);
% XYZf('37 AM.csv',0,200);
% 
% XYZf('11 AM (2).csv',0,500);
% XYZf('11 AM (2).csv',1,500);
% XYZf('11 AM (2).csv',2,500);