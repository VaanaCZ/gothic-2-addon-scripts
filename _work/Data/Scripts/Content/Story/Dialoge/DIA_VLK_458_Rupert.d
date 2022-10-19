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
	AI_Output (self ,other,"DIA_Rupert_Hello_03_01"); //Pewnie jesteœ g³odny i spragniony - a mo¿e zerkniesz okiem na moje towary?
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
	description = "W³aœciwie, to chcia³em siê widzieæ z paladynami...";
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
	AI_Output (other, self,"DIA_Rupert_ZuPal_15_00"); //W³aœciwie, to chcia³em siê widzieæ z paladynami...
	AI_Output (self ,other,"DIA_Rupert_ZuPal_03_01"); //Niewielka jest na to szansa. Od kiedy paladyni urz¹dzili swoj¹ siedzibê w górnym mieœcie, ciê¿ko jest siê tam dostaæ.
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
	description = "Czy mo¿esz mi pomóc dostaæ siê do górnego miasta?";
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
	AI_Output (other, self,"DIA_Rupert_HelpMeIntoOV_15_00"); //Czy mo¿esz mi pomóc dostaæ siê do górnego miasta?
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_01"); //Ja? Niemo¿liwe, nie mam tu w³aœciwie nic do powiedzenia.
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_02"); //W dolnej czêœci miasta jest tylko kilka osób, których wp³ywy mog³yby ci zapewniæ wstêp do górnego miasta.
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_03"); //Jedn¹ z nich jest mój szef, Matteo. To z nim powinieneœ porozmawiaæ.
	
	Log_CreateTopic (TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_OV,LOG_RUNNING);
	B_LogEntry (TOPIC_OV,"Jeœli chcê siê dostaæ do górnego miasta, bêdê potrzebowa³ pomocy jakiejœ wp³ywowej osobistoœci z dolnej czêœci miasta.");
	B_LogEntry (TOPIC_OV,"Kupiec Matteo to jeden z bardziej wp³ywowych mieszkañców dolnej czêœci miasta.");
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
	description = "Gdzie go znajdê?";
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
	AI_Output (other,self ,"DIA_Rupert_WoMatteo_15_00"); //Gdzie go znajdê?
	AI_Output (self ,other,"DIA_Rupert_WoMatteo_03_01"); //Stoisz w³aœnie przed jego sklepem. Prawie go nie opuszcza. WejdŸ do œrodka.
	
	if (Knows_Matteo == FALSE)
	{
		Log_CreateTopic (TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry (TOPIC_CityTrader,"Sklep Mattea znajduje siê przy po³udniowej bramie miasta. Mo¿na tam kupiæ orê¿, ¿ywnoœæ oraz wyposa¿enie.");
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
	description = "Jakich innych wp³ywowych obywateli mia³eœ na myœli?";
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
	AI_Output (other,self ,"DIA_Rupert_WerEinfluss_15_00"); //Jakich innych wp³ywowych obywateli mia³eœ na myœli?
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_01"); //Najwa¿niejszymi osobami w tej czêœci miasta s¹ dzia³aj¹cy na tej ulicy kupcy i rzemieœlnicy.
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_02"); //Powinieneœ naj¹æ siê u któregoœ jako czeladnik - tak jak ja.
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_03"); //Od kiedy pracujê dla Mattea, miastowi nabrali do mnie szacunku.
	
	B_LogEntry (TOPIC_OV,"Spróbujê zatrudniæ siê jako czeladnik u jednego z mistrzów.");
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
	description = "Potrzebujê pieniêdzy. Szukam pracy.";
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
	AI_Output (other,self ,"DIA_Rupert_Work_15_00"); //Potrzebujê pieniêdzy. Szukam pracy.
	AI_Output (self ,other,"DIA_Rupert_Work_03_01"); //S³ysza³em, ¿e Bosper ma jakieœ problemy z zaopatrzeniem. Jego sklep znajduje siê kilka kroków st¹d.
	AI_Output (self ,other,"DIA_Rupert_Work_03_02"); //Mówi¹, ¿e ponoæ dobrze p³aci.
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
	description = "Co chcesz mi zaproponowaæ?";
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
		AI_Output (self ,other,"DIA_Rupert_YourOffer_03_02"); //Ten cholerny w³aœciciel ziemski przerwa³ dostawy, a to co skupujemy z ma³ych farm, nie wystarcza, by zaspokoiæ potrzeby miasta.
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
	description = "Poka¿ mi swoje towary.";
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
	
	AI_Output (other,self ,"DIA_Rupert_Trade_15_00"); //Poka¿ mi swoje towary.
	if (hero.guild == GIL_KDF)
	|| (hero.guild == GIL_PAL)
	{
		AI_Output (self,other,"DIA_Rupert_Trade_03_01"); //Musisz mi wybaczyæ niewielki wybór, cz³owiek z twoj¹ pozycj¹ z pewnoœci¹ przywyk³ do czegoœ wiêcej.
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
	description = "Powiedz mi proszê coœ wiêcej o buncie ch³opów.";
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
	AI_Output (other,self ,"DIA_Rupert_Bauernaufstand_15_00"); //Powiedz mi proszê coœ wiêcej o buncie ch³opów.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_01"); //To doœæ proste: Onar, bogaty w³aœciciel ziemski, przesta³ p³aciæ miastu podatki.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_02"); //WyobraŸ sobie! Jesteœmy w stanie wojny z orkami, a ten snob chce zagarn¹æ wszystko dla siebie.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_03"); //W zwyk³ych okolicznoœciach stra¿ miejska szybko zajê³aby siê t¹ spraw¹.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_04"); //Ale uwa¿aj, bo teraz bêdzie najlepsze: powiadaj¹, ¿e Onar zatrudni³ najemników, których zadaniem jest odpêdzanie oddzia³ów stra¿y miejskiej!
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_05"); //NAJEMNICY! Mówiê ci, to wszystko skoñczy siê wojn¹! Jakby JEDNEJ by³o nam za ma³o!
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
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_01"); //S³ysza³em, ¿e wiêkszoœæ z nich to byli skazañcy z kolonii górniczej.
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_02"); //Ich przywódca by³ chyba jak¹œ grub¹ ryb¹ na królewskim dworze - genera³em, czy kimœ takim. Wygnano go jako zdrajcê.
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_03"); //Ciê¿kie czasy nasta³y.
};



