///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Borka_EXIT   (C_INFO)
{
	npc         = VLK_434_Borka;
	nr          = 999;
	condition   = DIA_Borka_EXIT_Condition;
	information = DIA_Borka_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Borka_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Borka_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Borka_PICKPOCKET (C_INFO)
{
	npc			= VLK_434_Borka;
	nr			= 900;
	condition	= DIA_Borka_PICKPOCKET_Condition;
	information	= DIA_Borka_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Borka_PICKPOCKET_Condition()
{
	C_Beklauen (80, 120);
};
 
FUNC VOID DIA_Borka_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Borka_PICKPOCKET);
	Info_AddChoice		(DIA_Borka_PICKPOCKET, DIALOG_BACK 		,DIA_Borka_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Borka_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Borka_PICKPOCKET_DoIt);
};

func void DIA_Borka_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Borka_PICKPOCKET);
};
	
func void DIA_Borka_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Borka_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info PISSOF
///////////////////////////////////////////////////////////////////////
instance DIA_Borka_PISSOFF		(C_INFO)
{
	npc			 = 	VLK_434_Borka;
	condition	 = 	DIA_Borka_PISSOFF_Condition;
	information	 = 	DIA_Borka_PISSOFF_Info;
	important	 = 	TRUE;
	permanent	 =  FALSE;
};
func int DIA_Borka_PISSOFF_Condition ()
{
	if (Knows_Borka_Dealer != TRUE)
	&& (Npc_GetDistToNpc(self, other) <= ZivilAnquatschDist)
	{
		return TRUE;
	};
};
func void DIA_Borka_PISSOFF_Info ()
{
	AI_Output (self, other,"DIA_Borka_PISSOFF_11_00");  //Ej, ty! Gdzie idziesz? Niewa¿ne, co zamierzasz - zd¹¿ysz zrobiæ to póŸniej.
	AI_Output (self, other,"DIA_Borka_PISSOFF_11_01");  //Stoisz przed klejnotem Khorinis - CZERWON¥ LATARNI¥. To najcudowniejszy zamtuz w ca³ej Myrtanie, do diaska!
	AI_Output (self, other,"DIA_Borka_PISSOFF_11_02");  //Zawijaj¹ tu ¿eglarze z najdalszych krañców œwiata, tylko po to, ¿eby spêdziæ kilka nocy pod Czerwon¹ Latarni¹.
	AI_Output (self, other,"DIA_Borka_PISSOFF_11_03");  //A teraz ty masz okazjê - nie, zaszczyt - spêdziæ noc z Nadi¹, najbardziej namiêtnym kwiatem stworzonym przez bogów!
	AI_Output (self, other,"DIA_Borka_PISSOFF_11_04");  //WejdŸ, a zaznasz czegoœ, o czym inni nawet nie œnili!
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info TROUBLE
///////////////////////////////////////////////////////////////////////
instance DIA_Borka_TROUBLE		(C_INFO)
{
	npc			 = 	VLK_434_Borka;
	nr 			 =  3;
	condition	 = 	DIA_Borka_TROUBLE_Condition;
	information	 = 	DIA_Borka_TROUBLE_Info;
	permanent	 =  TRUE;
	important	 =  TRUE;
};

func int DIA_Borka_TROUBLE_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_Andre_REDLIGHT != LOG_RUNNING) 
	&& (Npc_IsDead (Nadja) == FALSE) 
	&& (Npc_GetDistToWP (self, "NW_CITY_HABOUR_PUFF_ENTRANCE") <= 500)
	{	
		return TRUE;
	};
};
func void DIA_Borka_TROUBLE_Info ()
{
	AI_Output (self, other, "DIA_Borka_TROUBLE_11_00"); //Dlaczego tam tak stoisz? WejdŸ i spotkaj siê z nasz¹ namiêtn¹ Nadi¹.
	AI_Output (self, other, "DIA_Borka_TROUBLE_11_01"); //Ta rozpalona królowa nocy nada nowe znaczenie twojemu ¿yciu!
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Smoke
///////////////////////////////////////////////////////////////////////
instance DIA_Borka_Smoke		(C_INFO)
{
	npc			 = 	VLK_434_Borka;
	nr 			 =  3;
	condition	 = 	DIA_Borka_Smoke_Condition;
	information	 = 	DIA_Borka_Smoke_Info;
	permanent	 =  TRUE;
	description	 =  "Nie wiesz, gdzie móg³bym kupiæ trochê ziela?";
};

func int DIA_Borka_Smoke_Condition ()
{	
	if  (MIS_Andre_REDLIGHT == LOG_RUNNING) 
	&&  (Knows_Borka_Dealer == FALSE)
	{	
		return TRUE;
	};
};
func void DIA_Borka_Smoke_Info ()
{
	AI_Output (other, self, "DIA_Borka_Smoke_15_00"); //Nie wiesz, gdzie móg³bym kupiæ trochê ziela?
	AI_Output (self, other, "DIA_Borka_Smoke_11_01"); //Nie. Zje¿d¿aj!
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info BUYHERB
///////////////////////////////////////////////////////////////////////
instance DIA_Borka_BUYHERB		(C_INFO)
{
	npc			 = 	VLK_434_Borka;
	nr			 = 	2;
	condition	 = 	DIA_Borka_BUYHERB_Condition;
	information	 = 	DIA_Borka_BUYHERB_Info;
	permanent 	 =  TRUE;
	description	 = 	"S³ysza³em, ¿e sprzedajesz ziele.";
};
func int DIA_Borka_BUYHERB_Condition ()
{
	if (Knows_Borka_Dealer == TRUE)
	&& (MIS_Andre_REDLIGHT == LOG_RUNNING) 
	&& (Borka_Deal == FALSE)
	&& (Undercover_Failed == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Borka_BUYHERB_Info ()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	
	AI_Output (other, self, "DIA_Borka_BUYHERB_15_00"); //S³ysza³em, ¿e sprzedajesz ziele.
	
	if (Hlp_IsItem (heroArmor, ItAR_MIl_L) == TRUE) 
	{
		AI_Output (self, other, "DIA_Borka_BUYHERB_11_01"); //Przepraszam, panie Stra¿niku. To jakaœ pomy³ka. Ja nic nie wiem o zielu.
	}
	else
	{
		AI_Output (self, other, "DIA_Borka_BUYHERB_11_02"); //Kto tak powiedzia³?
	
		Info_ClearChoices 	(DIA_Borka_BUYHERB);
		Info_AddChoice		(DIA_Borka_BUYHERB,"To nieistotne.",DIA_Borka_BUYHERB_Egal);
		Info_AddChoice		(DIA_Borka_BUYHERB,"Tak mówi Nadja.",DIA_Borka_BUYHERB_Nadja);
	};
};
FUNC VOID DIA_Borka_BUYHERB_Egal ()
{
	AI_Output	(other, self, "DIA_Borka_BUYHERB_Egal_15_00"); //To nieistotne.
	AI_Output	(self, other, "DIA_Borka_BUYHERB_Egal_11_01"); //Chcê siê po prostu upewniæ, kto ciê przys³a³.
	
	Info_ClearChoices 	(DIA_Borka_BUYHERB);
	Info_AddChoice		(DIA_Borka_BUYHERB,"Tak mówi Nadja.",DIA_Borka_BUYHERB_Nadja);
	Info_AddChoice		(DIA_Borka_BUYHERB,"No to chcesz dobiæ targu, czy nie?",DIA_Borka_BUYHERB_Deal);
};
FUNC VOID DIA_Borka_BUYHERB_NADJA ()
{
	AI_Output (other, self, "DIA_Borka_BUYHERB_NADJA_15_00"); //Tak mówi Nadja.
	AI_Output (self, other, "DIA_Borka_BUYHERB_NADJA_11_01"); //No proszê, ma³y ptaszek zaœpiewa³. Wiesz co, nie powinieneœ wierzyæ we wszystko, co ta dziewka wygaduje.
	
	Nadja_Victim = TRUE; 
	Undercover_Failed = TRUE;
	Info_ClearChoices 	(DIA_Borka_BUYHERB);
};
FUNC VOID DIA_Borka_BUYHERB_Deal ()
{
	AI_Output (other, self, "DIA_Borka_BUYHERB_Deal_15_00"); //No to chcesz dobiæ targu, czy nie?
	AI_PlayAni (self, "T_SEARCH");
	AI_Output (self, other, "DIA_Borka_BUYHERB_Deal_11_01"); //...w porz¹dku... dogadajmy siê. Ty dajesz mi 50 sztuk z³ota, wtedy ja ci dajê ziele. Bez targowania siê.
	Info_ClearChoices 	(DIA_Borka_BUYHERB);
	Borka_Deal = TRUE;
};	
///////////////////////////////////////////////////////////////////////
//	Info SECOND_CHANCE
///////////////////////////////////////////////////////////////////////
instance DIA_Borka_SECOND_CHANCE		(C_INFO)
{
	npc			 = 	VLK_434_Borka;
	nr			 = 	2;
	condition	 = 	DIA_Borka_SECOND_CHANCE_Condition;
	information	 = 	DIA_Borka_SECOND_CHANCE_Info;
	permanent	 =  TRUE;  	
	description	 = 	"Dogadajmy siê (zap³aæ 50 sztuk z³ota).";
};
func int DIA_Borka_SECOND_CHANCE_Condition ()
{	
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	
	if 	(Borka_Deal == TRUE)
	&&  (Npc_HasItems (other, ItmI_Gold) >= 50)
	&&  (Hlp_IsItem (heroArmor, ItAR_MIl_L) == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Borka_SECOND_CHANCE_Info ()
{
	AI_Output (other, self, "DIA_Borka_SECOND_CHANCE_15_00"); //Dobijmy targu. Tu mam z³oto.
	B_GiveInvItems (hero, self, ItMi_Gold, 50);
	AI_Output (self, other, "DIA_Borka_SECOND_CHANCE_11_01"); //W porz¹dku...
	AI_PlayAni (self, "T_SEARCH");
	AI_Output (self, other, "DIA_Borka_SECOND_CHANCE_11_02"); //...oto œwie¿a soczysta ³odyga ziela.
	B_GiveInvItems (self, hero, ItMi_Joint, 1);
	Borka_Deal = 2;
	AI_StopProcessInfos (self);
};






