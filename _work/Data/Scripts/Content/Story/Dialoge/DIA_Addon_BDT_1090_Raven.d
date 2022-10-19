// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Raven_EXIT (C_INFO)
{
	npc			= BDT_1090_Addon_Raven;
	nr			= 999;
	condition	= DIA_Addon_Raven_EXIT_Condition;
	information	= DIA_Addon_Raven_EXIT_Info;
	permanent	= TRUE;
	description	= DIALOG_ENDE;
};        
FUNC INT DIA_Addon_Raven_EXIT_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Addon_Raven_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 				  	
// ************************************************************
// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Raven_Hi (C_INFO)
{
	npc			= BDT_1090_Addon_Raven;
	nr			= 1;
	condition	= DIA_Addon_Raven_Hi_Condition;
	information	= DIA_Addon_Raven_Hi_Info;
	permanent	= FALSE;
	important	= TRUE;
};        
FUNC INT DIA_Addon_Raven_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Raven_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_00");//A hele, kdo to p�i�el. 
	if (C_BodyStateContains(self, BS_SIT))
	{
		NPC_StopAni (self,"T_PRAY_RANDOM");
		AI_PlayAniBS (self, "T_PRAY_2_STAND",BS_STAND);
		AI_TurnToNpc (self,	other);
	};
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_01");//M�j p�n m� varoval, �e sem Innos po�le sv� poskoky.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_02");//Jen jsem ne�ekal, �e se tu objev� tak brzo.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_03");//Ale kdy� u� jsi to dok�zal tak rychle (sm�je se), bude� m�t taky rychlou smrt.
	
	Info_ClearChoices (DIA_Addon_Raven_Hi);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Ten, kdo um�e, bude� TY.",DIA_Addon_Raven_Hi_DU);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Zaprodals du�i Beliarovi!",DIA_Addon_Raven_Hi_Soul);
};
FUNC VOID DIA_Addon_Raven_Hi_DU()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_00");//Omyl, to TEBE te� �ek� smrt.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_04");//(sm�je se) Nejsi pro m� ��dn� hrozba. Nos�m Beliar�v me�.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_05");//Povedu draky na pevninu. Spolu svrhneme sv�t lid� do nehlub��ch temnot.
};
FUNC VOID DIA_Addon_Raven_Hi_Soul()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_01");//Ty jsi zaprodal du�i Beliarovi!
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_06");//Za dobrou cenu povedu jeho arm�dy jako gener�l.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_07");//A co ty? V�, jakou cenu m� TVOJE du�e?
	
	Info_ClearChoices (DIA_Addon_Raven_Hi);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Ch�pu. Tak to nebudeme zdr�ovat.",DIA_Addon_Raven_Hi_Attack);
	Info_AddChoice (DIA_Addon_Raven_Hi,"D�l�m jen to, co je t�eba.",DIA_Addon_Raven_Hi_only);

};
FUNC VOID DIA_Addon_Raven_Hi_only()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_02");//Jen d�l�m, co mus� b�t vykon�no.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_08");//(sm�je se) Jen si ho poslechn�te. Poslali jste mi pokorn�ho slu�ebn�ka Innosova! (nahlas se sm�je)
	
	Info_ClearChoices (DIA_Addon_Raven_Hi);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Ch�pu. Tak poj�me na to.",DIA_Addon_Raven_Hi_Attack);
	Info_AddChoice (DIA_Addon_Raven_Hi,"V�n� si mysl�, �e slou��m Innosovi?",DIA_Addon_Raven_Hi_Sure);	
};
FUNC VOID DIA_Addon_Raven_Hi_Sure()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_03");//A v� tak jist�, �e jsem zrovna Innos�v slu�ebn�k? 
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_09");//Co? Co to pov�d�?
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_04");//Nezv�ils n�kdy mo�nost, �e bych mohl b�t t�ebas i slu�ebn�kem Adana?
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_10");//(sm�je se) Nesmysl!
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_05");//A mo�n� �e TAKY slou��m Beliarovi � nebo jenom s�m sob�. 
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_11");//(u�kl�b� se) No, v tom p��pad� pro m� nejse� vhodn�m protivn�kem.
	
	Info_ClearChoices (DIA_Addon_Raven_Hi);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Ch�pu. Tak poj�me na to.",DIA_Addon_Raven_Hi_Attack);
};
FUNC VOID DIA_Addon_Raven_Hi_Attack()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_06");//Ch�pu. Tak za�n�me.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_12");//(u�kl�b� se) To se v�n� tak t�� na smrt? Ale kdy� na tom trv�.
	
	AI_StopProcessInfos	(self); 
	B_Attack (self, other, AR_SuddenEnemyInferno,1);
};
/*
--------------
10 *NEU* DIA_Addon_Raven_Add_10_00 //Seht wer gekommen ist. 
10 *NEU* DIA_Addon_Raven_Add_10_01 //Mein Meister hat mich davor gewarnt, da� Innos seine Schergen schicken w�rde.
10 *NEU* DIA_Addon_Raven_Add_10_02 //Aber das du so fr�h auftauchst, h�tte ich nicht erwartet.
10 *NEU* DIA_Addon_Raven_Add_10_03 //Nun, da du so schnell warst (lacht) werde ich dir auch einen schnellen Tod schenken.
--------------
15 *NEU* DIA_Addon_Raven_Add_15_00 //DU bist derjenige der sterben wird.
10 *NEU* DIA_Addon_Raven_Add_10_04 //(lacht) Du bist keine Bedrohung f�r mich. Ich trage Beliars Schwert.
10 *NEU* DIA_Addon_Raven_Add_10_05 //Ich werde die Drachen auf's Festland f�hren. Zusammen werden wir die Welt der Menschen in tiefste Dunkelheit tauchen.
--------------
15 *NEU* DIA_Addon_Raven_Add_15_01 //Du hast deine Seele an Beliar verkauft!
10 *NEU* DIA_Addon_Raven_Add_10_06 //Zu einem guten Preis. Als General werde ich seine Armeen befehligen.
10 *NEU* DIA_Addon_Raven_Add_10_07 //Und was ist mit dir? Wei�t du wieviel DEINE Seele wert ist?
--------------
15 *NEU* DIA_Addon_Raven_Add_15_02 //Ich mache nur das, was getan werden muss.
10 *NEU* DIA_Addon_Raven_Add_10_08 //(lacht) H�rt ihn euch an. Einen bescheidenen Diener schickst du mir Innos! (Lacht laut)
--------------
15 *NEU* DIA_Addon_Raven_Add_15_03 //Bist du sicher, dass ich ein Diener Innos bin? 
10 *NEU* DIA_Addon_Raven_Add_10_09 //Was? Was redest du da?
15 *NEU* DIA_Addon_Raven_Add_15_04 //H�ltst du es nicht f�r m�glich das ich ein Diener Adanos bin?
10 *NEU* DIA_Addon_Raven_Add_10_10 //(lacht) Unsinn!
15 *NEU* DIA_Addon_Raven_Add_15_05 //Vielleicht diene auch ICH Beliar - oder nur mir selbst. 
10 *NEU* DIA_Addon_Raven_Add_10_11 //(h�hnt) Nun, in diesem Fall wirst du nicht einmal ein w�rdiger Gegner f�r mich sein!
--------------
15 *NEU* DIA_Addon_Raven_Add_15_06 //Mir reichts jetzt. Lass uns anfangen...
10 *NEU* DIA_Addon_Raven_Add_10_12 //(h�hnt) Hast du es so eilig zu sterben? Ganz, wie du willst...
--------------

*/




 

