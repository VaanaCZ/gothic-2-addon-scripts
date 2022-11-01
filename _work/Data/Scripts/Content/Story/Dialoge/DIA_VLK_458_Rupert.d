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
	AI_Output (self ,other,"DIA_Rupert_Hello_03_01"); //Pewnie jesteś głodny i spragniony - a może zerkniesz okiem na moje towary?
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
	description = "Właściwie, to chciałem się widzieć z paladynami...";
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
	AI_Output (other, self,"DIA_Rupert_ZuPal_15_00"); //Właściwie, to chciałem się widzieć z paladynami...
	AI_Output (self ,other,"DIA_Rupert_ZuPal_03_01"); //Niewielka jest na to szansa. Od kiedy paladyni urządzili swoją siedzibę w górnym mieście, ciężko jest się tam dostać.
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
	description = "Czy możesz mi pomóc dostać się do górnego miasta?";
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
	AI_Output (other, self,"DIA_Rupert_HelpMeIntoOV_15_00"); //Czy możesz mi pomóc dostać się do górnego miasta?
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_01"); //Ja? Niemożliwe, nie mam tu właściwie nic do powiedzenia.
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_02"); //W dolnej części miasta jest tylko kilka osób, których wpływy mogłyby ci zapewnić wstęp do górnego miasta.
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_03"); //Jedną z nich jest mój szef, Matteo. To z nim powinieneś porozmawiać.
	
	Log_CreateTopic (TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_OV,LOG_RUNNING);
	B_LogEntry (TOPIC_OV,"Jeśli chcę się dostać do górnego miasta, będę potrzebował pomocy jakiejś wpływowej osobistości z dolnej części miasta.");
	B_LogEntry (TOPIC_OV,"Kupiec Matteo to jeden z bardziej wpływowych mieszkańców dolnej części miasta.");
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
	description = "Gdzie go znajdę?";
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
	AI_Output (other,self ,"DIA_Rupert_WoMatteo_15_00"); //Gdzie go znajdę?
	AI_Output (self ,other,"DIA_Rupert_WoMatteo_03_01"); //Stoisz właśnie przed jego sklepem. Prawie go nie opuszcza. Wejdź do środka.
	
	if (Knows_Matteo == FALSE)
	{
		Log_CreateTopic (TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry (TOPIC_CityTrader,"Sklep Mattea znajduje się przy południowej bramie miasta. Można tam kupić oręż, żywność oraz wyposażenie.");
		Knows_Matteo = TRUE;
	};
};

// ***************************************************************
//							Wer hat Einfluß
// ***************************************************************
INSTANCE DIA_Rupert_WerEinfluss(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 2;
	condition	= DIA_Rupert_WerEinfluss_Condition;
	information	= DIA_Rupert_WerEinfluss_Info;
	permanent	= FALSE;
	description = "Jakich innych wpływowych obywateli miałeś na myśli?";
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
	AI_Output (other,self ,"DIA_Rupert_WerEinfluss_15_00"); //Jakich innych wpływowych obywateli miałeś na myśli?
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_01"); //Najważniejszymi osobami w tej części miasta są działający na tej ulicy kupcy i rzemieślnicy.
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_02"); //Powinieneś nająć się u któregoś jako czeladnik - tak jak ja.
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_03"); //Od kiedy pracuję dla Mattea, miastowi nabrali do mnie szacunku.
	
	B_LogEntry (TOPIC_OV,"Spróbuję zatrudnić się jako czeladnik u jednego z mistrzów.");
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
	description = "Potrzebuję pieniędzy. Szukam pracy.";
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
	AI_Output (other,self ,"DIA_Rupert_Work_15_00"); //Potrzebuję pieniędzy. Szukam pracy.
	AI_Output (self ,other,"DIA_Rupert_Work_03_01"); //Słyszałem, że Bosper ma jakieś problemy z zaopatrzeniem. Jego sklep znajduje się kilka kroków stąd.
	AI_Output (self ,other,"DIA_Rupert_Work_03_02"); //Mówią, że ponoć dobrze płaci.
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
	description = "Co chcesz mi zaproponować?";
};                      
FUNC INT DIA_Rupert_YourOffer_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Rupert_YourOffer_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_YourOffer_15_00"); //Co sprzedajesz?
	AI_Output (self ,other,"DIA_Rupert_YourOffer_03_01"); //W tej chwili wybór jest niewielki.
	if (hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG)
	{ 
		AI_Output (self ,other,"DIA_Rupert_YourOffer_03_02"); //Ten cholerny właściciel ziemski przerwał dostawy, a to co skupujemy z małych farm, nie wystarcza, by zaspokoić potrzeby miasta.
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
	description = "Pokaż mi swoje towary.";
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
	
	AI_Output (other,self ,"DIA_Rupert_Trade_15_00"); //Pokaż mi swoje towary.
	if (hero.guild == GIL_KDF)
	|| (hero.guild == GIL_PAL)
	{
		AI_Output (self,other,"DIA_Rupert_Trade_03_01"); //Musisz mi wybaczyć niewielki wybór, człowiek z twoją pozycją z pewnością przywykł do czegoś więcej.
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
	description = "Powiedz mi proszę coś więcej o buncie chłopów.";
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
	AI_Output (other,self ,"DIA_Rupert_Bauernaufstand_15_00"); //Powiedz mi proszę coś więcej o buncie chłopów.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_01"); //To dość proste: Onar, bogaty właściciel ziemski, przestał płacić miastu podatki.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_02"); //Wyobraź sobie! Jesteśmy w stanie wojny z orkami, a ten snob chce zagarnąć wszystko dla siebie.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_03"); //W zwykłych okolicznościach straż miejska szybko zajęłaby się tą sprawą.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_04"); //Ale uważaj, bo teraz będzie najlepsze: powiadają, że Onar zatrudnił najemników, których zadaniem jest odpędzanie oddziałów straży miejskiej!
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_05"); //NAJEMNICY! Mówię ci, to wszystko skończy się wojną! Jakby JEDNEJ było nam za mało!
};

// ***************************************************************
//							Söldner
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
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_01"); //Słyszałem, że większość z nich to byli skazańcy z kolonii górniczej.
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_02"); //Ich przywódca był chyba jakąś grubą rybą na królewskim dworze - generałem, czy kimś takim. Wygnano go jako zdrajcę.
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_03"); //Ciężkie czasy nastały.
};



