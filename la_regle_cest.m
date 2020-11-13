clc();
clearvars();
k=1;kn=1e-2;L=0.1;R=0.1;J=20;ku=20;
wr=10;

ks=30/pi*ku*kn/k;
w0=k/sqrt(L*J);
xi=w0/2*R*J/k^2;

D=[1/w0^2,2*xi/w0,1+ks*kn];
racinesBF=roots(D);
racinesBO=roots([1/w0^2,2*xi/w0,1]);
Hbo=tf([ks],[1/w0^2,2*xi/w0,1])*tf([1],[1/wr,1]);
w=logspace(-2,2,10000);
[module,phase,wout]=bode(Hbo,w);
figure;
fenGain=subplot(1,1,1);
bodeGain=semilogx(fenGain,w,20 .*log10(module(:)));
g(1).LineWidth=1.5;
grid(fenGain,'on');
grid(fenGain,'minor');
title(fenGain,'Diagramme de Bode de gain');
fenGain.XAxisLocation='origin';
fenGain.XLabel.Interpreter='latex';
fenGain.XLabel.FontSize=14;
xlabel(fenGain,'$\omega\;\left(\mathrm{rad.s}^{-1}\right)$');
fenGain.YLabel.Interpreter='latex';
fenGain.YLabel.FontSize=14;
ylabel(fenGain,'$G\;\left(\mathrm{dB}\right)$');
fenGain.GridAlpha=0.8;
fenGain.MinorGridAlpha=0.8;


%diagramme de Bode phase
figure;
fen=subplot(1,1,1);
g=semilogx(fen,w,phase(:));
g(1).LineWidth=1.5;
grid(fen,'on');
grid(fen,'minor');
title(fen,'Diagramme de Bode de phase');
fen.XAxisLocation='origin';
fen.XLabel.Interpreter='latex';
fen.XLabel.FontSize=14;
xlabel(fen,'$\omega\;\left(\mathrm{rad.s}^{-1}\right)$');
fen.YLabel.Interpreter='latex';
fen.YLabel.FontSize=14;
ylabel(fen,'$\varphi\;\left(\circ\right)$');
fen.GridAlpha=0.8;
fen.MinorGridAlpha=0.8;




