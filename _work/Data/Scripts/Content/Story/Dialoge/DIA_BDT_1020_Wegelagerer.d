// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_BDT_1020_Wegelagerer_EXIT(C_INFO)
{
	npc			= BDT_1020_Bandit_L;
	nr			= 999;
	condition	= DIA_Wegelagerer_EXIT_Condition;
	information	= DIA_Wegelagerer_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Wegelagerer_EXIT_Condition()
{
		return TRUE;
};
FUNC VOID DIA_Wegelagerer_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************
// ------------------------------------------------------------
	const string BDT_1020_Wegelagerer_Checkpoint		= "NW_TROLLAREA_PATH_46"; //Die Br�cke
// ------------------------------------------------------------
instance DIA_BDT_1020_Wegelagerer_FirstWarn (C_INFO)
{
	npc			= BDT_1020_Bandit_L;
	nr			= 1;
	condition	= DIA_BDT_1020_Wegelagerer_FirstWarn_Condition;
	information	= DIA_BDT_1020_Wegelagerer_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       
func int DIA_BDT_1020_Wegelagerer_FirstWarn_Condition()
{
	if ((other.aivar[AIV_Guardpassage_Status]			== GP_NONE		)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE		)
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE			))
	{
		return TRUE;
	};
};
func void DIA_BDT_1020_Wegelagerer_FirstWarn_Info()
{
	AI_Output (self, other,"DIA_BDT_1020_Wegelagerer_FirstWarn_06_00"); //Hej ty, st�j!
	AI_Output (other, self,"DIA_BDT_1020_Wegelagerer_FirstWarn_15_01"); //Co chce�?
	AI_Output (self, other,"DIA_BDT_1020_Wegelagerer_FirstWarn_06_02"); //Jestli nechce�, abych ti n�jakou nat�hnul, m�l bys n�kolik minc� ze svoj� kapsy p�esunout do t� m�. A pronto!
	
	other.aivar[AIV_LastDistToWP] 			= Npc_GetDistToWP(other,BDT_1020_Wegelagerer_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
	
 	Info_ClearChoices (DIA_BDT_1020_Wegelagerer_FirstWarn);
 	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Kolik chce�?",DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch);
 	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"To si d�l� srandu.",DIA_BDT_1020_Wegelagerer_FirstWarn_Joke);
 	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Z cesty!",DIA_BDT_1020_Wegelagerer_PissOff);
	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	{
		Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"�ekni, nevid�l jsi novice?",DIA_BDT_1020_Wegelagerer_AGON);
	};
};
FUNC VOID DIA_BDT_1020_Wegelagerer_AGON ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_AGON_15_00"); //�ekni, nevid�l jsi novice?
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_AGON_06_01"); //(zmaten�) Ehm - co? Hmm... (p�em��l�) Jo, to by mohlo b�t.
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_AGON_06_02"); //Dej mi 20 zlat�ch a j� ti to pov�m!

	Wegelagerer_Surprise = TRUE;

	if (Npc_HasItems (other,ItMi_gold) >= 20)
	{ 
		Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Dobr�, dobr�, tady jsou ty prachy.",DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney);
	};
	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Promi�, nem�m ��dn� pen�ze.",DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney);
	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Jdi mi z cesty.",DIA_BDT_1020_Wegelagerer_FirstWarn_Never);
};
FUNC VOID DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch_15_00"); //Kolik chce�?
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch_06_01"); //(sm�je se) 20 zlat�ch a m��eme bejt k�mo�i.
	
	Info_ClearChoices (DIA_BDT_1020_Wegelagerer_FirstWarn);
	
	if (Npc_HasItems (other,ItMi_gold) >= 20)
	{ 
		Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Dobr�, dobr�, tady jsou ty prachy.",DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney);
	};
	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Promi�, nem�m ��dn� pen�ze.",DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney);
	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Jdi mi z cesty.",DIA_BDT_1020_Wegelagerer_FirstWarn_Never);
		
};
FUNC VOID DIA_BDT_1020_Wegelagerer_FirstWarn_Joke ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_15_00"); //To si d�l� srandu.
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_01"); //Vypad�m na to?
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_02"); //Pokud neuvid�m 20 zlat�ch, sta�� ud�lat jedinej krok nav�c a...
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_03"); //V tom p��pad� t� sejmu. Tak u� ty prachy naval.
	
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;
	Info_ClearChoices (DIA_BDT_1020_Wegelagerer_FirstWarn);
	
	if (Npc_HasItems (other,ItMi_gold) >= 20)
	{ 
		Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Dobr�, dobr�, tady jsou ty prachy.",DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney);
	};
	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Promi�, nem�m ��dn� pen�ze.",DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney);
	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Jdi mi z cesty.",DIA_BDT_1020_Wegelagerer_FirstWarn_Never);
	
};
FUNC VOID DIA_BDT_1020_Wegelagerer_PissOff ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_PissOff_15_00"); //Z cesty!
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_PissOff_06_01"); //Ty m� ale velkou hubu na tak vychrtl�ho zaprcat�l�ho chl�pka.
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_PissOff_06_02"); //U� je na�ase, abych ti ji zav�el.
	
	AI_StopProcessInfos (self);
	
	B_Attack (self ,other,AR_NONE, 1);
};
FUNC VOID DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_15_00"); //Dobr�, dobr�, tady jsou ty prachy.
	
	if (Wegelagerer_Surprise == FALSE)
	{
		AI_Output (self,other ,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_01"); //(j�zliv�) ��kal jsem si, �e 20 zlat�ch nen� tak velk� cena za tv�j �ivot. M��e� proj�t.
	};
	if (Wegelagerer_Surprise == TRUE)
	{
		AI_Output (self,other ,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_02"); //Fajn, tak ten novic tudy pro�el p�ed necelou hodinou.
		AI_Output (self,other ,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_03"); //M�l docela nasp�ch. Celou dobu se ohl�el. A te� se zdejchni.
	};
	B_GiveInvItems (other,self ,itmi_gold,20);
	self.aivar[AIV_PASSGATE]						= TRUE;
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_15_00"); //Promi�, nem�m ��dn� pen�ze.
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_01"); //Jo, jsou to te� zl� �asy, co.
	
	if Npc_HasEquippedMeleeWeapon (other)
	{
		AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_02"); //Ale n�co ti pov�m - dej mi svou zbra�. Pak t� nech�m proj�t.
	
		Info_ClearChoices (DIA_BDT_1020_Wegelagerer_FirstWarn);
		Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Zapome� na to.",DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon);
		Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Tady, vezmi si mou zbra�.",DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon);
	}
	else
	{
		AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_03"); //J� ti �eknu co: vra� se, a� bude� m�t n�jak� pen�ze. ��dn� prachy, ��dnej most.
		
		self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
		AI_StopProcessInfos (self);
		
	};		
};
FUNC VOID DIA_BDT_1020_Wegelagerer_FirstWarn_Never ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_FirstWarn_Never_15_00"); //Jdi mi z cesty.
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Never_06_01"); //Tak�e ty to chce� t�m tꞚ�m zp�sobem?
	
	AI_StopProcessInfos (self);
	B_Attack (self,other,AR_NONE, 1);
};
FUNC VOID DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon_15_00"); //Zapome� na to.
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon_06_01"); //Dobr�, tak teda tvrd�.
	
	AI_StopProcessInfos (self);
	B_Attack (self,other,AR_NONE, 1);
};
FUNC VOID DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon_15_00"); //Tady, vezmi si mou zbra�.
	
	AI_DrawWeapon (other);
	
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon_06_01"); // Nech tu zbra� na pokoji. Jen po�kej!
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_GuardStopsIntruder, 1);
};
// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE DIA_BDT_1020_Wegelagerer_SecondWarn (C_INFO)
{
	npc			= BDT_1020_Bandit_L;
	nr			= 2;
	condition	= DIA_BDT_1020_Wegelagerer_SecondWarn_Condition;
	information	= DIA_BDT_1020_Wegelagerer_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_BDT_1020_Wegelagerer_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_1020_Wegelagerer_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	)) 
	{
		return TRUE;
	};
};
func void DIA_BDT_1020_Wegelagerer_SecondWarn_Info()
{
	AI_Output (self, other,"DIA_BDT_1020_Wegelagerer_SecondWarn_06_00"); //V�n� chce� je�t� dostat �anci? Je to tvoje pr�vo.
	
	Info_ClearChoices (DIA_BDT_1020_Wegelagerer_SecondWarn);
	if (Npc_HasItems (other,ItMi_gold) >= 20)
	{
		Info_AddChoice (DIA_BDT_1020_Wegelagerer_SecondWarn,"Tady jsou pen�ze.",DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney);
	};
	Info_AddChoice (DIA_BDT_1020_Wegelagerer_SecondWarn,"Ned�m ti ani tron�k.",DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney);
	
	
	other.aivar[AIV_LastDistToWP] 			= Npc_GetDistToWP (other,BDT_1020_Wegelagerer_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
};
FUNC VOID DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney ()
{
	
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney_15_00"); //Tady jsou pen�ze.
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney_06_01"); //�, ono u� se s tebou d� mluvit.
	
	B_GiveInvItems (other,self ,itmi_gold,20);
	self.aivar[AIV_PASSGATE]						= TRUE;
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney_15_00"); //Ned�m ti ani m���k.
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney_06_01"); //Tak si ho vezmu s�m.
	
	AI_StopProcessInfos (self);
	B_Attack (self ,other,AR_NONE, 1);
	
};
// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE DIA_BDT_1020_Wegelagerer_Attack (C_INFO)
{
	npc			= BDT_1020_Bandit_L;
	nr			= 3;
	condition	= DIA_BDT_1020_Wegelagerer_Attack_Condition;
	information	= DIA_BDT_1020_Wegelagerer_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_BDT_1020_Wegelagerer_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_1020_Wegelagerer_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	))
	{
		return TRUE;
	};
};
func void DIA_BDT_1020_Wegelagerer_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] 			= 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_StopProcessInfos	(self);												//dem Spieler sofort wieder die Kontrolle zur�ckgeben
	
	B_Attack (self, other, AR_NONE, 1);
};
