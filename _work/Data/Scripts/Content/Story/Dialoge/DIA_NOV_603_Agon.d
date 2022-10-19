
//***********************************************************************
//	Info EXIT 
//***********************************************************************

INSTANCE DIA_Agon_EXIT   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 999;
	condition   = DIA_Agon_EXIT_Condition;
	information = DIA_Agon_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Agon_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Agon_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//************************************************************************
//			Hello
//************************************************************************

INSTANCE DIA_Agon_Hello   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 2;
	condition   = DIA_Agon_Hello_Condition;
	information = DIA_Agon_Hello_Info;
	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_Agon_Hello_Condition()
{
	if  (Npc_IsInState (self,ZS_Talk))
	&&	(MIS_SCHNITZELJAGD == FALSE)
	&&  (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Agon_Hello_Info()
{
	AI_Output (self ,other,"DIA_Agon_Hello_07_00"); //(opovržlivê) Co chceš?
};

// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Agon_Wurst(C_INFO)
{
	npc         = NOV_603_Agon;
	nr			= 2;
	condition	= DIA_Agon_Wurst_Condition;
	information	= DIA_Agon_Wurst_Info;
	permanent	= FALSE;
	description = "Tumáš, mám tu pro tebe skopovou klobásu.";
};                       

FUNC INT DIA_Agon_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Agon_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Agon_Wurst_15_00"); //Tumáš, mám tu pro tebe skopovou klobásu.
	AI_Output (self, other, "DIA_Agon_Wurst_07_01"); //Ovèí klobása, ovèí sýr... ovèí mléko... už mi to všechno leze krkem.
	AI_Output (other, self, "DIA_Agon_Wurst_15_02"); //Tak chceš tu klobásu, nebo ne?
	AI_Output (self, other, "DIA_Agon_Wurst_07_03"); //Ale no tak ji sem dej!
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};
//***********************************************************************
//	Ich bin Neu hier.
//***********************************************************************

INSTANCE DIA_Agon_New   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 1;
	condition   = DIA_Agon_New_Condition;
	information = DIA_Agon_New_Info;
	permanent   = FALSE;
	description = "Jsem tady nový.";
};

FUNC INT DIA_Agon_New_Condition()
{
	if (MIS_SCHNITZELJAGD == FALSE)
	&& (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Agon_New_Info()
{
	AI_Output	(other,self ,"DIA_Agon_New_15_00"); //Jsem tady nový.
	AI_Output	(self ,other,"DIA_Agon_New_07_01"); //To vidím.
	AI_Output	(self ,other,"DIA_Agon_New_07_02"); //Jestli zatím nemáš co na práci, promluv si s Parlanem. On už ti nêjakou dá.
};
//***********************************************************************
//	Was ist zwischen dir und Babo passiert?
//***********************************************************************

INSTANCE DIA_Agon_YouAndBabo   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 1;
	condition   = DIA_Agon_YouAndBabo_Condition;
	information = DIA_Agon_YouAndBabo_Info;
	permanent   = FALSE;
	description = "Co se stalo mezi tebou a Babem?";
};

FUNC INT DIA_Agon_YouAndBabo_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Opolos_Monastery)
	&& (MIS_SCHNITZELJAGD == FALSE))
	&& (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Agon_YouAndBabo_Info()
{
	AI_Output	(other,self ,"DIA_Agon_YouAndBabo_15_00"); //Co se stalo mezi tebou a Babem?
	AI_Output	(self ,other,"DIA_Agon_YouAndBabo_07_01"); //Nemêl bys vêâit všemu, co uslyšíš.
	AI_Output	(self ,other,"DIA_Agon_YouAndBabo_07_02"); //(neústupnê) Âeknême si jedno: pùjdu svou vlastní cestou. Tou, kterou mi pâedurèil Innos.
	AI_Output	(self ,other,"DIA_Agon_YouAndBabo_07_03"); //Nedovolím nikomu stát mi v cestê, a urèitê ne tomu jelimánkovi Babovi.

	Info_ClearChoices 	(DIA_Agon_YouAndBabo);
	Info_AddChoice	(DIA_Agon_YouAndBabo,"Nemêli bychom my novicové držet pohromadê?",DIA_Agon_YouAndBabo_AllTogether);
	Info_AddChoice	(DIA_Agon_YouAndBabo,"Innos sám ví, jakou cestou bychom se mêli vydat.",DIA_Agon_YouAndBabo_InnosWay);
	Info_AddChoice	(DIA_Agon_YouAndBabo,"Vycházíme spolu docela dobâe.",DIA_Agon_YouAndBabo_Understand);
};

FUNC VOID DIA_Agon_YouAndBabo_AllTogether ()
{
	AI_Output (other,self ,"DIA_Agon_YouAndBabo_AllTogether_15_00"); //Nemêli bychom my novicové držet pohromadê?
	AI_Output (self ,other,"DIA_Agon_YouAndBabo_AllTogether_07_01"); //Vy ostatní si držte pohromadê, jak chcete.
	AI_Output (self ,other,"DIA_Agon_YouAndBabo_AllTogether_07_02"); //Ale prosím, neplýtvej mým èasem. (chladnê) A nestav se mi do cesty.
	
	Info_ClearChoices 	(DIA_Agon_YouAndBabo);
};

FUNC VOID DIA_Agon_YouAndBabo_InnosWay ()
{
	AI_Output	(other,self ,"DIA_Agon_YouAndBabo_InnosWay_15_00"); //Innos sám ví, jakou cestou bychom se mêli vydat.
	AI_Output 	(self ,other,"DIA_Agon_YouAndBabo_InnosWay_07_01"); //Moje rodina vždycky stála vysoko v Innosovê pâízni a na tom se nic nezmêní.
	
	Info_ClearChoices 	(DIA_Agon_YouAndBabo);
};
FUNC VOID DIA_Agon_YouAndBabo_Understand ()
{
	AI_Output	(other,self ,"DIA_Agon_YouAndBabo_Understand_15_00"); //Vycházíme spolu docela dobâe.
	AI_Output 	(self ,other,"DIA_Agon_YouAndBabo_Understand_07_01"); //To doufám. Až budu mágem, mùžu za tebe ztratit slùvko.
	
	Info_ClearChoices 	(DIA_Agon_YouAndBabo);
};
//************************************************************************
//	Kann ich bei dir Kräuter bekommen?
//************************************************************************

INSTANCE DIA_Agon_GetHerb   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 1;
	condition   = DIA_Agon_GetHerb_Condition;
	information = DIA_Agon_GetHerb_Info;
	permanent   = TRUE;
	description = "Co tady pêstujete?";
};

FUNC INT DIA_Agon_GetHerb_Condition()
{
	if (MIS_SCHNITZELJAGD == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Agon_GetHerb_Info()
{
	AI_Output (other,self ,"DIA_Agon_GetHerb_15_00"); //Co tady pêstujete?
	AI_Output (self ,other,"DIA_Agon_GetHerb_07_01"); //Snažíme se vypêstovat léèivé byliny, aby mohl mistr Neoras vaâit lektvary.
};
//************************************************************************
//	Agon ist in der Höhle
//************************************************************************

INSTANCE DIA_Agon_GolemDead   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 1;
	condition   = DIA_Agon_GolemDead_Condition;
	information = DIA_Agon_GolemDead_Info;
	permanent   = FALSE;
	important 	= TRUE;
};

FUNC INT DIA_Agon_GolemDead_Condition()
{
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (Npc_IsDead (Magic_Golem))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Agon_GolemDead_Info()
{
	AI_Output (self ,other,"DIA_Agon_GolemDead_07_00"); //(vítêznê) Jdeš pozdê!
	AI_Output (self ,other,"DIA_Agon_GolemDead_07_01"); //Byl jsem tady první! Vyhrál jsem!
	 
	Info_ClearChoices (DIA_Agon_GolemDead);
	Info_AddChoice (DIA_Agon_GolemDead,"(výhrùžnê) Jenom pokud se odsud dostaneš živý.",DIA_Agon_GolemDead_NoWay);
	Info_AddChoice (DIA_Agon_GolemDead,"Drž hubu!",DIA_Agon_GolemDead_ShutUp);
	Info_AddChoice (DIA_Agon_GolemDead,"Gratuluji, vážnê sis to zasloužil.",DIA_Agon_GolemDead_Congrat);
};

FUNC VOID DIA_Agon_GolemDead_NoWay ()
{
	AI_Output (other,self ,"DIA_Agon_GolemDead_NoWay_15_00"); //(výhrùžnê) Jenom pokud se odsud dostaneš živý.
	AI_Output (self ,other,"DIA_Agon_GolemDead_NoWay_07_01"); //Chceš mê zabít? To se ti nikdy nepovede.

	AI_StopProcessInfos (self);	
	B_Attack (self,other,AR_NONE, 1);
};

FUNC VOID DIA_Agon_GolemDead_ShutUp ()
{
	AI_Output (other,self ,"DIA_Agon_GolemDead_ShutUp_15_00"); //Drž hubu!
	AI_Output (self ,other,"DIA_Agon_GolemDead_ShutUp_07_01"); //(výsmêšnê) Nemáš nárok, prohrál jsi! Pâiznej si to.
	AI_Output (self ,other,"DIA_Agon_GolemDead_ShutUp_07_02"); //Jenom mnê bylo osudem urèeno stát se mágem.
	
	Info_ClearChoices (DIA_Agon_GolemDead);
	Info_AddChoice (DIA_Agon_GolemDead,"Osud ti urèil leda políbit mi zadek. Truhla je moje.",DIA_Agon_GolemDead_ShutUp_MyChest);
	Info_AddChoice (DIA_Agon_GolemDead,"Vyhrál jsi.",DIA_Agon_GolemDead_ShutUp_YouWin);

};

FUNC VOID DIA_Agon_GolemDead_ShutUp_MyChest ()
{
	AI_Output (other,self ,"DIA_Agon_GolemDead_ShutUp_MyChest_15_00"); //Osud ti urèil leda políbit mi zadek. Truhla je moje.
	AI_Output (self ,other,"DIA_Agon_GolemDead_ShutUp_MyChest_07_01"); //(rozzlobenê) Ne, to teda ne, to tê spíš zabiju.
	
	AI_StopProcessInfos (self);	
	B_Attack (self,other,AR_NONE, 1);
};

FUNC VOID DIA_Agon_GolemDead_ShutUp_YouWin ()
{
	AI_Output (other,self ,"DIA_Agon_GolemDead_ShutUp_YouWin_15_00"); //Vyhrál jsi.
	AI_Output (self ,other,"DIA_Agon_GolemDead_ShutUp_YouWin_07_01"); //(zbêsile) Ne, mê neošálíš. Snažíš se mê zbavit.
	AI_Output (self ,other,"DIA_Agon_GolemDead_ShutUp_YouWin_07_02"); //To nedopustím!
	
	AI_StopProcessInfos (self);	
	B_Attack (self,other,AR_NONE, 1);
};

FUNC VOID DIA_Agon_GolemDead_Congrat ()
{
	AI_Output (other,self ,"DIA_Agon_GolemDead_Congrat_15_00"); //Gratuluji, vážnê sis to zasloužil.
	AI_Output (self ,other,"DIA_Agon_GolemDead_Congrat_07_01"); //(nedùvêâivê) Co to má znamenat? Co máš za lubem?
	AI_Output (other,self ,"DIA_Agon_GolemDead_Congrat_15_02"); //O èem to mluvíš?
	AI_Output (self ,other,"DIA_Agon_GolemDead_Congrat_07_03"); //(nervóznê) 
	AI_Output (self ,other,"DIA_Agon_GolemDead_Congrat_07_04"); //To se ti nikdy nepodaâí!
	
	AI_StopProcessInfos (self);	
	B_Attack (self,other,AR_NONE, 1);
};

//****************************************
//	Der Sc war vor Agon in der Höhle
//****************************************

INSTANCE DIA_Agon_GolemLives   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 1;
	condition   = DIA_Agon_GolemLives_Condition;
	information = DIA_Agon_GolemLives_Info;
	permanent   = FALSE;
	important 	= TRUE;
};

FUNC INT DIA_Agon_GolemLives_Condition()
{
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (Npc_IsDead (Magic_Golem)== FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Agon_GolemLives_Info()
{
	AI_Output (self ,other,"DIA_Agon_GolemLives_07_00"); //(pâekvapenê) Našel jsi ten úkryt pâede mnou. To nejde...
	AI_Output (self ,other,"DIA_Agon_GolemLives_07_01"); //(odhodlanê) Tak to nemùže zùstat! To nedovolím.
	AI_Output (self ,other,"DIA_Agon_GolemLives_07_02"); //Dokonce nikdy nenajdou tvou mrtvolu.
	
	AI_StopProcessInfos (self);
	B_Attack (self,other,AR_NONE, 0);
};

//****************************************
//	Sc hat Agon am Leben gelassen
//****************************************
/*
INSTANCE DIA_Agon_StillAlive   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 1;
	condition   = DIA_Agon_StillAlive_Condition;
	information = DIA_Agon_StillAlive_Info;
	permanent   = TRUE;
	description = "Was machst Du hier?";
};

FUNC INT DIA_Agon_StillAlive_Condition()
{
	if ((Kapitel >= 2)
	&& 	(hero.guild == GIL_KDF))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Agon_StillAlive_Info()
{
	AI_Output (other,self ,"DIA_Agon_StillAlive_15_00"); //Was machst Du hier? 
	AI_Output (self ,other,"DIA_Agon_StillAlive_07_01"); //Hättest Du mich nicht töten können? Dann müsste ich das ganze hier wenigstens nicht mehr ertragen. 
	AI_Output (self ,other,"DIA_Agon_StillAlive_07_02"); //Jetzt lass mich in Ruhe! Geh zurück ins Kloster!
	
	AI_StopProcessInfos (self);
};
*/
//***********************************************************************
// Perm
//***********************************************************************

INSTANCE DIA_Agon_Perm   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 2;
	condition   = DIA_Agon_Perm_Condition;
	information = DIA_Agon_Perm_Info;
	permanent   = TRUE;
	description = "Tak jak to vypadá?";
};

FUNC INT DIA_Agon_Perm_Condition()
{
	if (Kapitel >= 3)
	&& (other.guild != GIL_KDF)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Agon_Perm_Info()
{
	AI_Output	(other,self ,"DIA_Agon_Perm_15_00"); //Tak jak to jde?
	
	if (other.guild == GIL_PAL)
	{
		AI_Output	(self ,other,"DIA_Agon_Perm_07_01"); //Ach - díky za tvùj zájem, sire paladine. Práce se mi líbí a jsem si jist, že brzy budu vybrán mezi mágy.
	}
	else
	{
		AI_Output	(self ,other,"DIA_Agon_Perm_07_02"); //(arogantnê) Tady v Innosovê klášteâe jsi jenom hostem. Mêl by ses tedy podle toho chovat a nerušit mê v mé práci. Pâeji hezký den.
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Agon_PICKPOCKET (C_INFO)
{
	npc			= NOV_603_Agon;
	nr			= 900;
	condition	= DIA_Agon_PICKPOCKET_Condition;
	information	= DIA_Agon_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Agon_PICKPOCKET_Condition()
{
	C_Beklauen (23, 12);
};
 
FUNC VOID DIA_Agon_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Agon_PICKPOCKET);
	Info_AddChoice		(DIA_Agon_PICKPOCKET, DIALOG_BACK 		,DIA_Agon_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Agon_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Agon_PICKPOCKET_DoIt);
};

func void DIA_Agon_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Agon_PICKPOCKET);
};
	
func void DIA_Agon_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Agon_PICKPOCKET);
};


