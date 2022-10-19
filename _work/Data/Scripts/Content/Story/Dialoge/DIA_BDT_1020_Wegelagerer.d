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
	const string BDT_1020_Wegelagerer_Checkpoint		= "NW_TROLLAREA_PATH_46"; //Die Brücke
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
	AI_Output (self, other,"DIA_BDT_1020_Wegelagerer_FirstWarn_06_00"); //Hej ty, stùj!
	AI_Output (other, self,"DIA_BDT_1020_Wegelagerer_FirstWarn_15_01"); //Co chceš?
	AI_Output (self, other,"DIA_BDT_1020_Wegelagerer_FirstWarn_06_02"); //Jestli nechceš, abych ti nêjakou natáhnul, mêl bys nêkolik mincí ze svojí kapsy pâesunout do tý mý. A pronto!
	
	other.aivar[AIV_LastDistToWP] 			= Npc_GetDistToWP(other,BDT_1020_Wegelagerer_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
	
 	Info_ClearChoices (DIA_BDT_1020_Wegelagerer_FirstWarn);
 	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Kolik chceš?",DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch);
 	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"To si dêláš srandu.",DIA_BDT_1020_Wegelagerer_FirstWarn_Joke);
 	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Z cesty!",DIA_BDT_1020_Wegelagerer_PissOff);
	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	{
		Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Âekni, nevidêl jsi novice?",DIA_BDT_1020_Wegelagerer_AGON);
	};
};
FUNC VOID DIA_BDT_1020_Wegelagerer_AGON ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_AGON_15_00"); //Âekni, nevidêl jsi novice?
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_AGON_06_01"); //(zmatenê) Ehm - co? Hmm... (pâemýšlí) Jo, to by mohlo být.
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_AGON_06_02"); //Dej mi 20 zlatých a já ti to povím!

	Wegelagerer_Surprise = TRUE;

	if (Npc_HasItems (other,ItMi_gold) >= 20)
	{ 
		Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Dobrá, dobrá, tady jsou ty prachy.",DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney);
	};
	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Promià, nemám žádné peníze.",DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney);
	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Jdi mi z cesty.",DIA_BDT_1020_Wegelagerer_FirstWarn_Never);
};
FUNC VOID DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch_15_00"); //Kolik chceš?
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch_06_01"); //(smêje se) 20 zlatých a mùžeme bejt kámoši.
	
	Info_ClearChoices (DIA_BDT_1020_Wegelagerer_FirstWarn);
	
	if (Npc_HasItems (other,ItMi_gold) >= 20)
	{ 
		Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Dobrá, dobrá, tady jsou ty prachy.",DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney);
	};
	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Promià, nemám žádné peníze.",DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney);
	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Jdi mi z cesty.",DIA_BDT_1020_Wegelagerer_FirstWarn_Never);
		
};
FUNC VOID DIA_BDT_1020_Wegelagerer_FirstWarn_Joke ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_15_00"); //To si dêláš srandu.
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_01"); //Vypadám na to?
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_02"); //Pokud neuvidím 20 zlatých, staèí udêlat jedinej krok navíc a...
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_03"); //V tom pâípadê tê sejmu. Tak už ty prachy naval.
	
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;
	Info_ClearChoices (DIA_BDT_1020_Wegelagerer_FirstWarn);
	
	if (Npc_HasItems (other,ItMi_gold) >= 20)
	{ 
		Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Dobrá, dobrá, tady jsou ty prachy.",DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney);
	};
	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Promià, nemám žádné peníze.",DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney);
	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Jdi mi z cesty.",DIA_BDT_1020_Wegelagerer_FirstWarn_Never);
	
};
FUNC VOID DIA_BDT_1020_Wegelagerer_PissOff ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_PissOff_15_00"); //Z cesty!
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_PissOff_06_01"); //Ty máš ale velkou hubu na tak vychrtlýho zaprcatêlýho chlápka.
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_PissOff_06_02"); //Už je naèase, abych ti ji zavâel.
	
	AI_StopProcessInfos (self);
	
	B_Attack (self ,other,AR_NONE, 1);
};
FUNC VOID DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_15_00"); //Dobrá, dobrá, tady jsou ty prachy.
	
	if (Wegelagerer_Surprise == FALSE)
	{
		AI_Output (self,other ,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_01"); //(jízlivê) Âíkal jsem si, že 20 zlatých není tak velká cena za tvùj život. Mùžeš projít.
	};
	if (Wegelagerer_Surprise == TRUE)
	{
		AI_Output (self,other ,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_02"); //Fajn, tak ten novic tudy prošel pâed necelou hodinou.
		AI_Output (self,other ,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_03"); //Mêl docela naspêch. Celou dobu se ohlížel. A teë se zdejchni.
	};
	B_GiveInvItems (other,self ,itmi_gold,20);
	self.aivar[AIV_PASSGATE]						= TRUE;
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_15_00"); //Promià, nemám žádné peníze.
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_01"); //Jo, jsou to teë zlý èasy, co.
	
	if Npc_HasEquippedMeleeWeapon (other)
	{
		AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_02"); //Ale nêco ti povím - dej mi svou zbraà. Pak tê nechám projít.
	
		Info_ClearChoices (DIA_BDT_1020_Wegelagerer_FirstWarn);
		Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Zapomeà na to.",DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon);
		Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Tady, vezmi si mou zbraà.",DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon);
	}
	else
	{
		AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_03"); //Já ti âeknu co: vraã se, až budeš mít nêjaký peníze. Žádný prachy, žádnej most.
		
		self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
		AI_StopProcessInfos (self);
		
	};		
};
FUNC VOID DIA_BDT_1020_Wegelagerer_FirstWarn_Never ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_FirstWarn_Never_15_00"); //Jdi mi z cesty.
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Never_06_01"); //Takže ty to chceš tím têžším zpùsobem?
	
	AI_StopProcessInfos (self);
	B_Attack (self,other,AR_NONE, 1);
};
FUNC VOID DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon_15_00"); //Zapomeà na to.
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon_06_01"); //Dobrá, tak teda tvrdê.
	
	AI_StopProcessInfos (self);
	B_Attack (self,other,AR_NONE, 1);
};
FUNC VOID DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon_15_00"); //Tady, vezmi si mou zbraà.
	
	AI_DrawWeapon (other);
	
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon_06_01"); // Nech tu zbraà na pokoji. Jen poèkej!
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
	AI_Output (self, other,"DIA_BDT_1020_Wegelagerer_SecondWarn_06_00"); //Vážnê chceš ještê dostat šanci? Je to tvoje právo.
	
	Info_ClearChoices (DIA_BDT_1020_Wegelagerer_SecondWarn);
	if (Npc_HasItems (other,ItMi_gold) >= 20)
	{
		Info_AddChoice (DIA_BDT_1020_Wegelagerer_SecondWarn,"Tady jsou peníze.",DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney);
	};
	Info_AddChoice (DIA_BDT_1020_Wegelagerer_SecondWarn,"Nedám ti ani troník.",DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney);
	
	
	other.aivar[AIV_LastDistToWP] 			= Npc_GetDistToWP (other,BDT_1020_Wegelagerer_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
};
FUNC VOID DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney ()
{
	
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney_15_00"); //Tady jsou peníze.
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney_06_01"); //Á, ono už se s tebou dá mluvit.
	
	B_GiveInvItems (other,self ,itmi_gold,20);
	self.aivar[AIV_PASSGATE]						= TRUE;
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney_15_00"); //Nedám ti ani mêëák.
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney_06_01"); //Tak si ho vezmu sám.
	
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
	
	AI_StopProcessInfos	(self);												//dem Spieler sofort wieder die Kontrolle zurückgeben
	
	B_Attack (self, other, AR_NONE, 1);
};
