///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nadja_EXIT   (C_INFO)
{
	npc         = VLK_435_Nadja;
	nr          = 999;
	condition   = DIA_Nadja_EXIT_Condition;
	information = DIA_Nadja_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Nadja_EXIT_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Nadja_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Nadja_PICKPOCKET (C_INFO)
{
	npc			= VLK_435_Nadja;
	nr			= 900;
	condition	= DIA_Nadja_PICKPOCKET_Condition;
	information	= DIA_Nadja_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40_Female;
};                       

FUNC INT DIA_Nadja_PICKPOCKET_Condition()
{
	C_Beklauen (40, 40);
};
 
FUNC VOID DIA_Nadja_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Nadja_PICKPOCKET);
	Info_AddChoice		(DIA_Nadja_PICKPOCKET, DIALOG_BACK 		,DIA_Nadja_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Nadja_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Nadja_PICKPOCKET_DoIt);
};

func void DIA_Nadja_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Nadja_PICKPOCKET);
};
	
func void DIA_Nadja_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Nadja_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info STANDARD
///////////////////////////////////////////////////////////////////////
instance DIA_Nadja_STANDARD		(C_INFO)
{
	npc			 = 	VLK_435_Nadja;
	nr			 =  3;
	condition	 = 	DIA_Nadja_STANDARD_Condition;
	information	 = 	DIA_Nadja_STANDARD_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Nadja_STANDARD_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Bromor_Pay == FALSE)
	{
		return TRUE;
	};
};
var int Nadja_LuciaInfo;
func void DIA_Nadja_STANDARD_Info ()
{
	if (Nadja_LuciaInfo == TRUE)
	{
		AI_Output (self, other, "DIA_ADDON_Nadja_STANDARD_16_00"); //Nap�ed si promluv s Bromorem, teprve pak se s tebou m��u bavit.
	}
	else
	{
		AI_Output (self, other, "DIA_Nadja_STANDARD_16_00"); //Hele, te� zrovna se ti nem��u v�novat, fe��ku. Jestli se chce� pobavit, promluv si s Bromorem.
	};
	
	if (SC_HearedAboutMissingPeople == TRUE)
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
	&& (Nadja_LuciaInfo == FALSE) 
	{
		AI_Output (other, self, "DIA_ADDON_Nadja_STANDARD_15_01"); //Jen jsem ti cht�l polo�it p�r ot�zek ohledn� t�ch zmizel�ch lid�.
		AI_Output (self, other, "DIA_ADDON_Nadja_STANDARD_16_02"); //N�co ti ��ct m��u, ale tady ne, zlato.
		AI_Output (other, self, "DIA_ADDON_Nadja_STANDARD_15_03"); //Poj�me nahoru.
		AI_Output (self, other, "DIA_ADDON_Nadja_STANDARD_16_04"); //Fajn, ale nap�ed si to urovnej s Bromorem. Nechci m�t ��dn� probl�my.
		Nadja_LuciaInfo = TRUE;
	};	
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Danach
///////////////////////////////////////////////////////////////////////
instance DIA_Nadja_Danach		(C_INFO)
{
	npc			 = 	VLK_435_Nadja;
	nr			 =  2;
	condition	 = 	DIA_Nadja_Danach_Condition;
	information	 = 	DIA_Nadja_Danach_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Nadja_Danach_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Bromor_Pay == FALSE)
	&& (Nadja_Nacht == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Nadja_Danach_Info ()
{
	AI_Output (self, other, "DIA_Nadja_Danach_16_00"); //P��t� p�ij� zase!
	Nadja_Nacht = FALSE;
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info STANDARD
///////////////////////////////////////////////////////////////////////
instance DIA_Nadja_hochgehen		(C_INFO)
{
	npc			 = 	VLK_435_Nadja;
	nr			 =  3;
	condition	 = 	DIA_Nadja_hochgehen_Condition;
	information	 = 	DIA_Nadja_hochgehen_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;
	description	 =	"Poj�me nahoru!";
};

func int DIA_Nadja_hochgehen_Condition ()
{	
	if (Bromor_Pay == 1)
	{
		return TRUE;
	};
};
func void DIA_Nadja_hochgehen_Info ()
{
	AI_Output (other, self, "DIA_Nadja_hochgehen_15_00"); //Poj�me nahoru!
	AI_Output (self, other, "DIA_Nadja_hochgehen_16_01"); //Dneska m� ��astn� den, fe��ku. Poj�me.
	
	Bromor_Pay = 2;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"DANCE");
};
///////////////////////////////////////////////////////////////////////
//	Info LuciaInfo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nadja_LuciaInfo		(C_INFO)
{
	npc		 = 	VLK_435_Nadja;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Nadja_LuciaInfo_Condition;
	information	 = 	DIA_Addon_Nadja_LuciaInfo_Info;

	description	 = 	"M��eme si te� pomluvit?";
};
func int DIA_Addon_Nadja_LuciaInfo_Condition ()
{
	if (Bromor_Pay == 2)
	&& (Npc_GetDistToWP (self,"NW_CITY_HABOUR_PUFF_NADJA") < 200) 
	&& (Nadja_LuciaInfo == TRUE)
		{
			return TRUE;
		};
};
var int Nadja_GaveLuciaInfo;
func void DIA_Addon_Nadja_LuciaInfo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Nadja_LuciaInfo_15_00"); //Tak TE� u� si m��eme promluvit?
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_16_01"); //Tady u� m�me dostate�n� soukrom�.
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_16_02"); //Bromor nem� r�d, kdy� v pr�ci kl�bos�me s hostama a on z toho nic nem�.
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_16_03"); //Tak ty by ses r�d dozv�d�l n�co o t�ch lidech, co zmizeli tady v p��stavu?
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_16_04"); //Asi ti moc nepom��u, ale aspo� ti m��u ��ct, co se stalo s Luci�.

	Nadja_GaveLuciaInfo = TRUE;
	
	Info_ClearChoices	(DIA_Addon_Nadja_LuciaInfo);
	Info_AddChoice	(DIA_Addon_Nadja_LuciaInfo, "A kam zmizela?", DIA_Addon_Nadja_LuciaInfo_wo );
	Info_AddChoice	(DIA_Addon_Nadja_LuciaInfo, "Vypr�v�j mi o Lucii.", DIA_Addon_Nadja_LuciaInfo_lucia );
};
func void DIA_Addon_Nadja_LuciaInfo_lucia ()
{
	AI_Output	(other, self, "DIA_Addon_Nadja_LuciaInfo_lucia_15_00"); //Tak mi pov�z n�co o Lucii.
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_lucia_16_01"); //Nikdo tu nelituje, �e ode�la.
	AI_Output	(other, self, "DIA_Addon_Nadja_LuciaInfo_lucia_15_02"); //Pro�?
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_lucia_16_03"); //Mysl�m, �e tady nikomu k ni�emu nebyla.
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_lucia_16_04"); //Byla to fakt mrcha!
};
func void DIA_Addon_Nadja_LuciaInfo_wo ()
{
	AI_Output	(other, self, "DIA_Addon_Nadja_LuciaInfo_wo_15_00"); //A kam tedy zmizela?
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_wo_16_01"); //�asto se sch�zela s Elvrichem, u�n�m tesa�e Thorbena z doln� ��sti m�sta.
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_wo_16_02"); //Vsad�m se, �e utekla s t�m mlad�kem.

	Log_CreateTopic (TOPIC_Addon_Lucia, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Lucia,"Prostitutka Lucia jedn� noci n�hle zmizela. V�ichni si mysl�, �e uprchla s Elvrichem, u�edn�kem tesa�e Thorbena."); 

	Info_AddChoice	(DIA_Addon_Nadja_LuciaInfo, "A kam ti dva mohli zmizet?", DIA_Addon_Nadja_LuciaInfo_Elvrich );
};
func void DIA_Addon_Nadja_LuciaInfo_Elvrich ()
{
	AI_Output			(other, self, "DIA_Addon_Nadja_LuciaInfo_Elvrich_15_00"); //A kam se ti dva mohli ztratit?
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_Elvrich_16_01"); //Jestli je nese�rali vlci, nejsp� z�stali u n�jak�ho sedl�ka.
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_Elvrich_16_02"); //Kam jinam mohli j�t?

	Info_AddChoice	(DIA_Addon_Nadja_LuciaInfo, "V� je�t� n�co dal��ho?", DIA_Addon_Nadja_LuciaInfo_sonst );
};
func void DIA_Addon_Nadja_LuciaInfo_sonst ()
{
	AI_Output			(other, self, "DIA_Addon_Nadja_LuciaInfo_sonst_15_00"); //V� je�t� n�co dal��ho?
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_sonst_16_01"); //Pov�d� se, �e tady v p��stavu zmizela spousta lid�.
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_sonst_16_02"); //Ale nev�m jist�, jestli jim v��it.
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_sonst_16_03"); //M�l by sis promluvit s kupci tady dole.
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_sonst_16_04"); //V�c u� ti bohu�el nepov�m.
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_sonst_16_05"); //A co my dva, zlato? Koneckonc� jsi za to zaplatil.
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_sonst_16_06"); //Nechce� se trochu pobavit, je�t� ne� p�jde�?

	Info_ClearChoices (DIA_Addon_Nadja_LuciaInfo);
	
	//Zusatz 
	if (MIS_Andre_REDLIGHT == LOG_RUNNING)
	&& (Knows_Borka_Dealer == FALSE)
	{
		
		Info_AddChoice (DIA_Addon_Nadja_LuciaInfo,PRINT_Addon_NadjaWait,DIA_Addon_Nadja_WAIT);
	};
	Info_AddChoice (DIA_Addon_Nadja_LuciaInfo,"D�ky, ale u� mus�m j�t.",DIA_Addon_Nadja_LuciaInfo_weiter);
	Info_AddChoice (DIA_Addon_Nadja_LuciaInfo,"Pro� ne?",DIA_Nadja_Poppen_Start);
};
func void DIA_Addon_Nadja_LuciaInfo_weiter ()
{
	AI_Output			(other, self, "DIA_Addon_Nadja_LuciaInfo_weiter_15_00"); //D�ky, ale u� mus�m j�t.
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_weiter_16_01"); //�koda. Tak mo�n� p��t�.
	
	Bromor_Pay = FALSE;
	Nadja_Nacht = (Nadja_Nacht +1);
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID DIA_Addon_Nadja_WAIT()
{
	Info_ClearChoices (DIA_Addon_Nadja_LuciaInfo);
};


///////////////////////////////////////////////////////////////////////
//	Info STANDARD
///////////////////////////////////////////////////////////////////////
instance DIA_Nadja_Poppen	(C_INFO)
{
	npc			 = 	VLK_435_Nadja;
	nr			 =  3;
	condition	 = 	DIA_Nadja_Poppen_Condition;
	information	 = 	DIA_Nadja_Poppen_Info;
	permanent	 = 	TRUE;
	description  = "(U�ijem si)";
};

func int DIA_Nadja_Poppen_Condition ()
{	
	if (Bromor_Pay == 2)
	&& (Npc_GetDistToWP (self,"NW_CITY_HABOUR_PUFF_NADJA") < 300) 
	
	/* Das ist b�se - wenn ich direkt mit Bromor spreche passiert nix mehr. M.F.
	&&  (
		((Nadja_LuciaInfo != 0) && (Nadja_GaveLuciaInfo == 0))
		|| (Nadja_GaveLuciaInfo == TRUE)
		)
	*/	
	
	{
		return TRUE;
	};
};
func void DIA_Nadja_Poppen_Info ()
{
	AI_Output (self, other, "DIA_Nadja_Poppen_16_00"); //Dal��ch p�r hodin pat�� jen a jen n�m.
	AI_Output (self, other, "DIA_Nadja_Poppen_16_01"); //Jen se hezky uvolni. Lehni si a u�ij si to!

	Info_ClearChoices (DIA_Nadja_Poppen);
	Info_AddChoice (DIA_Nadja_Poppen,"Fajn...",DIA_Nadja_Poppen_Start);
};
FUNC VOID DIA_Nadja_Poppen_Start()
{
	Bromor_Pay = FALSE;
	Nadja_Nacht = (Nadja_Nacht +1);
	
	PlayVideo ("LOVESCENE.BIK");
		
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
	/*	
	if Wld_IsTime (00,00,06,00)
	{
		Wld_SetTime (09,00);
	}
	else if Wld_IsTime (06,00,12,00)
	{
		Wld_SetTime (15,00);
	}
	else if Wld_IsTime (12,00,18,00)
	{
		Wld_SetTime (21,00);
	}
	else 
	{
		Wld_SetTime (03,00);	
	};
	*/
	
};

func void DIA_Addon_Nadja_LuciaInfo_Pop ()
{
	DIA_Nadja_Poppen_Start ();
};

///////////////////////////////////////////////////////////////////////
//	Info BUYHERB
///////////////////////////////////////////////////////////////////////
instance DIA_Nadja_BUYHERB		(C_INFO)
{
	npc			 = 	VLK_435_Nadja;
	nr			 = 	2;
	condition	 = 	DIA_Nadja_BUYHERB_Condition;
	information	 = 	DIA_Nadja_BUYHERB_Info;
	permanent	 =	TRUE;
	description	 = 	"Kde bych tu koupil n�jakou tr�vu?";
};
func int DIA_Nadja_BUYHERB_Condition ()
{	
	if 	(MIS_Andre_REDLIGHT == LOG_RUNNING) 
	&& (Npc_KnowsInfo (other,DIA_Nadja_WANT_HERB) == FALSE)
	&& (Nadja_Money == FALSE)
	&& (Undercover_Failed == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Nadja_BUYHERB_Info ()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	
	AI_Output (other, self, "DIA_Nadja_BUYHERB_15_00"); //Kde bych tu koupil n�jak� drogy?
	
	if  (Npc_GetDistToWP (self,"NW_CITY_HABOUR_PUFF_NADJA") < 500) 
	{	
		if (Hlp_IsItem (heroArmor, ItAR_MIl_L) == TRUE) 
		{
			AI_Output (self, other, "DIA_Nadja_BUYHERB_16_01"); //Jak to m�m v�d�t? A i kdybych to v�d�la, ur�it� bych to ne�ekla n�komu od m�stsk� str�e.
			Undercover_Failed = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Nadja_BUYHERB_16_02"); //Jestli ti v�n� m�m n�co ��ct, bude� se muset vytasit s ��kou tou �kv�rou.
			AI_Output (other, self, "DIA_Nadja_BUYHERB_15_03"); //Kolik chce�?
			AI_Output (self, other, "DIA_Nadja_BUYHERB_16_04"); //Spravilo by to 50 zla��k�.
			Nadja_Money = TRUE;
		};
	}
	else 
	{
		B_Say	(self, other,"$NOTNOW");
	};
};
///////////////////////////////////////////////////////////////////////
//	Info WANT_HERB
///////////////////////////////////////////////////////////////////////
instance DIA_Nadja_WANT_HERB		(C_INFO)
{
	npc			 = 	VLK_435_Nadja;
	nr			 = 	2;
	condition	 = 	DIA_Nadja_WANT_HERB_Condition;
	information	 = 	DIA_Nadja_WANT_HERB_Info;
	permanent	 =  FALSE;
	description	 = 	"Tak te� mi �ekni, kde bych mohl koupit n�jakou tr�vu (zaplatit 50 zla��k�).";
};
func int DIA_Nadja_WANT_HERB_Condition ()
{	
	if 	(Npc_HasItems (other, ITmi_Gold) >= 50)
	&&  (Nadja_Money == TRUE)		
	&&  (MIS_Andre_REDLIGHT == LOG_RUNNING) 
	{
		return TRUE;
	};
};
func void DIA_Nadja_WANT_HERB_Info ()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	AI_Output (other, self, "DIA_Nadja_WANT_HERB_15_00"); //A te� mi pov�z, kde bych tu drogu koupil.
	
	if (Hlp_IsItem (heroArmor, ItAR_MIl_L) == TRUE) 
	{
		AI_Output (self, other, "DIA_Nadja_WANT_HERB_16_01"); //Je mi l�to, ale prost� si to nepamatuju.
	}
	else
	{
		B_GiveInvItems	(other, self, ItMi_Gold, 50); 
		AI_Output (self, other, "DIA_Nadja_WANT_HERB_16_02"); //Promluv si s Borkou, fe��ku. Ten by pro tebe mohl n�co m�t.
		Knows_Borka_Dealer = TRUE;
	};
};




 












