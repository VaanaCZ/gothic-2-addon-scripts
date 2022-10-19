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
	const string BDT_1020_Wegelagerer_Checkpoint		= "NW_TROLLAREA_PATH_46"; //Die Br¸cke
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
	AI_Output (self, other,"DIA_BDT_1020_Wegelagerer_FirstWarn_06_00"); //Hej ty, st˘j!
	AI_Output (other, self,"DIA_BDT_1020_Wegelagerer_FirstWarn_15_01"); //Co chceö?
	AI_Output (self, other,"DIA_BDT_1020_Wegelagerer_FirstWarn_06_02"); //Jestli nechceö, abych ti nÏjakou nat·hnul, mÏl bys nÏkolik mincÌ ze svojÌ kapsy p¯esunout do t˝ m˝. A pronto!
	
	other.aivar[AIV_LastDistToWP] 			= Npc_GetDistToWP(other,BDT_1020_Wegelagerer_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
	
 	Info_ClearChoices (DIA_BDT_1020_Wegelagerer_FirstWarn);
 	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Kolik chceö?",DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch);
 	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"To si dÏl·ö srandu.",DIA_BDT_1020_Wegelagerer_FirstWarn_Joke);
 	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Z cesty!",DIA_BDT_1020_Wegelagerer_PissOff);
	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	{
		Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"ÿekni, nevidÏl jsi novice?",DIA_BDT_1020_Wegelagerer_AGON);
	};
};
FUNC VOID DIA_BDT_1020_Wegelagerer_AGON ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_AGON_15_00"); //ÿekni, nevidÏl jsi novice?
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_AGON_06_01"); //(zmatenÏ) Ehm - co? Hmm... (p¯em˝ölÌ) Jo, to by mohlo b˝t.
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_AGON_06_02"); //Dej mi 20 zlat˝ch a j· ti to povÌm!

	Wegelagerer_Surprise = TRUE;

	if (Npc_HasItems (other,ItMi_gold) >= 20)
	{ 
		Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Dobr·, dobr·, tady jsou ty prachy.",DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney);
	};
	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"PromiÚ, nem·m û·dnÈ penÌze.",DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney);
	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Jdi mi z cesty.",DIA_BDT_1020_Wegelagerer_FirstWarn_Never);
};
FUNC VOID DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch_15_00"); //Kolik chceö?
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch_06_01"); //(smÏje se) 20 zlat˝ch a m˘ûeme bejt k·moöi.
	
	Info_ClearChoices (DIA_BDT_1020_Wegelagerer_FirstWarn);
	
	if (Npc_HasItems (other,ItMi_gold) >= 20)
	{ 
		Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Dobr·, dobr·, tady jsou ty prachy.",DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney);
	};
	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"PromiÚ, nem·m û·dnÈ penÌze.",DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney);
	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Jdi mi z cesty.",DIA_BDT_1020_Wegelagerer_FirstWarn_Never);
		
};
FUNC VOID DIA_BDT_1020_Wegelagerer_FirstWarn_Joke ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_15_00"); //To si dÏl·ö srandu.
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_01"); //Vypad·m na to?
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_02"); //Pokud neuvidÌm 20 zlat˝ch, staËÌ udÏlat jedinej krok navÌc a...
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_03"); //V tom p¯ÌpadÏ tÏ sejmu. Tak uû ty prachy naval.
	
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;
	Info_ClearChoices (DIA_BDT_1020_Wegelagerer_FirstWarn);
	
	if (Npc_HasItems (other,ItMi_gold) >= 20)
	{ 
		Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Dobr·, dobr·, tady jsou ty prachy.",DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney);
	};
	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"PromiÚ, nem·m û·dnÈ penÌze.",DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney);
	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Jdi mi z cesty.",DIA_BDT_1020_Wegelagerer_FirstWarn_Never);
	
};
FUNC VOID DIA_BDT_1020_Wegelagerer_PissOff ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_PissOff_15_00"); //Z cesty!
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_PissOff_06_01"); //Ty m·ö ale velkou hubu na tak vychrtl˝ho zaprcatÏl˝ho chl·pka.
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_PissOff_06_02"); //Uû je naËase, abych ti ji zav¯el.
	
	AI_StopProcessInfos (self);
	
	B_Attack (self ,other,AR_NONE, 1);
};
FUNC VOID DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_15_00"); //Dobr·, dobr·, tady jsou ty prachy.
	
	if (Wegelagerer_Surprise == FALSE)
	{
		AI_Output (self,other ,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_01"); //(jÌzlivÏ) ÿÌkal jsem si, ûe 20 zlat˝ch nenÌ tak velk· cena za tv˘j ûivot. M˘ûeö projÌt.
	};
	if (Wegelagerer_Surprise == TRUE)
	{
		AI_Output (self,other ,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_02"); //Fajn, tak ten novic tudy proöel p¯ed necelou hodinou.
		AI_Output (self,other ,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_03"); //MÏl docela naspÏch. Celou dobu se ohlÌûel. A teÔ se zdejchni.
	};
	B_GiveInvItems (other,self ,itmi_gold,20);
	self.aivar[AIV_PASSGATE]						= TRUE;
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_15_00"); //PromiÚ, nem·m û·dnÈ penÌze.
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_01"); //Jo, jsou to teÔ zl˝ Ëasy, co.
	
	if Npc_HasEquippedMeleeWeapon (other)
	{
		AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_02"); //Ale nÏco ti povÌm - dej mi svou zbraÚ. Pak tÏ nech·m projÌt.
	
		Info_ClearChoices (DIA_BDT_1020_Wegelagerer_FirstWarn);
		Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"ZapomeÚ na to.",DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon);
		Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Tady, vezmi si mou zbraÚ.",DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon);
	}
	else
	{
		AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_03"); //J· ti ¯eknu co: vraù se, aû budeö mÌt nÏjak˝ penÌze. é·dn˝ prachy, û·dnej most.
		
		self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
		AI_StopProcessInfos (self);
		
	};		
};
FUNC VOID DIA_BDT_1020_Wegelagerer_FirstWarn_Never ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_FirstWarn_Never_15_00"); //Jdi mi z cesty.
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Never_06_01"); //Takûe ty to chceö tÌm tÏûöÌm zp˘sobem?
	
	AI_StopProcessInfos (self);
	B_Attack (self,other,AR_NONE, 1);
};
FUNC VOID DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon_15_00"); //ZapomeÚ na to.
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon_06_01"); //Dobr·, tak teda tvrdÏ.
	
	AI_StopProcessInfos (self);
	B_Attack (self,other,AR_NONE, 1);
};
FUNC VOID DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon_15_00"); //Tady, vezmi si mou zbraÚ.
	
	AI_DrawWeapon (other);
	
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon_06_01"); // Nech tu zbraÚ na pokoji. Jen poËkej!
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
	AI_Output (self, other,"DIA_BDT_1020_Wegelagerer_SecondWarn_06_00"); //V·ûnÏ chceö jeötÏ dostat öanci? Je to tvoje pr·vo.
	
	Info_ClearChoices (DIA_BDT_1020_Wegelagerer_SecondWarn);
	if (Npc_HasItems (other,ItMi_gold) >= 20)
	{
		Info_AddChoice (DIA_BDT_1020_Wegelagerer_SecondWarn,"Tady jsou penÌze.",DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney);
	};
	Info_AddChoice (DIA_BDT_1020_Wegelagerer_SecondWarn,"Ned·m ti ani tronÌk.",DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney);
	
	
	other.aivar[AIV_LastDistToWP] 			= Npc_GetDistToWP (other,BDT_1020_Wegelagerer_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
};
FUNC VOID DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney ()
{
	
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney_15_00"); //Tady jsou penÌze.
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney_06_01"); //¡, ono uû se s tebou d· mluvit.
	
	B_GiveInvItems (other,self ,itmi_gold,20);
	self.aivar[AIV_PASSGATE]						= TRUE;
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney_15_00"); //Ned·m ti ani mÏÔ·k.
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney_06_01"); //Tak si ho vezmu s·m.
	
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
	
	AI_StopProcessInfos	(self);												//dem Spieler sofort wieder die Kontrolle zur¸ckgeben
	
	B_Attack (self, other, AR_NONE, 1);
};
