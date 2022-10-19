// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Rupert_EXIT(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 999;
	condition	= DIA_Rupert_EXIT_Condition;
	information	= DIA_Rupert_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Rupert_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Rupert_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rupert_PICKPOCKET (C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 900;
	condition	= DIA_Rupert_PICKPOCKET_Condition;
	information	= DIA_Rupert_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Rupert_PICKPOCKET_Condition()
{
	C_Beklauen (18, 10);
};
 
FUNC VOID DIA_Rupert_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rupert_PICKPOCKET);
	Info_AddChoice		(DIA_Rupert_PICKPOCKET, DIALOG_BACK 		,DIA_Rupert_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rupert_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rupert_PICKPOCKET_DoIt);
};

func void DIA_Rupert_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Rupert_PICKPOCKET);
};
	
func void DIA_Rupert_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rupert_PICKPOCKET);
};
// ************************************************************
// 			  				   Hello 
// ************************************************************
INSTANCE DIA_Rupert_Hello(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 1;
	condition	= DIA_Rupert_Hello_Condition;
	information	= DIA_Rupert_Hello_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Rupert_Hello_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rupert_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Rupert_Hello_03_00"); //Witaj, nieznajomy!
	AI_Output (self ,other,"DIA_Rupert_Hello_03_01"); //Pewnie jeste� g�odny i spragniony - a mo�e zerkniesz okiem na moje towary?
};	

// ************************************************************
// 			  				 Zu Pal 
// ************************************************************
INSTANCE DIA_Rupert_ZuPal(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 1;
	condition	= DIA_Rupert_ZuPal_Condition;
	information	= DIA_Rupert_ZuPal_Info;
	permanent	= FALSE;
	description = "W�a�ciwie, to chcia�em si� widzie� z paladynami...";
};                       
FUNC INT DIA_Rupert_ZuPal_Condition()
{
	if (Kapitel < 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Rupert_ZuPal_Info()
{	
	AI_Output (other, self,"DIA_Rupert_ZuPal_15_00"); //W�a�ciwie, to chcia�em si� widzie� z paladynami...
	AI_Output (self ,other,"DIA_Rupert_ZuPal_03_01"); //Niewielka jest na to szansa. Od kiedy paladyni urz�dzili swoj� siedzib� w g�rnym mie�cie, ci�ko jest si� tam dosta�.
};	

// ************************************************************
// 			  			HelpMeIntoOV
// ************************************************************
INSTANCE DIA_Rupert_HelpMeIntoOV(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 1;
	condition	= DIA_Rupert_HelpMeIntoOV_Condition;
	information	= DIA_Rupert_HelpMeIntoOV_Info;
	permanent	= FALSE;
	description = "Czy mo�esz mi pom�c dosta� si� do g�rnego miasta?";
};                       
FUNC INT DIA_Rupert_HelpMeIntoOV_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Rupert_ZuPal))
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rupert_HelpMeIntoOV_Info()
{	
	AI_Output (other, self,"DIA_Rupert_HelpMeIntoOV_15_00"); //Czy mo�esz mi pom�c dosta� si� do g�rnego miasta?
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_01"); //Ja? Niemo�liwe, nie mam tu w�a�ciwie nic do powiedzenia.
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_02"); //W dolnej cz�ci miasta jest tylko kilka os�b, kt�rych wp�ywy mog�yby ci zapewni� wst�p do g�rnego miasta.
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_03"); //Jedn� z nich jest m�j szef, Matteo. To z nim powiniene� porozmawia�.
	
	Log_CreateTopic (TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_OV,LOG_RUNNING);
	B_LogEntry (TOPIC_OV,"Je�li chc� si� dosta� do g�rnego miasta, b�d� potrzebowa� pomocy jakiej� wp�ywowej osobisto�ci z dolnej cz�ci miasta.");
	B_LogEntry (TOPIC_OV,"Kupiec Matteo to jeden z bardziej wp�ywowych mieszka�c�w dolnej cz�ci miasta.");
};	

// ***************************************************************
//							WoMatteo
// ***************************************************************
INSTANCE DIA_Rupert_WoMatteo(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 1;
	condition	= DIA_Rupert_WoMatteo_Condition;
	information	= DIA_Rupert_WoMatteo_Info;
	permanent	= FALSE;
	description = "Gdzie go znajd�?";
};                      
FUNC INT DIA_Rupert_WoMatteo_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Rupert_HelpMeIntoOV))
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Rupert_WoMatteo_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_WoMatteo_15_00"); //Gdzie go znajd�?
	AI_Output (self ,other,"DIA_Rupert_WoMatteo_03_01"); //Stoisz w�a�nie przed jego sklepem. Prawie go nie opuszcza. Wejd� do �rodka.
	
	if (Knows_Matteo == FALSE)
	{
		Log_CreateTopic (TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry (TOPIC_CityTrader,"Sklep Mattea znajduje si� przy po�udniowej bramie miasta. Mo�na tam kupi� or�, �ywno�� oraz wyposa�enie.");
		Knows_Matteo = TRUE;
	};
};

// ***************************************************************
//							Wer hat Einflu�
// ***************************************************************
INSTANCE DIA_Rupert_WerEinfluss(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 2;
	condition	= DIA_Rupert_WerEinfluss_Condition;
	information	= DIA_Rupert_WerEinfluss_Info;
	permanent	= FALSE;
	description = "Jakich innych wp�ywowych obywateli mia�e� na my�li?";
};                      
FUNC INT DIA_Rupert_WerEinfluss_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Rupert_HelpMeIntoOV))
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Rupert_WerEinfluss_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_WerEinfluss_15_00"); //Jakich innych wp�ywowych obywateli mia�e� na my�li?
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_01"); //Najwa�niejszymi osobami w tej cz�ci miasta s� dzia�aj�cy na tej ulicy kupcy i rzemie�lnicy.
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_02"); //Powiniene� naj�� si� u kt�rego� jako czeladnik - tak jak ja.
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_03"); //Od kiedy pracuj� dla Mattea, miastowi nabrali do mnie szacunku.
	
	B_LogEntry (TOPIC_OV,"Spr�buj� zatrudni� si� jako czeladnik u jednego z mistrz�w.");
};

// ***************************************************************
//							Work
// ***************************************************************
INSTANCE DIA_Rupert_Work(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 3;
	condition	= DIA_Rupert_Work_Condition;
	information	= DIA_Rupert_Work_Info;
	permanent	= FALSE;
	description = "Potrzebuj� pieni�dzy. Szukam pracy.";
};                      
FUNC INT DIA_Rupert_Work_Condition()
{
	if (hero.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Rupert_Work_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_Work_15_00"); //Potrzebuj� pieni�dzy. Szukam pracy.
	AI_Output (self ,other,"DIA_Rupert_Work_03_01"); //S�ysza�em, �e Bosper ma jakie� problemy z zaopatrzeniem. Jego sklep znajduje si� kilka krok�w st�d.
	AI_Output (self ,other,"DIA_Rupert_Work_03_02"); //M�wi�, �e pono� dobrze p�aci.
};

// ***************************************************************
//							YourOffer
// ***************************************************************
INSTANCE DIA_Rupert_YourOffer(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 4;
	condition	= DIA_Rupert_YourOffer_Condition;
	information	= DIA_Rupert_YourOffer_Info;
	permanent	= FALSE;
	description = "Co chcesz mi zaproponowa�?";
};                      
FUNC INT DIA_Rupert_YourOffer_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Rupert_YourOffer_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_YourOffer_15_00"); //Co sprzedajesz?
	AI_Output (self ,other,"DIA_Rupert_YourOffer_03_01"); //W tej chwili wyb�r jest niewielki.
	if (hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG)
	{ 
		AI_Output (self ,other,"DIA_Rupert_YourOffer_03_02"); //Ten cholerny w�a�ciciel ziemski przerwa� dostawy, a to co skupujemy z ma�ych farm, nie wystarcza, by zaspokoi� potrzeby miasta.
	};
};

// ************************************************************
//								Trade
// ************************************************************
INSTANCE DIA_Rupert_Trade(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 900;
	condition	= DIA_Rupert_Trade_Condition;
	information	= DIA_Rupert_Trade_Info;
	permanent	= TRUE;
	description = "Poka� mi swoje towary.";
	trade		= TRUE;
};                       
FUNC INT DIA_Rupert_Trade_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Rupert_YourOffer))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Rupert_Trade_Info()
{	
	if (Npc_HasItems (self, itfo_cheese) < 5)
	{
		CreateInvItems (self, ItFo_cheese, 5);
	};
	
	AI_Output (other,self ,"DIA_Rupert_Trade_15_00"); //Poka� mi swoje towary.
	if (hero.guild == GIL_KDF)
	|| (hero.guild == GIL_PAL)
	{
		AI_Output (self,other,"DIA_Rupert_Trade_03_01"); //Musisz mi wybaczy� niewielki wyb�r, cz�owiek z twoj� pozycj� z pewno�ci� przywyk� do czego� wi�cej.
	};
};

// ************************************************************
// 			  				 Bauernaufstand
// ************************************************************
INSTANCE DIA_Rupert_Bauernaufstand(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 4;
	condition	= DIA_Rupert_Bauernaufstand_Condition;
	information	= DIA_Rupert_Bauernaufstand_Info;
	permanent	= FALSE;
	description = "Powiedz mi prosz� co� wi�cej o buncie ch�op�w.";
};                       
FUNC INT DIA_Rupert_Bauernaufstand_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Rupert_YourOffer))
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rupert_Bauernaufstand_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_Bauernaufstand_15_00"); //Powiedz mi prosz� co� wi�cej o buncie ch�op�w.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_01"); //To do�� proste: Onar, bogaty w�a�ciciel ziemski, przesta� p�aci� miastu podatki.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_02"); //Wyobra� sobie! Jeste�my w stanie wojny z orkami, a ten snob chce zagarn�� wszystko dla siebie.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_03"); //W zwyk�ych okoliczno�ciach stra� miejska szybko zaj�aby si� t� spraw�.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_04"); //Ale uwa�aj, bo teraz b�dzie najlepsze: powiadaj�, �e Onar zatrudni� najemnik�w, kt�rych zadaniem jest odp�dzanie oddzia��w stra�y miejskiej!
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_05"); //NAJEMNICY! M�wi� ci, to wszystko sko�czy si� wojn�! Jakby JEDNEJ by�o nam za ma�o!
};

// ***************************************************************
//							S�ldner
// ***************************************************************
INSTANCE DIA_Rupert_Mercs(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 4;
	condition	= DIA_Rupert_Mercs_Condition;
	information	= DIA_Rupert_Mercs_Info;
	permanent	= FALSE;
	description = "Co wiesz o najemnikach Onara?";
};                       
FUNC INT DIA_Rupert_Mercs_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Rupert_Bauernaufstand))
	&& (hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rupert_Mercs_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_Mercs_15_00"); //Co wiesz o najemnikach Onara?
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_01"); //S�ysza�em, �e wi�kszo�� z nich to byli skaza�cy z kolonii g�rniczej.
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_02"); //Ich przyw�dca by� chyba jak�� grub� ryb� na kr�lewskim dworze - genera�em, czy kim� takim. Wygnano go jako zdrajc�.
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_03"); //Ci�kie czasy nasta�y.
};



