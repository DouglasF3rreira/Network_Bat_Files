@echo off

Set StrNicName="VirtualBox"
Set NetworkMask=255.255.252.0
Set IPsArray=(1,2,3,4,5)

echo Placa de rede %StrNicName%
echo 1 - Configurar os IPs estaticos
echo 2 - Ativar DHCP
echo ---------------------------------------------
Set /P UserChoice=Escolha 1 ou 2 baseado no menu acima:

If %UserChoice%==1 GoTo ConfigStaticIp
If %UserChoice%==2 GoTo ConfigDhcp

:ConfigStaticIp
For %%j in %IPsArray% Do netsh interface ipv4 add address %StrNicName% 2.5.5.%%j %NetworkMask%
Call :EndOfScript

:ConfigDhcp
netsh interface ipv4 set address name=%StrNicName% dhcp
Call :EndOfScript

:EndOfScript
cls
echo Fim!
pause>nul
exit