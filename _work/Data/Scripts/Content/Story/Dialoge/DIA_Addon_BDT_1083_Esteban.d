//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_EXIT   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 999;
	condition   = DIA_Addon_Esteban_EXIT_Condition;
	information = DIA_Addon_Esteban_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Esteban_EXIT_Condition()
{	
	if (Bodyguard_Killer == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Esteban_PICKPOCKET (C_INFO)
{
	npc			= BDT_1083_Addon_Esteban;
	nr			= 900;
	condition	= DIA_Addon_Esteban_PICKPOCKET_Condition;
	information	= DIA_Addon_Esteban_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Addon_Esteban_PICKPOCKET_Condition()
{
	C_Beklauen (105, 500);
};
 
FUNC VOID DIA_Addon_Esteban_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Esteban_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Esteban_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Esteban_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Esteban_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Esteban_PICKPOCKET_DoIt);
};

func void DIA_Addon_Esteban_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Esteban_PICKPOCKET);
};
	
func void DIA_Addon_Esteban_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Esteban_PICKPOCKET);
};
//--------------------------------------------------------------------
//	Info Hi
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Hi   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 2;
	condition   = DIA_Addon_Esteban_Hi_Condition;
	information = DIA_Addon_Esteban_Hi_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Esteban_Hi_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_00");//Tak ty se� ten chlap, co se probojoval a� do t�bora.
	AI_Output (other, self, "DIA_Addon_Esteban_Hi_15_01");//To se to teda rychle rozneslo.
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_02");//Franco byl tvrdej o��ek, nikdo si s n�m rad�i nic neza��nal. Nikdo krom� tebe.
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_03");//Abych to ujasnil, jestli ��kou takovou svi��rnu zkus� na m�, zabiju t�.
};
//--------------------------------------------------------------------
//	Info Mine
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Mine   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 3;
	condition   = DIA_Addon_Esteban_Mine_Condition;
	information = DIA_Addon_Esteban_Mine_Info;
	permanent   = FALSE;
	description = "Chci do dolu!";
};
FUNC INT DIA_Addon_Esteban_Mine_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Hi)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Mine_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Mine_15_00");//Chci se dostat do dolu!
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_01");//(s ��klebkem) To je jasn�. Pak jsi p�i�el na to spr�vn� m�sto.
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_02");//Proto�e ka�dej, kdo kut� v dole, dost�v� p�knou hromadu zlata.
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_03");//A taky pot�ebuje� �erven� kameny, aby t� Thorus pustil dovnit�.
};
//--------------------------------------------------------------------
//	Info Rot
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Rot   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 3;
	condition   = DIA_Addon_Esteban_Rot_Condition;
	information = DIA_Addon_Esteban_Rot_Info;
	permanent   = FALSE;
	description = "Dej mi jeden z t�ch �erven�ch kamen�.";
};
FUNC INT DIA_Addon_Esteban_Rot_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Mine)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Rot_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Rot_15_00");//Dej mi jeden z t�ch �erven�ch kamen�.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_01");//Klidn�, ale nebude to zadarmo.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_02");//Obvykle za n� chci pod�l ze zlata, kter� chlapi dostanou za kop�n�.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_03");//(odhadn�) Co vlastn� v� o dolov�n� zlata?
	if (Hero_HackChance > 25) 
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_04");//U� ses nejsp� p�r trik� nau�il, co?
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_05");//Nezd� se mi, �e bys byl zrovna kop��skej lumen.
	};
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_06");//(j�zliv�) Jestli ti d�m �ervenej k�men, nebude to proto, �e se� tak dobrej kop��.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_07");//Kdepak, m�m pro tebe jinou pr�ci.
	
};
//--------------------------------------------------------------------
//	Info MIS
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_MIS   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 4;
	condition   = DIA_Addon_Esteban_MIS_Condition;
	information = DIA_Addon_Esteban_MIS_Info;
	permanent   = FALSE;
	description = "Jakou pr�ci?";
};
FUNC INT DIA_Addon_Esteban_MIS_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Rot)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_MIS_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_00");//Jakou pr�ci?
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_01");//Jeden bandita se m� sna�il odd�lat. Ale m�sto toho moje str�e zabily JEHO.
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_02");//Zacht�lo se mu tv�ho m�sta, co?
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_03");//Byl to debil! Bandita bez mozku. Sna�it se m� zab�t na vlastn� p�st, to je p�eci �pln� pitomost!
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_04");//Ne, jenom plnil ��kou dohodu � ur�it� ho poslal n�kdo jinej.
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_05");//Tak�e j� m�m zjistit, kdo za t�m opravdu v�z�.
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_06");//A� u� na m� toho vraha poslal kdokoliv, po��dn� si to odsk��e. Najdi ho � a j� t� pust�m do dolu.
	
	if !Npc_IsDead (Senyan)
	&&  Npc_KnowsInfo (other,DIA_Addon_BDT_1084_Senyan_Hi)
	{
		AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_07");//Zrovna v t�hle v�ci m� za tebou poslal Senyan..
		AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_08");//Senyan? Ten pro m� taky pracuje. ��kal jsem mu, a� m� o�i otev�en�.
	};
	
	MIS_Judas = LOG_RUNNING;
	Log_CreateTopic (Topic_Addon_Esteban,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Esteban,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Esteban, "N�kdo Estebanovi usiloval o �ivot. M�m zjistit, kdo to byl.");

};
//--------------------------------------------------------------------
//	Info Attent�ter (Kerl)
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Kerl   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_Kerl_Condition;
	information = DIA_Addon_Esteban_Kerl_Info;
	permanent   = FALSE;
	description = "A pro� bych to m�l d�lat?";
};
FUNC INT DIA_Addon_Esteban_Kerl_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Kerl_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Kerl_15_00");//Co bych v tom m�l d�lat?
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_01");//V tomhle t�bo�e o tom v� ka�dej, tak�e mus� hr�t otev�en�.
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_02");//Sna� se zjistit, kdo stoj� na m� stran� a kdo ne. A nenech se oblafnout.
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_03");//Promluv si se Snafem. Ten tlustej kucha� toho pochyt� spoustu.
	
	B_LogEntry (Topic_Addon_Esteban, "Vin�ka najdu tak, �e si promluv�m se v�emi v t�bo�e a z�sk�m p�ehled, kdo na �� stran� stoj�. Nejlep�� bude za��t s vypt�v�n�m u Snafa, proto�e ten sly�� spoustu v�c�.");
};
//--------------------------------------------------------------------
//	Info Armor 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Armor   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 9;
	condition   = DIA_Addon_Esteban_Armor_Condition;
	information = DIA_Addon_Esteban_Armor_Info;
	permanent   = FALSE;
	description = "Pot�ebuju lep�� zbroj.";
};
FUNC INT DIA_Addon_Esteban_Armor_Condition()
{	
	if (Huno_ArmorCheap == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Armor_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Armor_15_00"); //Pot�ebuju lep�� brn�n�.
	AI_Output (self, other, "DIA_Addon_Esteban_Armor_07_01"); //Na co? Dyk u� jedno m�. Zat�m ti mus� sta�it.
	if (MIS_Judas == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Armor_07_02"); //Kdy� ale spln�, co ti zad�m, m��em si o tom je�t� promluvit.
	};
};
//--------------------------------------------------------------------
//	Info Auftrag
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Auftrag   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 99;
	condition   = DIA_Addon_Esteban_Auftrag_Condition;
	information = DIA_Addon_Esteban_Auftrag_Info;
	permanent   = TRUE;
	description = "Co se t��e toho �kolu...";
};
FUNC INT DIA_Addon_Esteban_Auftrag_Condition()
{	
	if ((MIS_Judas == LOG_RUNNING)
	|| (MIS_Judas == LOG_SUCCESS))
	&& (Bodyguard_Killer == FALSE)	
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Auftrag_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_00");//K tomu �kolu...
	AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_01");//Hele, j� se mus�m starat i o jin� v�ci.
	
	if (MIS_Judas == LOG_SUCCESS)
	{
		AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_02");//J� myslel, �e by ses r�d dozv�d�l, kdo stoj� za t�m �tokem.
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_03");//A kdo? Vyklop jeho jm�no, a� mu m� str�e m��ou zakroutit krkem!
		AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_04");//Sp�skal to obchodn�k Fisk. A zrovna si klidn� sed� za barem, pop�j� a nic netu��.
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_05");//HA! V�born�, chlap�e. M� str�e u� s n�m zametou.
		
		AI_TurnToNpc (self, Wache_01);
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_06");//Sly�eli jste ho, chlapi. B�te na Fiska.
		AI_TurnToNpc (self, other);
		
		Bodyguard_Killer = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_07");//Vra� se, a� zjist�, kdo je to.
		AI_StopProcessInfos(self);
	};
};	
//--------------------------------------------------------------------
//	Info Guards Away
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Away   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_Away_Condition;
	information = DIA_Addon_Esteban_Away_Info;
	permanent   = FALSE;
	description = "A co bude d�l?";
};
FUNC INT DIA_Addon_Esteban_Away_Condition()
{	
	if (Bodyguard_Killer == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Away_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Away_15_00");//A co bude d�l?
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_01");//Co bude d�l? Pov�m ti, co bude d�l.
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_02");//Fiska �ek� p�kn� bolestiv� smrt. A ka�dej v t�bo�e se o tom dozv�.
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_03");//Bude to pro n� varov�n�.
	
	B_StartotherRoutine (Wache_01,"AMBUSH");
	B_StartotherRoutine (Wache_02,"AMBUSH");
};
//--------------------------------------------------------------------
//	Info Stone
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Stone   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_Stone_Condition;
	information = DIA_Addon_Esteban_Stone_Info;
	permanent   = FALSE;
	description = "Dostanu te� ten �erven� k�men?";
};
FUNC INT DIA_Addon_Esteban_Stone_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Esteban_Away)
	&& (Bodyguard_Killer == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Stone_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Stone_15_00");//A dostanu te� ten �erven� k�men?
	AI_Output (self, other, "DIA_Addon_Esteban_Stone_07_01");//Vedl sis dob�e. Takov� lidi se nemaj co plaho�it v dole.
	AI_Output (self, other, "DIA_Addon_Esteban_Stone_07_02");//Tady pro tebe najdu mnohem lep�� vyu�it�. Z�stane� v t�bo�e a bude� pro m� d�lat d�l.
};		
//--------------------------------------------------------------------
//	Info nicht arbeiten
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_not   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_not_Condition;
	information = DIA_Addon_Esteban_not_Info;
	permanent   = FALSE;
	description = "Budu o tom p�em��let.";
};
FUNC INT DIA_Addon_Esteban_not_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Stone)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_not_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_not_15_00");//Pop�em��l�m o tom.
	AI_Output (self, other, "DIA_Addon_Esteban_not_07_01");//Zapom�n�, s k�m mluv�. J� to tady vedu a ty bude� d�lat, co �eknu.
	AI_Output (self, other, "DIA_Addon_Esteban_not_07_02");//A j� ��k�m, �e bude� d�lat pro m� a pro nikoho jin�ho. Je to jasn�?
};
//--------------------------------------------------------------------
//	Info Leibwache weg (fight)
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_fight   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 6;
	condition   = DIA_Addon_Esteban_fight_Condition;
	information = DIA_Addon_Esteban_fight_Info;
	permanent   = FALSE;
	description = "Sna�� se m� tahat za nos?";
};
FUNC INT DIA_Addon_Esteban_fight_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Stone)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_fight_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_00");//Ned�lej ze m� vola. O tom, �e bych pro tebe pracoval, nikdy nebyla �e�.
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_01");//Takovouhle nab�dku hned tak n�kdo nedostane. Ale jestli chce�, tak klidn� m��e� odej�t z t�bora.
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_02");//A co kdybys dodr�el slovo a dal mi ten �erven� k�men?
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_03");//Hele, je�t� slovo a m� str�e ti daj taky p�knou nakl�da�ku.
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_04");//(��klebek) Jak� str�e?
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_05");//Co�e...? �, u� to ch�pu, chce� m� dostat. Jen po�kej...
	
	Bodyguard_Killer = FALSE;
	
	B_KillNpc (Wache_01);
	B_KillNpc (Wache_02);
		
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
//---------------------------------------------------------------------
//	Info Duell
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Duell   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 99;
	condition   = DIA_Addon_Esteban_Duell_Condition;
	information = DIA_Addon_Esteban_Duell_Info;
	permanent   = FALSE;
	description = "OKAM�IT� mi dej ten k�men, nebo si ho vezmu s�m!";
};
FUNC INT DIA_Addon_Esteban_Duell_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Esteban_Rot))
	&& (Bodyguard_Killer != TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Duell_Info()
{	
	AI_Output (other,self,"DIA_Addon_Esteban_Duell_15_00"); //OKAM�IT� mi dej ten �utr, nebo si ho vezmu s�m!
	AI_Output (self,other,"DIA_Addon_Esteban_Duell_07_01"); //Tak ty chce� chc�pnout? No dob�e, ud�l�m ti laskavost a zbav�m t� tv� blbosti.
	
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_NONE, 1);
};




