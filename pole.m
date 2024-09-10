clear all; clc; close all; 

R=0.22;
K2=2.53*10^(-3); %Backconstans
C=7.72*10^(-7);
L=73*10^(-6);
J=1.3*10^(-5);
Kt=24.2*10^(-3); %Torque c
U=24;
TL = 0;%2635e-3;
reference_rpm_task3 = 12;

tfwa = [-TL*L,-TL*R+U*Kt];
tfwb = U.*[L*J, R*J+C*L, C*R+K2*Kt];

tfia = [U*J, U*C+K2*TL];
tfib = U.*[L*J, R*J+C*L, C*R+K2*Kt];

tf_w = tf(tfwa, tfwb);
tf_i = tf(tfia, tfib);

sim_w = tf([-TL*R+U*Kt], U.*[R*J, C*R+K2*Kt]);
sim_i = tf([U*J, U*C+K2*TL], U.*[R*J, C*R+K2*Kt]);


figure(1);
rlocus(tf_w);
title("w");


figure(2);
rlocus(tf_i);
title("i");

figure(3)
rlocus(sim_w);
title("sim w");

figure(4)
rlocus(sim_i);
title("sim ")
